; Auto-generated. Do not edit!


(cl:in-package stepper_motor-msg)


;//! \htmlinclude StepperConfig.msg.html

(cl:defclass <StepperConfig> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (set_speed
    :reader set_speed
    :initarg :set_speed
    :type cl:float
    :initform 0.0)
   (max_speed
    :reader max_speed
    :initarg :max_speed
    :type cl:float
    :initform 0.0)
   (min_speed
    :reader min_speed
    :initarg :min_speed
    :type cl:float
    :initform 0.0)
   (accel
    :reader accel
    :initarg :accel
    :type cl:float
    :initform 0.0)
   (deccel
    :reader deccel
    :initarg :deccel
    :type cl:float
    :initform 0.0)
   (step_pin
    :reader step_pin
    :initarg :step_pin
    :type cl:fixnum
    :initform 0)
   (dir_pin
    :reader dir_pin
    :initarg :dir_pin
    :type cl:fixnum
    :initform 0)
   (steps_per_rev
    :reader steps_per_rev
    :initarg :steps_per_rev
    :type cl:integer
    :initform 0))
)

(cl:defclass StepperConfig (<StepperConfig>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StepperConfig>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StepperConfig)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name stepper_motor-msg:<StepperConfig> is deprecated: use stepper_motor-msg:StepperConfig instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <StepperConfig>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stepper_motor-msg:header-val is deprecated.  Use stepper_motor-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'set_speed-val :lambda-list '(m))
(cl:defmethod set_speed-val ((m <StepperConfig>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stepper_motor-msg:set_speed-val is deprecated.  Use stepper_motor-msg:set_speed instead.")
  (set_speed m))

(cl:ensure-generic-function 'max_speed-val :lambda-list '(m))
(cl:defmethod max_speed-val ((m <StepperConfig>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stepper_motor-msg:max_speed-val is deprecated.  Use stepper_motor-msg:max_speed instead.")
  (max_speed m))

(cl:ensure-generic-function 'min_speed-val :lambda-list '(m))
(cl:defmethod min_speed-val ((m <StepperConfig>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stepper_motor-msg:min_speed-val is deprecated.  Use stepper_motor-msg:min_speed instead.")
  (min_speed m))

(cl:ensure-generic-function 'accel-val :lambda-list '(m))
(cl:defmethod accel-val ((m <StepperConfig>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stepper_motor-msg:accel-val is deprecated.  Use stepper_motor-msg:accel instead.")
  (accel m))

(cl:ensure-generic-function 'deccel-val :lambda-list '(m))
(cl:defmethod deccel-val ((m <StepperConfig>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stepper_motor-msg:deccel-val is deprecated.  Use stepper_motor-msg:deccel instead.")
  (deccel m))

(cl:ensure-generic-function 'step_pin-val :lambda-list '(m))
(cl:defmethod step_pin-val ((m <StepperConfig>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stepper_motor-msg:step_pin-val is deprecated.  Use stepper_motor-msg:step_pin instead.")
  (step_pin m))

(cl:ensure-generic-function 'dir_pin-val :lambda-list '(m))
(cl:defmethod dir_pin-val ((m <StepperConfig>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stepper_motor-msg:dir_pin-val is deprecated.  Use stepper_motor-msg:dir_pin instead.")
  (dir_pin m))

(cl:ensure-generic-function 'steps_per_rev-val :lambda-list '(m))
(cl:defmethod steps_per_rev-val ((m <StepperConfig>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stepper_motor-msg:steps_per_rev-val is deprecated.  Use stepper_motor-msg:steps_per_rev instead.")
  (steps_per_rev m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StepperConfig>) ostream)
  "Serializes a message object of type '<StepperConfig>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'set_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'max_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'min_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'accel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'deccel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'step_pin)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dir_pin)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'steps_per_rev)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StepperConfig>) istream)
  "Deserializes a message object of type '<StepperConfig>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'set_speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'min_speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'accel) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'deccel) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'step_pin)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dir_pin)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'steps_per_rev) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StepperConfig>)))
  "Returns string type for a message object of type '<StepperConfig>"
  "stepper_motor/StepperConfig")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StepperConfig)))
  "Returns string type for a message object of type 'StepperConfig"
  "stepper_motor/StepperConfig")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StepperConfig>)))
  "Returns md5sum for a message object of type '<StepperConfig>"
  "f33d563e99c62fa98073f3435668c039")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StepperConfig)))
  "Returns md5sum for a message object of type 'StepperConfig"
  "f33d563e99c62fa98073f3435668c039")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StepperConfig>)))
  "Returns full string definition for message of type '<StepperConfig>"
  (cl:format cl:nil "Header header~%float32 set_speed~%float32 max_speed~%float32 min_speed~%float32 accel~%float32 deccel~%uint8 step_pin~%uint8 dir_pin~%int64 steps_per_rev~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StepperConfig)))
  "Returns full string definition for message of type 'StepperConfig"
  (cl:format cl:nil "Header header~%float32 set_speed~%float32 max_speed~%float32 min_speed~%float32 accel~%float32 deccel~%uint8 step_pin~%uint8 dir_pin~%int64 steps_per_rev~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StepperConfig>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
     4
     1
     1
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StepperConfig>))
  "Converts a ROS message object to a list"
  (cl:list 'StepperConfig
    (cl:cons ':header (header msg))
    (cl:cons ':set_speed (set_speed msg))
    (cl:cons ':max_speed (max_speed msg))
    (cl:cons ':min_speed (min_speed msg))
    (cl:cons ':accel (accel msg))
    (cl:cons ':deccel (deccel msg))
    (cl:cons ':step_pin (step_pin msg))
    (cl:cons ':dir_pin (dir_pin msg))
    (cl:cons ':steps_per_rev (steps_per_rev msg))
))
