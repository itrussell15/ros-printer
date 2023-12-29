# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "stepper_motor: 4 messages, 0 services")

set(MSG_I_FLAGS "-Istepper_motor:/home/ubuntu/test/src/stepper_motor/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Istepper_motor:/home/ubuntu/test/src/stepper_motor/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(stepper_motor_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ubuntu/test/src/stepper_motor/msg/StepperConfig.msg" NAME_WE)
add_custom_target(_stepper_motor_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "stepper_motor" "/home/ubuntu/test/src/stepper_motor/msg/StepperConfig.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/ubuntu/test/src/stepper_motor/msg/StepperMove.msg" NAME_WE)
add_custom_target(_stepper_motor_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "stepper_motor" "/home/ubuntu/test/src/stepper_motor/msg/StepperMove.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/ubuntu/test/src/stepper_motor/msg/LinearStepperConfig.msg" NAME_WE)
add_custom_target(_stepper_motor_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "stepper_motor" "/home/ubuntu/test/src/stepper_motor/msg/LinearStepperConfig.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/ubuntu/test/src/stepper_motor/msg/LinearStepperMove.msg" NAME_WE)
add_custom_target(_stepper_motor_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "stepper_motor" "/home/ubuntu/test/src/stepper_motor/msg/LinearStepperMove.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(stepper_motor
  "/home/ubuntu/test/src/stepper_motor/msg/StepperConfig.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/stepper_motor
)
_generate_msg_cpp(stepper_motor
  "/home/ubuntu/test/src/stepper_motor/msg/StepperMove.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/stepper_motor
)
_generate_msg_cpp(stepper_motor
  "/home/ubuntu/test/src/stepper_motor/msg/LinearStepperConfig.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/stepper_motor
)
_generate_msg_cpp(stepper_motor
  "/home/ubuntu/test/src/stepper_motor/msg/LinearStepperMove.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/stepper_motor
)

### Generating Services

