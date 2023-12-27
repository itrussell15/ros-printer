;; Auto-generated. Do not edit!


(when (boundp 'cartesian_controller::CartesianMove)
  (if (not (find-package "CARTESIAN_CONTROLLER"))
    (make-package "CARTESIAN_CONTROLLER"))
  (shadow 'CartesianMove (find-package "CARTESIAN_CONTROLLER")))
(unless (find-package "CARTESIAN_CONTROLLER::CARTESIANMOVE")
  (make-package "CARTESIAN_CONTROLLER::CARTESIANMOVE"))

(in-package "ROS")
;;//! \htmlinclude CartesianMove.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))
(if (not (find-package "STEPPER_MOTOR"))
  (ros::roseus-add-msgs "stepper_motor"))


(defclass cartesian_controller::CartesianMove
  :super ros::object
  :slots (_header _x _y _z ))

(defmethod cartesian_controller::CartesianMove
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:x __x) (instance stepper_motor::AbsoluteMove :init))
    ((:y __y) (instance stepper_motor::AbsoluteMove :init))
    ((:z __z) (instance stepper_motor::AbsoluteMove :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _x __x)
   (setq _y __y)
   (setq _z __z)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:x
   (&rest __x)
   (if (keywordp (car __x))
       (send* _x __x)
     (progn
       (if __x (setq _x (car __x)))
       _x)))
  (:y
   (&rest __y)
   (if (keywordp (car __y))
       (send* _y __y)
     (progn
       (if __y (setq _y (car __y)))
       _y)))
  (:z
   (&rest __z)
   (if (keywordp (car __z))
       (send* _z __z)
     (progn
       (if __z (setq _z (car __z)))
       _z)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; stepper_motor/AbsoluteMove _x
    (send _x :serialization-length)
    ;; stepper_motor/AbsoluteMove _y
    (send _y :serialization-length)
    ;; stepper_motor/AbsoluteMove _z
    (send _z :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; stepper_motor/AbsoluteMove _x
       (send _x :serialize s)
     ;; stepper_motor/AbsoluteMove _y
       (send _y :serialize s)
     ;; stepper_motor/AbsoluteMove _z
       (send _z :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; stepper_motor/AbsoluteMove _x
     (send _x :deserialize buf ptr-) (incf ptr- (send _x :serialization-length))
   ;; stepper_motor/AbsoluteMove _y
     (send _y :deserialize buf ptr-) (incf ptr- (send _y :serialization-length))
   ;; stepper_motor/AbsoluteMove _z
     (send _z :deserialize buf ptr-) (incf ptr- (send _z :serialization-length))
   ;;
   self)
  )

(setf (get cartesian_controller::CartesianMove :md5sum-) "168cb11f321e52482a5826f10f646af5")
(setf (get cartesian_controller::CartesianMove :datatype-) "cartesian_controller/CartesianMove")
(setf (get cartesian_controller::CartesianMove :definition-)
      "Header header
stepper_motor/AbsoluteMove x
stepper_motor/AbsoluteMove y
stepper_motor/AbsoluteMove z
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: stepper_motor/AbsoluteMove
Header header
int64 abs_position
int64 speed

")



(provide :cartesian_controller/CartesianMove "168cb11f321e52482a5826f10f646af5")


