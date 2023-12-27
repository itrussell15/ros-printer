
(cl:in-package :asdf)

(defsystem "stepper_motor-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "AbsoluteMove" :depends-on ("_package_AbsoluteMove"))
    (:file "_package_AbsoluteMove" :depends-on ("_package"))
    (:file "CartesianMove" :depends-on ("_package_CartesianMove"))
    (:file "_package_CartesianMove" :depends-on ("_package"))
    (:file "LinearAbsoluteMove" :depends-on ("_package_LinearAbsoluteMove"))
    (:file "_package_LinearAbsoluteMove" :depends-on ("_package"))
    (:file "RelativeMove" :depends-on ("_package_RelativeMove"))
    (:file "_package_RelativeMove" :depends-on ("_package"))
    (:file "StepperConfig" :depends-on ("_package_StepperConfig"))
    (:file "_package_StepperConfig" :depends-on ("_package"))
    (:file "position_msg" :depends-on ("_package_position_msg"))
    (:file "_package_position_msg" :depends-on ("_package"))
  ))