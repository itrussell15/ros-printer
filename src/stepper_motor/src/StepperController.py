import rospy
from std_msgs.msgs import Int64

import threading

if __name__ == "__main__":

    rospy.init_node("Stepper Commander")
    rospy.loginfo("Starting Commander")

    pub = rospy.Publisher('stepper_command', Int64, queue_size = 10)
    rate = rospy.Rate(10)

