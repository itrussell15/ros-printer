#!/usr/bin/env python3

import rospy
from stepper_motor import LeadScrewStepperNode, StepperNode
import stepper_motor.msg as stepper_msgs

if __name__ == "__main__":

    rospy.init_node("/cartesian_planner")
    rospy.loginfo("Starting Cartesian Planner")

