; Auto-generated. Do not edit!


(cl:in-package cartesian_controller-msg)


;//! \htmlinclude G1.msg.html

(cl:defclass <G1> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (position
    :reader position
    :initarg :position
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (tool_speed
    :reader tool_speed
    :initarg :tool_speed
    :type cl:integer
    :initform 0))
)

(cl:defclass G1 (<G1>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <G1>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'G1)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cartesian_controller-msg:<G1> is deprecated: use cartesian_controller-msg:G1 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <G1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cartesian_controller-msg:header-val is deprecated.  Use cartesian_controller-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <G1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cartesian_controller-msg:position-val is deprecated.  Use cartesian_controller-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'tool_speed-val :lambda-list '(m))
(cl:defmethod tool_speed-val ((m <G1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cartesian_controller-msg:tool_speed-val is deprecated.  Use cartesian_controller-msg:tool_speed instead.")
  (tool_speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <G1>) ostream)
  "Serializes a message object of type '<G1>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (cl:let* ((signed (cl:slot-value msg 'tool_speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <G1>) istream)
  "Deserializes a message object of type '<G1>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tool_speed) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<G1>)))
  "Returns string type for a message object of type '<G1>"
  "cartesian_controller/G1")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'G1)))
  "Returns string type for a message object of type 'G1"
  "cartesian_controller/G1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<G1>)))
  "Returns md5sum for a message object of type '<G1>"
  "140562008abdeeb2209e48c70e6b4eb8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'G1)))
  "Returns md5sum for a message object of type 'G1"
  "140562008abdeeb2209e48c70e6b4eb8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<G1>)))
  "Returns full string definition for message of type '<G1>"
  (cl:format cl:nil "Header header~%geometry_msgs/Vector3 position~%int64 tool_speed~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'G1)))
  "Returns full string definition for message of type 'G1"
  (cl:format cl:nil "Header header~%geometry_msgs/Vector3 position~%int64 tool_speed~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <G1>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <G1>))
  "Converts a ROS message object to a list"
  (cl:list 'G1
    (cl:cons ':header (header msg))
    (cl:cons ':position (position msg))
    (cl:cons ':tool_speed (tool_speed msg))
))
