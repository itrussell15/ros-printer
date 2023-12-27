#!/usr/bin/env python3
import dataclasses

import rospy
import RPi.GPIO as GPIO
import enum, time
import numpy as np

from std_msgs.msg import Int64
import stepper_motor.msg as stepper_msgs

class Direction(enum.Enum):
    COUNTER_CLOCK = 0
    CLOCKWISE = 1

class UnitSystem(enum.Enum):
    METRIC = 0
    IMPERIAL = 1

class Stepper:

    def __init__(
            self,
            DIR_PIN,
            STEP_PIN,
            speed = 100, # RPM
            accel = 15, # RPM^2
            deccel = None,
    ):

        self.DIR_PIN = DIR_PIN
        self.STEP_PIN = STEP_PIN

        self.STEPS_PER_REV = 200

        self.MIN_SPEED = 1
        self.MAX_SPEED = 120

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
            rospy.loginfo(f"Motor Already at {self.steps}, no action taken")
            return True

        if amount < 0:
            amount = abs(amount)

        GPIO.output(self.DIR_PIN, direction.value)

        velocity_profile = self.determine_speed(amount)
        delay_profile = self.RPM_to_Rate(velocity_profile)

        n = 0
        while n != amount-1:
            GPIO.output(self.STEP_PIN, True)
            time.sleep(delay_profile[n])
            n += 1
            GPIO.output(self.STEP_PIN, False)
        return True

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

# TODO Finish this
class ScrewDriveStepper(Stepper):
    """
    For steppers with screw drives!
    """

    def __init__(
            self,
            DIR_PIN,
            STEP_PIN,
            pitch = None, # Threads / inch
            lead = None,
            num_starts = None,
            length = None, # Inches
            speed=100,
            accel=15,
            deccel=None,
            units = UnitSystem.IMPERIAL
        ):

        super().__init__(
            DIR_PIN,
            STEP_PIN,
            speed,
            accel,
            deccel,
        )

        self.screw = self.LeadScrew(
            pitch = pitch,
            starts = num_starts,
            lead = lead,
            length = length,
            units = units
        )

    def move_distance(self, distance, distance_units = None):
        # Use the same units as the screw
        if distance_units is None:
            units = self.screw.units

        # Handle mismatched units
        if units != self.screw.units:
            distance = self.screw.convert(distance, distance_units, self.screw.units)

        turns = distance / self.screw.lead
        return self.move_turns(turns)

    def move_abs(self, new_position):
        delta = new_position - self.position
        return self.move_distance(delta)

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
                pitch = None,
                starts = None,
                length = None,
                units = UnitSystem.IMPERIAL,
                lead = None
        ):

            self.units = units
            self.length = length

            complete = False
            if lead is not None:
                self._lead = lead
                complete = True

            if starts is not None and pitch is not None:
                if not complete:
                    self._lead = self._compute_lead(pitch, starts)
                else:
                    rospy.logwarn(f"Pitch, start, and lead were passed in when only need either (lead) or (pitch and start), continuing with lead")

            if not complete:
                raise ValueError(f"No information was provided about this leadscrew")

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

# TODO Create startup sequence that loads config data
class StepperNode(Stepper):

    def __init__(self,
                 name,
                 listen_node,
                 DIR_PIN,
                 STEP_PIN,
                 speed = 100,
                 accel = 15,
                 deccel=None,
                 ):
        super().__init__(
            DIR_PIN=DIR_PIN,
            STEP_PIN=STEP_PIN,
            speed=speed,
            accel=accel,
            deccel=deccel
        )

        self.name = name
        rospy.loginfo(f"Starting {name} listening on {listen_node}")

        self.listen_node = listen_node

        rospy.Subscriber(f"{self.listen_node}_abs", stepper_msgs.AbsoluteMove, self.abs_callback)
        rospy.Subscriber(f"{self.listen_node}_rel", stepper_msgs.RelativeMove, self.rel_callback)

    def set_speed(self, new_speed):
        super().set_speed(new_speed)
        rospy.loginfo(f"*{self.name}* - Speed set to {self.speed}")

    def abs_callback(self, msg: stepper_msgs.AbsoluteMove):
        rospy.loginfo(f"*{self.name}* - Moving to {msg.abs_position}, Speed: {msg.speed}")
        self.set_speed(msg.speed)
        self.move_abs(msg.abs_position)

    def rel_callback(self, msg: stepper_msgs.RelativeMove):
        rospy.loginfo(f"*{self.name}* - Relative Move of {msg.rel_position}, Speed: {msg.speed}")
        self.set_speed(msg.speed)
        self.move_rel(msg.rel_steps)

class ScrewDriveStepperNode(ScrewDriveStepper):

    def __init__(
            self,
            name,
            listen_node,
            DIR_PIN,
            STEP_PIN,
            pitch=None,  # Threads / inch
            lead=None,
            num_starts=None,
            length=None,  # Inches
            speed=100,
            accel=15,
            deccel=None,
            units=UnitSystem.IMPERIAL
    ):
        print(pitch)
        super().__init__(
            DIR_PIN,
            STEP_PIN,
            pitch=pitch,  # Threads / inch
            lead=lead,
            num_starts=num_starts,
            length=length,  # Inches
            speed=speed,
            accel=accel,
            deccel=deccel,
            units=units
        )

        self.name = name
        rospy.loginfo(f"Starting {name} listening on {listen_node}")
        self.listen_node = listen_node
        rospy.Subscriber(f"{self.listen_node}_abs", stepper_msgs.LinearAbsoluteMove, self.move_callback)

    def set_speed(self, new_speed):
        super().set_speed(new_speed)
        rospy.loginfo(f"*{self.name}* - Speed set to {self.speed}")

    def move_callback(self, msg: stepper_msgs.LinearAbsoluteMove):
        rospy.loginfo(f"*{self.name}* - Moving to {msg.position}, Speed: {msg.speed}")
        self.set_speed(msg.speed)
        self.move_distance(msg.position)

DIR_PIN = 40
STEP_PIN = 38

DIR_PIN2 = 37
STEP_PIN2 = 35

if __name__ == "__main__":

    # stepperR = StepperNode("right_stepper", "cmd_right", 40, 38, speed=120)
    stepperR = ScrewDriveStepperNode("right_stepper", "cmd_right", 40, 38, speed=120, lead = 0.5)

    stepperR.move_distance(1)

    # stepperL = StepperNode("left_stepper", "cmd_left", 37, 35)
    # rospy.spin()