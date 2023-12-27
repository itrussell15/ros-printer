#!/usr/bin/env python3

import rospy
import RPi.GPIO as GPIO
import enum, time
import numpy as np

from std_msgs.msg import Int64, Bool
import stepper_motor.msg as stepper_msgs

class Direction(enum.Enum):
    COUNTER_CLOCK = 0
    CLOCKWISE = 1

class UnitSystem(enum.Enum):
    METRIC = 0
    IMPERIAL = 1

class Stepper:

    # TODO Create this based on the input config data
    def __init__(
            self,
            DIR_PIN,
            STEP_PIN,
            speed = 100, # RPM
            accel = 15, # RPM^2
            deccel = None,
            max_speed = 120,
            min_speed = 1,
            steps_per_rev = None
    ):

        self.DIR_PIN = DIR_PIN
        self.STEP_PIN = STEP_PIN

        self.STEPS_PER_REV = steps_per_rev

        self.MIN_SPEED = min_speed
        self.MAX_SPEED = max_speed

        self._speed = speed
        self.accel = accel
        self.deccel = accel if deccel is None else deccel

        self._delay = self.RPM_to_Rate(speed)

        GPIO.setwarnings(False)
        GPIO.setmode(GPIO.BOARD)
        GPIO.setup(DIR_PIN, GPIO.OUT)
        GPIO.setup(STEP_PIN, GPIO.OUT)

        self._steps = 0

    def __repr__(self):
        return f"StepperMotor(pos:{self.steps}, STEP_PIN:{self.STEP_PIN}, DIR_PIN:{self.DIR_PIN})"

    def move_turns(self, turns):
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

class ScrewDriveStepper(Stepper):
    """
    For steppers with screw drives!
    """
    # TODO Create config for this
    def __init__(
            self,
            DIR_PIN,
            STEP_PIN,
            lead = None,
            length = None, # Inches
            speed=100,
            accel=15,
            deccel=None,
            units = UnitSystem.IMPERIAL,
            steps_per_rev = 200,
            max_speed = 120,
            min_speed = 1
        ):

        super().__init__(
            DIR_PIN,
            STEP_PIN,
            speed,
            accel,
            deccel,
            max_speed,
            min_speed,
            steps_per_rev
        )

        self.screw = self.LeadScrew(
            lead = lead,
            length = length,
            units = units
        )

    def __repr__(self):
        return f"LeadScrewStepper(Lead:{self.screw.lead}, pos:{self.position}, STEP_PIN:{self.STEP_PIN}, DIR_PIN:{self.DIR_PIN})"

    def move_distance(self, distance, distance_units = None):
        # Use the same units as the screw
        if distance_units is None:
            units = self.screw.units

        # Handle mismatched units
        if units != self.screw.units:
            distance = self.screw.convert(distance, distance_units, self.screw.units)

        turns = self._turns_from_distance(distance)
        return self.move_turns(turns)

    def move_abs(self, new_position):
        if new_position == self.position:
            rospy.logwarn(f"Position is already {self.position}, no move needed")
            return True

        delta = new_position - self.position
        return self.move_distance(delta)

    def rel_move_time(self, distance):
        steps = self._turns_from_distance(distance) * self.STEPS_PER_REV
        return super().rel_move_time(steps)

    def abs_move_time(self, new_position):
        delta = new_position - self.position
        return self.rel_move_time(delta)

    def _turns_from_distance(self, distance):
        return distance / self.screw.lead

    @property
    def position(self):
        return (self.steps / self.STEPS_PER_REV) * self.screw.lead

    @property
    def linear_speed(self):
        "Linear speed of screw drive in *units* per second"

        rev_per_second = self.speed / 60
        return rev_per_second * self.screw.lead

    class LeadScrew:

        def __init__(
                self,
                length = None,
                units = UnitSystem.IMPERIAL,
                lead = None
        ):

            self.units = units
            self.length = length

            if lead is not None:
                self._lead = lead
            else:
                raise ValueError(f"No value for lead screw lead was passed in")

        def __repr__(self):
            unit = "in" if self.units == UnitSystem.IMPERIAL else "mm"
            return f"LeadScrew(Lead: {self.lead} {unit}/turn, Length: {self.length} {unit})"

        def _compute_lead(self, pitch, starts):
            return pitch * starts

        def convert(self, amount, from_unit, to_unit):

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

        @property
        def lead(self):
            """
            Distance traveled in a single turn
            :return: Lead of screw
            """
            return self._lead

