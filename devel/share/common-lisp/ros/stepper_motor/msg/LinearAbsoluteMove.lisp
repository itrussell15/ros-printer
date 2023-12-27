; Auto-generated. Do not edit!


(cl:in-package stepper_motor-msg)


;//! \htmlinclude LinearAbsoluteMove.msg.html

(cl:defclass <LinearAbsoluteMove> (roslisp-msg-protocol:ros-message)
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
    :type cl:integer
    :initform 0))
)

(cl:defclass LinearAbsoluteMove (<LinearAbsoluteMove>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LinearAbsoluteMove>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LinearAbsoluteMove)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name stepper_motor-msg:<LinearAbsoluteMove> is deprecated: use stepper_motor-msg:LinearAbsoluteMove instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <LinearAbsoluteMove>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stepper_motor-msg:header-val is deprecated.  Use stepper_motor-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <LinearAbsoluteMove>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stepper_motor-msg:position-val is deprecated.  Use stepper_motor-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <LinearAbsoluteMove>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stepper_motor-msg:speed-val is deprecated.  Use stepper_motor-msg:speed instead.")
  (speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LinearAbsoluteMove>) ostream)
  "Serializes a message object of type '<LinearAbsoluteMove>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LinearAbsoluteMove>) istream)
  "Deserializes a message object of type '<LinearAbsoluteMove>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'position) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'speed) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LinearAbsoluteMove>)))
  "Returns string type for a message object of type '<LinearAbsoluteMove>"
  "stepper_motor/LinearAbsoluteMove")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LinearAbsoluteMove)))
  "Returns string type for a message object of type 'LinearAbsoluteMove"
  "stepper_motor/LinearAbsoluteMove")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LinearAbsoluteMove>)))
  "Returns md5sum for a message object of type '<LinearAbsoluteMove>"
  "20ede19b55b0e17ca9aa650f063809af")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LinearAbsoluteMove)))
  "Returns md5sum for a message object of type 'LinearAbsoluteMove"
  "20ede19b55b0e17ca9aa650f063809af")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LinearAbsoluteMove>)))
  "Returns full string definition for message of type '<LinearAbsoluteMove>"
  (cl:format cl:nil "Header header~%float64 position~%int64 speed~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LinearAbsoluteMove)))
  "Returns full string definition for message of type 'LinearAbsoluteMove"
  (cl:format cl:nil "Header header~%float64 position~%int64 speed~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LinearAbsoluteMove>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LinearAbsoluteMove>))
  "Converts a ROS message object to a list"
  (cl:list 'LinearAbsoluteMove
    (cl:cons ':header (header msg))
    (cl:cons ':position (position msg))
    (cl:cons ':speed (speed msg))
))
