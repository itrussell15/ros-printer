
(cl:in-package :asdf)

(defsystem "cartesian_controller-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
               :stepper_motor-msg
)
  :components ((:file "_package")
    (:file "CartesianMove" :depends-on ("_package_CartesianMove"))
    (:file "_package_CartesianMove" :depends-on ("_package"))
  ))