#!/usr/bin/env python3

import rospy
import json, sys

from StepperDriver import StepperNode, ScrewDriveStepperNode
import stepper_motor.msg as stepper_motor_msgs

if __name__ == "__main__":

    config_path = rospy.get_param("/steppers/config_path")

    with open(config_path, "r") as f:
        config = json.load(f)

    axis = sys.argv[1]
    name = f"{axis}_axis"
    axis_config = config[name]
    rospy.init_node(name)

    if axis_config["type"] == "Stepper":
        StepperNode(
            name = axis_config["node_name"],
            listen_node = axis_config["listen_name"],
            config = stepper_motor_msgs.StepperConfig(**axis_config["config"])
        )
    elif axis_config["type"] == "ScrewDriveStepper":
        ScrewDriveStepperNode(
            name=axis_config["node_name"],
            listen_node=axis_config["listen_name"],
            config = stepper_motor_msgs.ScrewDriveStepperConfig(**axis_config["config"])
        )
    else:
        raise ValueError(f'{axis_config["type"]} is not a valid type')

    rospy.spin()