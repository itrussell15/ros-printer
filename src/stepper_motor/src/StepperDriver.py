#!/usr/bin/env python3
import dataclasses

import rospy
import RPi.GPIO as GPIO
import enum, time
import numpy as np

from std_msgs.msg import Int64, Bool
import stepper_motor.msg as stepper_msgs
from rospy_message_converter import message_converter

class Direction(enum.Enum):
    COUNTER_CLOCK = 0
    CLOCKWISE = 1

class UnitSystem(enum.Enum):
    MM = 0
    IN = 1

class MoveType(enum.Enum):

    AbsoluteMove = 0
    RelativeMove = 1

class StepperType(enum.Enum):

    Stepper=1
    LinearStepper=2

def convert(amount, from_unit, to_unit):
    def in_to_mm(amount):
        return amount * 25.4

    def mm_to_in(amount):
        return amount / 25.4

    def same_to_same(amount):
        return amount

    convert_map = {
        UnitSystem.IMPERIAL: {
            UnitSystem.METRIC: in_to_mm,
            UnitSystem.IMPERIAL: same_to_same
        },
        UnitSystem.METRIC: {
            UnitSystem.IMPERIAL: mm_to_in,
            UnitSystem.METRIC: same_to_same
        }
    }

    return convert_map[from_unit][to_unit](amount)

class Stepper:

    # TODO Create this based on the input config data
    def __init__(
            self,
            dir_pin,
            step_pin,
            speed = 100, # RPM
            accel = 15, # RPM^2
            deccel = None,
            max_speed = 120,
            min_speed = 1,
            steps_per_rev = None,
            **kwargs
    ):

        self.DIR_PIN = dir_pin
        self.STEP_PIN = step_pin

        self.STEPS_PER_REV = steps_per_rev

        self.MIN_SPEED = min_speed
        self.MAX_SPEED = max_speed

        self._speed = speed
        self.accel = accel
        self.deccel = accel if deccel is None else deccel

        self._delay = self.RPM_to_Rate(speed)

        GPIO.setwarnings(False)
        GPIO.setmode(GPIO.BOARD)
        GPIO.setup(self.DIR_PIN , GPIO.OUT)
        GPIO.setup(self.STEP_PIN, GPIO.OUT)

        self._steps = 0
        self.__dict__.update(kwargs)

    def __repr__(self):
        return f"StepperMotor(pos:{self.steps}, STEP_PIN:{self.STEP_PIN}, DIR_PIN:{self.DIR_PIN})"

    def _move_turns(self, turns):
        steps = int(turns * self.STEPS_PER_REV)
        return self.move_rel(steps)

    def move_rel(self, steps):
        direction = Direction.CLOCKWISE if steps > 0 else Direction.COUNTER_CLOCK
        output = self._move(abs(steps), direction)

        if output:
            self._steps += steps

        return output

    def move_abs(self, position: int):

        delta = self.steps - position
        direction = Direction.COUNTER_CLOCK if self.steps > position else Direction.CLOCKWISE

        output = self._move(amount = delta, direction = direction)

        if output:
            self._steps = position

        return output

    def _move(self, amount: int, direction: Direction) -> bool:

        if amount == 0:
            rospy.loginfo(f"*{self.name}* - Motor Already at {self.steps}, no action taken")
            return True

        if amount < 0:
            amount = abs(amount)

        GPIO.output(self.DIR_PIN, direction.value)
        delay_profile = self.move_profile(amount)

        n = 0
        while n != amount-1:
            GPIO.output(self.STEP_PIN, True)
            time.sleep(delay_profile[n])
            n += 1
            GPIO.output(self.STEP_PIN, False)
        return True

    def move_profile(self, amount):
        velocity_profile = self.determine_speed(amount)
        return self.RPM_to_Rate(velocity_profile)

    def rel_move_time(self, amount):
        return self.move_profile(amount).sum()

    def abs_move_time(self, new_position):
        delta = new_position - self.steps
        return self.move_profile(delta).sum()

    def determine_speed(self, amount):
        path = np.full((amount), fill_value=self.speed)
        ramp_up = np.arange(0, self.speed, self.accel)
        ramp_down = np.arange(self.speed, 0, -self.deccel)
        # print(f"Speed: {self.speed}, Accel: {self.accel}, Deccel: {self.deccel}, RampUp Profile: {ramp_up}, RampDown Profile: {ramp_down}")

        if len(ramp_up) + len(ramp_down) < len(path):
            path[:len(ramp_up)] = ramp_up
            path[-len(ramp_down):] = ramp_down
        else:
            raise NotImplementedError('Determine how to handle acceleration/decceleration with short moves')

        return np.clip(path, a_min = self.MIN_SPEED, a_max=self.MAX_SPEED)

    def RPM_to_Rate(self, rpm):
        steps_per_min = self.revToSteps(rpm)
        steps_per_second = steps_per_min/60
        return 1 / steps_per_second

    def stepsToRev(self, steps):
        return steps/self.STEPS_PER_REV

    def revToSteps(self, revs):
        if isinstance(revs, np.ndarray):
            return (revs * self.STEPS_PER_REV).astype(np.int64)
        else:
            return int(revs * self.STEPS_PER_REV)

    def set_speed(self, new_speed):
        self._speed = np.clip(new_speed, a_min = self.MIN_SPEED, a_max = self.MAX_SPEED)

    @property
    def steps(self):
        return self._steps

    @property
    def speed(self):
        return self._speed

