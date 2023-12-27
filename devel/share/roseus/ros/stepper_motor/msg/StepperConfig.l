;; Auto-generated. Do not edit!


(when (boundp 'stepper_motor::StepperConfig)
  (if (not (find-package "STEPPER_MOTOR"))
    (make-package "STEPPER_MOTOR"))
  (shadow 'StepperConfig (find-package "STEPPER_MOTOR")))
(unless (find-package "STEPPER_MOTOR::STEPPERCONFIG")
  (make-package "STEPPER_MOTOR::STEPPERCONFIG"))

(in-package "ROS")
;;//! \htmlinclude StepperConfig.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass stepper_motor::StepperConfig
  :super ros::object
  :slots (_header _speed _max_speed _min_speed _accel _deccel _step_pin _dir_pin _steps_per_rev ))

(defmethod stepper_motor::StepperConfig
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:speed __speed) 0.0)
    ((:max_speed __max_speed) 0.0)
    ((:min_speed __min_speed) 0.0)
    ((:accel __accel) 0.0)
    ((:deccel __deccel) 0.0)
    ((:step_pin __step_pin) 0)
    ((:dir_pin __dir_pin) 0)
    ((:steps_per_rev __steps_per_rev) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _speed (float __speed))
   (setq _max_speed (float __max_speed))
   (setq _min_speed (float __min_speed))
   (setq _accel (float __accel))
   (setq _deccel (float __deccel))
   (setq _step_pin (round __step_pin))
   (setq _dir_pin (round __dir_pin))
   (setq _steps_per_rev (round __steps_per_rev))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:max_speed
   (&optional __max_speed)
   (if __max_speed (setq _max_speed __max_speed)) _max_speed)
  (:min_speed
   (&optional __min_speed)
   (if __min_speed (setq _min_speed __min_speed)) _min_speed)
  (:accel
   (&optional __accel)
   (if __accel (setq _accel __accel)) _accel)
  (:deccel
   (&optional __deccel)
   (if __deccel (setq _deccel __deccel)) _deccel)
  (:step_pin
   (&optional __step_pin)
   (if __step_pin (setq _step_pin __step_pin)) _step_pin)
  (:dir_pin
   (&optional __dir_pin)
   (if __dir_pin (setq _dir_pin __dir_pin)) _dir_pin)
  (:steps_per_rev
   (&optional __steps_per_rev)
   (if __steps_per_rev (setq _steps_per_rev __steps_per_rev)) _steps_per_rev)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _speed
    4
    ;; float32 _max_speed
    4
    ;; float32 _min_speed
    4
    ;; float32 _accel
    4
    ;; float32 _deccel
    4
    ;; uint8 _step_pin
    1
    ;; uint8 _dir_pin
    1
    ;; int64 _steps_per_rev
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _max_speed
       (sys::poke _max_speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _min_speed
       (sys::poke _min_speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _accel
       (sys::poke _accel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _deccel
       (sys::poke _deccel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _step_pin
       (write-byte _step_pin s)
     ;; uint8 _dir_pin
       (write-byte _dir_pin s)
     ;; int64 _steps_per_rev
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _steps_per_rev (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _steps_per_rev) (= (length (_steps_per_rev . bv)) 2)) ;; bignum
              (write-long (ash (elt (_steps_per_rev . bv) 0) 0) s)
              (write-long (ash (elt (_steps_per_rev . bv) 1) -1) s))
             ((and (class _steps_per_rev) (= (length (_steps_per_rev . bv)) 1)) ;; big1
              (write-long (elt (_steps_per_rev . bv) 0) s)
              (write-long (if (>= _steps_per_rev 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _steps_per_rev s)(write-long (if (>= _steps_per_rev 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _max_speed
     (setq _max_speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _min_speed
     (setq _min_speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _accel
     (setq _accel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _deccel
     (setq _deccel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _step_pin
     (setq _step_pin (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _dir_pin
     (setq _dir_pin (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; int64 _steps_per_rev
#+(or :alpha :irix6 :x86_64)
      (setf _steps_per_rev (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _steps_per_rev (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(setf (get stepper_motor::StepperConfig :md5sum-) "ff43d43f44d3ccbde0bc997af21c6851")
(setf (get stepper_motor::StepperConfig :datatype-) "stepper_motor/StepperConfig")
(setf (get stepper_motor::StepperConfig :definition-)
      "Header header
float32 speed
float32 max_speed
float32 min_speed
float32 accel
float32 deccel
uint8 step_pin
uint8 dir_pin
int64 steps_per_rev


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



(provide :stepper_motor/StepperConfig "ff43d43f44d3ccbde0bc997af21c6851")


