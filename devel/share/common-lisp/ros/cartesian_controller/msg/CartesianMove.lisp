; Auto-generated. Do not edit!


(cl:in-package cartesian_controller-msg)


;//! \htmlinclude CartesianMove.msg.html

(cl:defclass <CartesianMove> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (x
    :reader x
    :initarg :x
    :type stepper_motor-msg:AbsoluteMove
    :initform (cl:make-instance 'stepper_motor-msg:AbsoluteMove))
   (y
    :reader y
    :initarg :y
    :type stepper_motor-msg:AbsoluteMove
    :initform (cl:make-instance 'stepper_motor-msg:AbsoluteMove))
   (z
    :reader z
    :initarg :z
    :type stepper_motor-msg:AbsoluteMove
    :initform (cl:make-instance 'stepper_motor-msg:AbsoluteMove)))
)

(cl:defclass CartesianMove (<CartesianMove>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CartesianMove>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CartesianMove)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cartesian_controller-msg:<CartesianMove> is deprecated: use cartesian_controller-msg:CartesianMove instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <CartesianMove>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cartesian_controller-msg:header-val is deprecated.  Use cartesian_controller-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <CartesianMove>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cartesian_controller-msg:x-val is deprecated.  Use cartesian_controller-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <CartesianMove>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cartesian_controller-msg:y-val is deprecated.  Use cartesian_controller-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <CartesianMove>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cartesian_controller-msg:z-val is deprecated.  Use cartesian_controller-msg:z instead.")
  (z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CartesianMove>) ostream)
  "Serializes a message object of type '<CartesianMove>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'x) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'y) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'z) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CartesianMove>) istream)
  "Deserializes a message object of type '<CartesianMove>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'x) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'y) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'z) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CartesianMove>)))
  "Returns string type for a message object of type '<CartesianMove>"
  "cartesian_controller/CartesianMove")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CartesianMove)))
  "Returns string type for a message object of type 'CartesianMove"
  "cartesian_controller/CartesianMove")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CartesianMove>)))
  "Returns md5sum for a message object of type '<CartesianMove>"
  "168cb11f321e52482a5826f10f646af5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CartesianMove)))
  "Returns md5sum for a message object of type 'CartesianMove"
  "168cb11f321e52482a5826f10f646af5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CartesianMove>)))
  "Returns full string definition for message of type '<CartesianMove>"
  (cl:format cl:nil "Header header~%stepper_motor/AbsoluteMove x~%stepper_motor/AbsoluteMove y~%stepper_motor/AbsoluteMove z~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: stepper_motor/AbsoluteMove~%Header header~%int64 abs_position~%int64 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CartesianMove)))
  "Returns full string definition for message of type 'CartesianMove"
  (cl:format cl:nil "Header header~%stepper_motor/AbsoluteMove x~%stepper_motor/AbsoluteMove y~%stepper_motor/AbsoluteMove z~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: stepper_motor/AbsoluteMove~%Header header~%int64 abs_position~%int64 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CartesianMove>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'x))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'y))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'z))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CartesianMove>))
  "Converts a ROS message object to a list"
  (cl:list 'CartesianMove
    (cl:cons ':header (header msg))
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
))
