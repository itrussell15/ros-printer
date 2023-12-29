;; Auto-generated. Do not edit!


(when (boundp 'cartesian_controller::G1)
  (if (not (find-package "CARTESIAN_CONTROLLER"))
    (make-package "CARTESIAN_CONTROLLER"))
  (shadow 'G1 (find-package "CARTESIAN_CONTROLLER")))
(unless (find-package "CARTESIAN_CONTROLLER::G1")
  (make-package "CARTESIAN_CONTROLLER::G1"))

(in-package "ROS")
;;//! \htmlinclude G1.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass cartesian_controller::G1
  :super ros::object
  :slots (_header _position _tool_speed ))

(defmethod cartesian_controller::G1
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:position __position) (instance geometry_msgs::Vector3 :init))
    ((:tool_speed __tool_speed) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _position __position)
   (setq _tool_speed (round __tool_speed))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:tool_speed
   (&optional __tool_speed)
   (if __tool_speed (setq _tool_speed __tool_speed)) _tool_speed)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Vector3 _position
    (send _position :serialization-length)
    ;; int64 _tool_speed
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Vector3 _position
       (send _position :serialize s)
     ;; int64 _tool_speed
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _tool_speed (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _tool_speed) (= (length (_tool_speed . bv)) 2)) ;; bignum
              (write-long (ash (elt (_tool_speed . bv) 0) 0) s)
              (write-long (ash (elt (_tool_speed . bv) 1) -1) s))
             ((and (class _tool_speed) (= (length (_tool_speed . bv)) 1)) ;; big1
              (write-long (elt (_tool_speed . bv) 0) s)
              (write-long (if (>= _tool_speed 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _tool_speed s)(write-long (if (>= _tool_speed 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Vector3 _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; int64 _tool_speed
#+(or :alpha :irix6 :x86_64)
      (setf _tool_speed (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _tool_speed (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(setf (get cartesian_controller::G1 :md5sum-) "140562008abdeeb2209e48c70e6b4eb8")
(setf (get cartesian_controller::G1 :datatype-) "cartesian_controller/G1")
(setf (get cartesian_controller::G1 :definition-)
      "Header header
geometry_msgs/Vector3 position
int64 tool_speed
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
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :cartesian_controller/G1 "140562008abdeeb2209e48c70e6b4eb8")


