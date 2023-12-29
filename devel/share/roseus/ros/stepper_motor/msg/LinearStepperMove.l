;; Auto-generated. Do not edit!


(when (boundp 'stepper_motor::LinearStepperMove)
  (if (not (find-package "STEPPER_MOTOR"))
    (make-package "STEPPER_MOTOR"))
  (shadow 'LinearStepperMove (find-package "STEPPER_MOTOR")))
(unless (find-package "STEPPER_MOTOR::LINEARSTEPPERMOVE")
  (make-package "STEPPER_MOTOR::LINEARSTEPPERMOVE"))

(in-package "ROS")
;;//! \htmlinclude LinearStepperMove.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass stepper_motor::LinearStepperMove
  :super ros::object
  :slots (_header _position _speed _move_type _units ))

(defmethod stepper_motor::LinearStepperMove
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:position __position) 0.0)
    ((:speed __speed) 0.0)
    ((:move_type __move_type) "")
    ((:units __units) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _position (float __position))
   (setq _speed (float __speed))
   (setq _move_type (string __move_type))
   (setq _units (string __units))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:move_type
   (&optional __move_type)
   (if __move_type (setq _move_type __move_type)) _move_type)
  (:units
   (&optional __units)
   (if __units (setq _units __units)) _units)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _position
    4
    ;; float32 _speed
    4
    ;; string _move_type
    4 (length _move_type)
    ;; string _units
    4 (length _units)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _position
       (sys::poke _position (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _move_type
       (write-long (length _move_type) s) (princ _move_type s)
     ;; string _units
       (write-long (length _units) s) (princ _units s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _position
     (setq _position (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _move_type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _move_type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _units
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _units (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get stepper_motor::LinearStepperMove :md5sum-) "1db798ee9f66ea3cd530d4730e75a01d")
(setf (get stepper_motor::LinearStepperMove :datatype-) "stepper_motor/LinearStepperMove")
(setf (get stepper_motor::LinearStepperMove :definition-)
      "Header header
float32 position
float32 speed
string move_type
string units

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

")



(provide :stepper_motor/LinearStepperMove "1db798ee9f66ea3cd530d4730e75a01d")


