;; Auto-generated. Do not edit!


(when (boundp 'stepper_motor::position_msg)
  (if (not (find-package "STEPPER_MOTOR"))
    (make-package "STEPPER_MOTOR"))
  (shadow 'position_msg (find-package "STEPPER_MOTOR")))
(unless (find-package "STEPPER_MOTOR::POSITION_MSG")
  (make-package "STEPPER_MOTOR::POSITION_MSG"))

(in-package "ROS")
;;//! \htmlinclude position_msg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass stepper_motor::position_msg
  :super ros::object
  :slots (_header _abs_position _speed ))

(defmethod stepper_motor::position_msg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:abs_position __abs_position) 0)
    ((:speed __speed) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _abs_position (round __abs_position))
   (setq _speed (round __speed))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:abs_position
   (&optional __abs_position)
   (if __abs_position (setq _abs_position __abs_position)) _abs_position)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int64 _abs_position
    8
    ;; int64 _speed
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int64 _abs_position
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _abs_position (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _abs_position) (= (length (_abs_position . bv)) 2)) ;; bignum
              (write-long (ash (elt (_abs_position . bv) 0) 0) s)
              (write-long (ash (elt (_abs_position . bv) 1) -1) s))
             ((and (class _abs_position) (= (length (_abs_position . bv)) 1)) ;; big1
              (write-long (elt (_abs_position . bv) 0) s)
              (write-long (if (>= _abs_position 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _abs_position s)(write-long (if (>= _abs_position 0) 0 #xffffffff) s)))
     ;; int64 _speed
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _speed (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _speed) (= (length (_speed . bv)) 2)) ;; bignum
              (write-long (ash (elt (_speed . bv) 0) 0) s)
              (write-long (ash (elt (_speed . bv) 1) -1) s))
             ((and (class _speed) (= (length (_speed . bv)) 1)) ;; big1
              (write-long (elt (_speed . bv) 0) s)
              (write-long (if (>= _speed 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _speed s)(write-long (if (>= _speed 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int64 _abs_position
#+(or :alpha :irix6 :x86_64)
      (setf _abs_position (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _abs_position (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _speed
#+(or :alpha :irix6 :x86_64)
      (setf _speed (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _speed (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get stepper_motor::position_msg :md5sum-) "39a958d42d70ce7e9cb38bf6691bdd7b")
(setf (get stepper_motor::position_msg :datatype-) "stepper_motor/position_msg")
(setf (get stepper_motor::position_msg :definition-)
      "Header header
int64 abs_position
int64 speed

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



(provide :stepper_motor/position_msg "39a958d42d70ce7e9cb38bf6691bdd7b")