class LinearStepper(Stepper):

    def __init__(
            self,
            dir_pin,
            step_pin,
            distance_per_turn,
            length=None, # Units
            speed=100,
            accel=15,
            deccel=None,
            units=UnitSystem.IN,
            steps_per_rev=200,
            max_speed=120,
            min_speed=1,
            **kwargs
    ):

        super().__init__(
            dir_pin,
            step_pin,
            speed,
            accel,
            deccel,
            max_speed,
            min_speed,
            steps_per_rev
        )

        self.length = length
        self._distance_per_turn = distance_per_turn

        if type(units) != UnitSystem:
            self.units = UnitSystem[units]
        else:
            self.units = units

    def __repr__(self):
        return f"{self.units.name}LinearStepper(DistPerTurn: {self._distance_per_turn}, pos:{self.steps}, STEP_PIN:{self.STEP_PIN}, DIR_PIN:{self.DIR_PIN})"

    def move_abs(self, new_position, units = None):
        rospy.loginfo(f'Units -- {self.units} -- New Position: {new_position} -- Current Position: {self.position}')
        if new_position == self.position:
            rospy.loginfo(f"Position is already {self.position}, no move needed")
            return True

        delta = new_position - self.position
        return self._move_distance(delta)

    def move_rel(self, distance, units = None):
        return self._move_distance(distance, units)

    def _move_distance(self, distance, distance_units = None):
        # Use the same units as provided
        if distance_units is None:
            units = self.units

        # Handle mismatched units
        if units != self.units:
            distance = convert(distance, distance_units, self.units)

        turns = distance / self._distance_per_turn
        return self._move_turns(turns)

    def _move_turns(self, turns):
        steps = int(turns * self.STEPS_PER_REV)
        return super().move_rel(steps)

    def rel_move_time(self, distance):
        steps = (distance / self._distance_per_turn) * self.STEPS_PER_REV
        return super().rel_move_time(steps)

    def abs_move_time(self, new_position):
        delta = new_position - self.position
        return self.rel_move_time(delta)

    def linear_to_RPM(self, lin_speed):
        rev_per_second = lin_speed / self._distance_per_turn
        return rev_per_second * 60

    def set_speed(self, new_speed):
        """
        MUST PASS IN AT units / s
        :param new_speed: units / s
        :return:
        """
        new_speed_rpm = self.linear_to_RPM(new_speed)
        super().set_speed(new_speed_rpm)

    @property
    def position(self):
        return self._distance_per_turn * (self.steps / self.STEPS_PER_REV)

    @property
    def linear_speed(self):
        "Linear speed of screw drive in *units* per second"
        rev_per_second = self.speed / 60
        return rev_per_second * self._distance_per_turn

class ROS_Stepper(Stepper):
    """
    Manages interface with ros and stepper motor
    """

    def __init__(self, name, listen_node, stepper_type, config):

        if stepper_type == StepperType.Stepper:
            self._config_msg = stepper_msgs.StepperConfig
            self._move_msg = stepper_msgs.StepperMove
        elif stepper_type == StepperType.LinearStepper:
            self._config_msg = stepper_msgs.LinearStepperConfig
            self._move_msg = stepper_msgs.LinearStepperMove
        else:
            raise TypeError(f"{stepper_type} is unrecognized")

        if not config:
            rospy.loginfo(f"{name} waiting for motor config on {name}_config")
            self._config = rospy.wait_for_message(f'{name}_config', self._config_msg)
            rospy.loginfo(f"{name} received config file")
        else:
            rospy.loginfo(f"Config file passed into {name}")

        self.name = name
        self.listen_node = listen_node
        rospy.loginfo(f"Starting {name} listening on {listen_node}")
        rospy.Subscriber(f"{self.listen_node}", self._move_msg, self.move_callback)
        # self.position = rospy.Publisher(f"{self.name}_pos", )
        self.in_motion = rospy.Publisher(f"{self.name}_in_motion", Bool, queue_size=10)

    def _move(self, amount: int, direction: Direction) -> bool:
        if amount != self.steps:
            self.in_motion.publish(True)
            super()._move(amount, direction)
            self.in_motion.publish(False)
        else:
            rospy.loginfo(f"*{self.name}* - Motor Already at {self.steps}, no action taken")

