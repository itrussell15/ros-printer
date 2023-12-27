#!/usr/bin/env python3

import json
import os

import rospy
import stepper_motor.msg as stepper_msgs

if __name__ == "__main__":

    rospy.init_node(f'publish_config')

    file = "/home/ubuntu/test/src/stepper_motor/scripts/steppers.json"

    with open(file, "r") as f:
        data = json.load(f)

    for topic in data:
        print(f"Publishing to {topic}")
        msg = stepper_msgs.StepperConfig(**data[topic])
        pub = rospy.Publisher(f"{topic}_config", stepper_msgs.StepperConfig, queue_size = 10)
        rospy.sleep(2.0)
        pub.publish(msg)

    rospy.spin()