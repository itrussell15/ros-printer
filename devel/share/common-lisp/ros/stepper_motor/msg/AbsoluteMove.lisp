; Auto-generated. Do not edit!


(cl:in-package stepper_motor-msg)


;//! \htmlinclude AbsoluteMove.msg.html

(cl:defclass <AbsoluteMove> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (abs_position
    :reader abs_position
    :initarg :abs_position
    :type cl:integer
    :initform 0)
   (speed
    :reader speed
    :initarg :speed
    :type cl:integer
    :initform 0))
)

(cl:defclass AbsoluteMove (<AbsoluteMove>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AbsoluteMove>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AbsoluteMove)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name stepper_motor-msg:<AbsoluteMove> is deprecated: use stepper_motor-msg:AbsoluteMove instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <AbsoluteMove>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stepper_motor-msg:header-val is deprecated.  Use stepper_motor-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'abs_position-val :lambda-list '(m))
(cl:defmethod abs_position-val ((m <AbsoluteMove>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stepper_motor-msg:abs_position-val is deprecated.  Use stepper_motor-msg:abs_position instead.")
  (abs_position m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <AbsoluteMove>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stepper_motor-msg:speed-val is deprecated.  Use stepper_motor-msg:speed instead.")
  (speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AbsoluteMove>) ostream)
  "Serializes a message object of type '<AbsoluteMove>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'abs_position)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AbsoluteMove>) istream)
  "Deserializes a message object of type '<AbsoluteMove>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'abs_position) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AbsoluteMove>)))
  "Returns string type for a message object of type '<AbsoluteMove>"
  "stepper_motor/AbsoluteMove")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AbsoluteMove)))
  "Returns string type for a message object of type 'AbsoluteMove"
  "stepper_motor/AbsoluteMove")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AbsoluteMove>)))
  "Returns md5sum for a message object of type '<AbsoluteMove>"
  "39a958d42d70ce7e9cb38bf6691bdd7b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AbsoluteMove)))
  "Returns md5sum for a message object of type 'AbsoluteMove"
  "39a958d42d70ce7e9cb38bf6691bdd7b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AbsoluteMove>)))
  "Returns full string definition for message of type '<AbsoluteMove>"
  (cl:format cl:nil "Header header~%int64 abs_position~%int64 speed~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AbsoluteMove)))
  "Returns full string definition for message of type 'AbsoluteMove"
  (cl:format cl:nil "Header header~%int64 abs_position~%int64 speed~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AbsoluteMove>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AbsoluteMove>))
  "Converts a ROS message object to a list"
  (cl:list 'AbsoluteMove
    (cl:cons ':header (header msg))
    (cl:cons ':abs_position (abs_position msg))
    (cl:cons ':speed (speed msg))
))
