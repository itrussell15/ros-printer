
(cl:in-package :asdf)

(defsystem "cartesian_controller-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "G1" :depends-on ("_package_G1"))
    (:file "_package_G1" :depends-on ("_package"))
    (:file "G1" :depends-on ("_package_G1"))
    (:file "_package_G1" :depends-on ("_package"))
  ))