class StepperNode(ROS_Stepper, Stepper):

    def __init__(self, name, listen_node, config = None):
        ROS_Stepper.__init__(
            self,
            name = name,
            listen_node= listen_node,
            config = config,
            stepper_type=StepperType.Stepper
        )

        config_dict = message_converter.convert_ros_message_to_dictionary(config)
        Stepper.__init__(self, **config_dict)

    def set_speed(self, new_speed):
        Stepper.set_speed(self, new_speed)
        rospy.loginfo(f"*{self.name}* - Speed set to {self.speed}")

    # TODO Add move types based on message received
    def move_callback(self, msg: stepper_msgs.LinearStepperMove):

        self.set_speed(msg.speed)

        move_type = MoveType[msg.move_type]
        if move_type == MoveType.AbsoluteMove:
            rospy.loginfo(f"*{self.name}* - Absolute Move to {msg.position}, Speed: {msg.speed} {self.units.name}/s")
            self.move_abs(msg.position)
        elif move_type == MoveType.RelativeMove:
            rospy.loginfo(f"*{self.name}* - Relative Move of {msg.position}, Speed: {msg.speed} {self.units.name}/s")
            self.move_rel(msg.posititon)
        else:
            raise TypeError(f"Invalid Move Type of {move_type}")

class LinearStepperNode(ROS_Stepper, LinearStepper):

    def __init__(self, name, listen_node, config = None):

        ROS_Stepper.__init__(
            self,
            name=name,
            listen_node=listen_node,
            config=config,
            stepper_type=StepperType.LinearStepper
        )
        config_dict = message_converter.convert_ros_message_to_dictionary(config)
        LinearStepper.__init__(self, **config_dict)

    def set_speed(self, new_speed):
        LinearStepper.set_speed(self, new_speed)
        rospy.loginfo(f"*{self.name}* - Speed: RPM-{self.speed:.2f} Linear-{self.linear_speed:.2f} {self.units.name.lower()}/s")

    # TODO Add move types based on message received
    def move_callback(self, msg: stepper_msgs.LinearStepperMove):

        rospy.loginfo(f"Message Recieved: {msg}")

        self.set_speed(msg.speed)

        move_type = MoveType[msg.move_type]
        if move_type == MoveType.AbsoluteMove:
            rospy.loginfo(f"*{self.name}* - Absolute Move to {msg.position:.2f}, Speed: {msg.speed} {self.units.name.lower()}/s")
            self.move_abs(msg.position, UnitSystem[msg.units])
        elif move_type == MoveType.RelativeMove:
            rospy.loginfo(f"*{self.name}* - Relative Move of {msg.position:.2f}, Speed: {msg.speed} {self.units.name.lower()}/s")
            self.move_rel(msg.posititon, UnitSystem[msg.units])
        else:
            raise TypeError(f"Invalid Move Type of {move_type}")


# if __name__ == "__main__":
#
#     rospy.init_node(f'motor_controller')
#     rospy.loginfo(f"Starting Stepper Motor Contoller")
#
#     stepperR = StepperNode("/steppers/right", "/steppers/cmd_right")
#     stepperL = StepperNode("/steppers/left", "/steppers/cmd_left")
#
#     rospy.spin()

    # stepperR = ScrewDriveStepperNode("right_stepper", "cmd_right", 40, 38, speed=120, lead = 0.33)
    # stepperR.move_abs(1)
    # time.sleep(1)
    # stepperR.move_abs(-2)
    #
    # # print(stepperR)
    #
    # # stepperL = StepperNode("left_stepper", "cmd_left", 37, 35)
    # stepperL = ScrewDriveStepperNode("left_stepper", "cmd_left", 37, 35, accel=30, lead=0.5)
    # stepperL.move_abs(1)
    # time.sleep(1)
    # stepperL.move_abs(-1)


    # rospy.spin()