### Generating Module File
_generate_module_cpp(stepper_motor
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/stepper_motor
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(stepper_motor_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(stepper_motor_generate_messages stepper_motor_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/test/src/stepper_motor/msg/StepperConfig.msg" NAME_WE)
add_dependencies(stepper_motor_generate_messages_cpp _stepper_motor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/test/src/stepper_motor/msg/StepperMove.msg" NAME_WE)
add_dependencies(stepper_motor_generate_messages_cpp _stepper_motor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/test/src/stepper_motor/msg/LinearStepperConfig.msg" NAME_WE)
add_dependencies(stepper_motor_generate_messages_cpp _stepper_motor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/test/src/stepper_motor/msg/LinearStepperMove.msg" NAME_WE)
add_dependencies(stepper_motor_generate_messages_cpp _stepper_motor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(stepper_motor_gencpp)
add_dependencies(stepper_motor_gencpp stepper_motor_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS stepper_motor_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(stepper_motor
  "/home/ubuntu/test/src/stepper_motor/msg/StepperConfig.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/stepper_motor
)
_generate_msg_eus(stepper_motor
  "/home/ubuntu/test/src/stepper_motor/msg/StepperMove.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/stepper_motor
)
_generate_msg_eus(stepper_motor
  "/home/ubuntu/test/src/stepper_motor/msg/LinearStepperConfig.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/stepper_motor
)
_generate_msg_eus(stepper_motor
  "/home/ubuntu/test/src/stepper_motor/msg/LinearStepperMove.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/stepper_motor
)

### Generating Services

### Generating Module File
_generate_module_eus(stepper_motor
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/stepper_motor
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(stepper_motor_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(stepper_motor_generate_messages stepper_motor_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/test/src/stepper_motor/msg/StepperConfig.msg" NAME_WE)
add_dependencies(stepper_motor_generate_messages_eus _stepper_motor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/test/src/stepper_motor/msg/StepperMove.msg" NAME_WE)
add_dependencies(stepper_motor_generate_messages_eus _stepper_motor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/test/src/stepper_motor/msg/LinearStepperConfig.msg" NAME_WE)
add_dependencies(stepper_motor_generate_messages_eus _stepper_motor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/test/src/stepper_motor/msg/LinearStepperMove.msg" NAME_WE)
add_dependencies(stepper_motor_generate_messages_eus _stepper_motor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(stepper_motor_geneus)
add_dependencies(stepper_motor_geneus stepper_motor_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS stepper_motor_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(stepper_motor
  "/home/ubuntu/test/src/stepper_motor/msg/StepperConfig.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/stepper_motor
)
_generate_msg_lisp(stepper_motor
  "/home/ubuntu/test/src/stepper_motor/msg/StepperMove.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/stepper_motor
)
_generate_msg_lisp(stepper_motor
  "/home/ubuntu/test/src/stepper_motor/msg/LinearStepperConfig.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/stepper_motor
)
_generate_msg_lisp(stepper_motor
  "/home/ubuntu/test/src/stepper_motor/msg/LinearStepperMove.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/stepper_motor
)

### Generating Services

### Generating Module File
_generate_module_lisp(stepper_motor
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/stepper_motor
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(stepper_motor_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(stepper_motor_generate_messages stepper_motor_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/test/src/stepper_motor/msg/StepperConfig.msg" NAME_WE)
add_dependencies(stepper_motor_generate_messages_lisp _stepper_motor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/test/src/stepper_motor/msg/StepperMove.msg" NAME_WE)
add_dependencies(stepper_motor_generate_messages_lisp _stepper_motor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/test/src/stepper_motor/msg/LinearStepperConfig.msg" NAME_WE)
add_dependencies(stepper_motor_generate_messages_lisp _stepper_motor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/test/src/stepper_motor/msg/LinearStepperMove.msg" NAME_WE)
add_dependencies(stepper_motor_generate_messages_lisp _stepper_motor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(stepper_motor_genlisp)
add_dependencies(stepper_motor_genlisp stepper_motor_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS stepper_motor_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(stepper_motor
  "/home/ubuntu/test/src/stepper_motor/msg/StepperConfig.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/stepper_motor
)
_generate_msg_nodejs(stepper_motor
  "/home/ubuntu/test/src/stepper_motor/msg/StepperMove.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/stepper_motor
)
_generate_msg_nodejs(stepper_motor
  "/home/ubuntu/test/src/stepper_motor/msg/LinearStepperConfig.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/stepper_motor
)
_generate_msg_nodejs(stepper_motor
  "/home/ubuntu/test/src/stepper_motor/msg/LinearStepperMove.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/stepper_motor
)

### Generating Services

### Generating Module File
_generate_module_nodejs(stepper_motor
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/stepper_motor
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(stepper_motor_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(stepper_motor_generate_messages stepper_motor_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/test/src/stepper_motor/msg/StepperConfig.msg" NAME_WE)
add_dependencies(stepper_motor_generate_messages_nodejs _stepper_motor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/test/src/stepper_motor/msg/StepperMove.msg" NAME_WE)
add_dependencies(stepper_motor_generate_messages_nodejs _stepper_motor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/test/src/stepper_motor/msg/LinearStepperConfig.msg" NAME_WE)
add_dependencies(stepper_motor_generate_messages_nodejs _stepper_motor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/test/src/stepper_motor/msg/LinearStepperMove.msg" NAME_WE)
add_dependencies(stepper_motor_generate_messages_nodejs _stepper_motor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(stepper_motor_gennodejs)
add_dependencies(stepper_motor_gennodejs stepper_motor_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS stepper_motor_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(stepper_motor
  "/home/ubuntu/test/src/stepper_motor/msg/StepperConfig.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/stepper_motor
)
_generate_msg_py(stepper_motor
  "/home/ubuntu/test/src/stepper_motor/msg/StepperMove.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/stepper_motor
)
_generate_msg_py(stepper_motor
  "/home/ubuntu/test/src/stepper_motor/msg/LinearStepperConfig.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/stepper_motor
)
_generate_msg_py(stepper_motor
  "/home/ubuntu/test/src/stepper_motor/msg/LinearStepperMove.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/stepper_motor
)

### Generating Services

### Generating Module File
_generate_module_py(stepper_motor
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/stepper_motor
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(stepper_motor_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(stepper_motor_generate_messages stepper_motor_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/test/src/stepper_motor/msg/StepperConfig.msg" NAME_WE)
add_dependencies(stepper_motor_generate_messages_py _stepper_motor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/test/src/stepper_motor/msg/StepperMove.msg" NAME_WE)
add_dependencies(stepper_motor_generate_messages_py _stepper_motor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/test/src/stepper_motor/msg/LinearStepperConfig.msg" NAME_WE)
add_dependencies(stepper_motor_generate_messages_py _stepper_motor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/test/src/stepper_motor/msg/LinearStepperMove.msg" NAME_WE)
add_dependencies(stepper_motor_generate_messages_py _stepper_motor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(stepper_motor_genpy)
add_dependencies(stepper_motor_genpy stepper_motor_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS stepper_motor_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/stepper_motor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/stepper_motor
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(stepper_motor_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET stepper_motor_generate_messages_cpp)
  add_dependencies(stepper_motor_generate_messages_cpp stepper_motor_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/stepper_motor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/stepper_motor
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(stepper_motor_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET stepper_motor_generate_messages_eus)
  add_dependencies(stepper_motor_generate_messages_eus stepper_motor_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/stepper_motor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/stepper_motor
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(stepper_motor_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET stepper_motor_generate_messages_lisp)
  add_dependencies(stepper_motor_generate_messages_lisp stepper_motor_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/stepper_motor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/stepper_motor
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(stepper_motor_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET stepper_motor_generate_messages_nodejs)
  add_dependencies(stepper_motor_generate_messages_nodejs stepper_motor_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/stepper_motor)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/stepper_motor\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/stepper_motor
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  string(REGEX REPLACE "([][+.*()^])" "\\\\\\1" ESCAPED_PATH "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/stepper_motor")
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/stepper_motor
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${ESCAPED_PATH}/.+/__init__.pyc?$"
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(stepper_motor_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET stepper_motor_generate_messages_py)
  add_dependencies(stepper_motor_generate_messages_py stepper_motor_generate_messages_py)
endif()
