; Auto-generated. Do not edit!


(cl:in-package stepper_motor-msg)


;//! \htmlinclude LinearStepperMove.msg.html

(cl:defclass <LinearStepperMove> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (position
    :reader position
    :initarg :position
    :type cl:float
    :initform 0.0)
   (speed
    :reader speed
    :initarg :speed
    :type cl:float
    :initform 0.0)
   (move_type
    :reader move_type
    :initarg :move_type
    :type cl:string
    :initform "")
   (units
    :reader units
    :initarg :units
    :type cl:string
    :initform ""))
)

(cl:defclass LinearStepperMove (<LinearStepperMove>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LinearStepperMove>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LinearStepperMove)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name stepper_motor-msg:<LinearStepperMove> is deprecated: use stepper_motor-msg:LinearStepperMove instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <LinearStepperMove>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stepper_motor-msg:header-val is deprecated.  Use stepper_motor-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <LinearStepperMove>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stepper_motor-msg:position-val is deprecated.  Use stepper_motor-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <LinearStepperMove>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stepper_motor-msg:speed-val is deprecated.  Use stepper_motor-msg:speed instead.")
  (speed m))

(cl:ensure-generic-function 'move_type-val :lambda-list '(m))
(cl:defmethod move_type-val ((m <LinearStepperMove>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stepper_motor-msg:move_type-val is deprecated.  Use stepper_motor-msg:move_type instead.")
  (move_type m))

(cl:ensure-generic-function 'units-val :lambda-list '(m))
(cl:defmethod units-val ((m <LinearStepperMove>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stepper_motor-msg:units-val is deprecated.  Use stepper_motor-msg:units instead.")
  (units m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LinearStepperMove>) ostream)
  "Serializes a message object of type '<LinearStepperMove>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'move_type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'move_type))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'units))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'units))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LinearStepperMove>) istream)
  "Deserializes a message object of type '<LinearStepperMove>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'position) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'move_type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'move_type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'units) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'units) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LinearStepperMove>)))
  "Returns string type for a message object of type '<LinearStepperMove>"
  "stepper_motor/LinearStepperMove")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LinearStepperMove)))
  "Returns string type for a message object of type 'LinearStepperMove"
  "stepper_motor/LinearStepperMove")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LinearStepperMove>)))
  "Returns md5sum for a message object of type '<LinearStepperMove>"
  "1db798ee9f66ea3cd530d4730e75a01d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LinearStepperMove)))
  "Returns md5sum for a message object of type 'LinearStepperMove"
  "1db798ee9f66ea3cd530d4730e75a01d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LinearStepperMove>)))
  "Returns full string definition for message of type '<LinearStepperMove>"
  (cl:format cl:nil "Header header~%float32 position~%float32 speed~%string move_type~%string units~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LinearStepperMove)))
  "Returns full string definition for message of type 'LinearStepperMove"
  (cl:format cl:nil "Header header~%float32 position~%float32 speed~%string move_type~%string units~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LinearStepperMove>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4 (cl:length (cl:slot-value msg 'move_type))
     4 (cl:length (cl:slot-value msg 'units))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LinearStepperMove>))
  "Converts a ROS message object to a list"
  (cl:list 'LinearStepperMove
    (cl:cons ':header (header msg))
    (cl:cons ':position (position msg))
    (cl:cons ':speed (speed msg))
    (cl:cons ':move_type (move_type msg))
    (cl:cons ':units (units msg))
))