class StepperNode(Stepper):

    def __init__(self, name, listen_node, config = None):

        if not config:
            rospy.loginfo(f"{name} waiting for motor config on {name}_config")
            config = rospy.wait_for_message(f'{name}_config', stepper_msgs.StepperConfig)
            rospy.loginfo(f"{name} received config file")
        else:
            rospy.loginfo(f"Config file passed into {name}")

        super().__init__(
            DIR_PIN=config.dir_pin,
            STEP_PIN=config.step_pin,
            speed=config.set_speed,
            accel=config.accel,
            deccel=config.deccel,
            max_speed=config.max_speed,
            min_speed=config.min_speed,
            steps_per_rev=config.steps_per_rev
        )

        self.name = name
        self.listen_node = listen_node
        rospy.loginfo(f"Starting {name} listening on {listen_node}")

        rospy.Subscriber(f"{self.listen_node}", stepper_msgs.AbsoluteMove, self.abs_callback)
        # rospy.Subscriber(f"{self.listen_node}_rel", stepper_msgs.RelativeMove, self.rel_callback)

    def abs_callback(self, msg: stepper_msgs.AbsoluteMove):
        rospy.loginfo(f"*{self.name}* - Moving to {msg.abs_position}, Speed: {msg.speed}")
        self.set_speed(msg.speed)
        self.move_abs(msg.abs_position)

    # def rel_callback(self, msg: stepper_msgs.RelativeMove):
    #     rospy.loginfo(f"*{self.name}* - Relative Move of {msg.rel_position}, Speed: {msg.speed}")
    #     self.set_speed(msg.speed)
    #     self.move_rel(msg.rel_steps)

class ScrewDriveStepperNode(ScrewDriveStepper):

    def __init__(self, name, listen_node, config = None):

        if not config:
            rospy.loginfo(f"{name} waiting for motor config on {name}_config")
            config = rospy.wait_for_message(f'{name}_config', stepper_msgs.LeadScrewStepperConfig)
            rospy.loginfo(f"{name} received config file {config}")
        else:
            rospy.loginfo(f"Config file passed into {name}")

        super().__init__(
            config.dir_pin,
            config.step_pin,
            lead=config.lead,
            length=config.length,  # Inches
            speed=config.set_speed,
            accel=config.accel,
            deccel=config.deccel,
            units=UnitSystem[config.unit],
            steps_per_rev=config.steps_per_rev,
            max_speed=config.max_speed,
            min_speed=config.min_speed
        )

        self.name = name
        rospy.loginfo(f"Starting {name} listening on {listen_node}")
        self.listen_node = listen_node
        rospy.Subscriber(f"{self.listen_node}", stepper_msgs.LinearAbsoluteMove, self.move_callback)

        # TODO Override base move and add ros publishing in there.
        self.pub = rospy.Publisher(f"{self.name}_in_motion", Bool, queue_size = 10)

    def set_speed(self, new_speed):
        super().set_speed(new_speed)
        rospy.loginfo(f"*{self.name}* - Speed set to {self.speed}")

    def move_callback(self, msg: stepper_msgs.LinearAbsoluteMove):
        rospy.loginfo(f"*{self.name}* - Moving to {msg.position}, Speed: {msg.speed}")
        self.set_speed(msg.speed)
        self.move_distance(msg.position)



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