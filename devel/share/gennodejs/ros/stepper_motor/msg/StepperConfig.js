// Auto-generated. Do not edit!

// (in-package stepper_motor.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class StepperConfig {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.set_speed = null;
      this.max_speed = null;
      this.min_speed = null;
      this.accel = null;
      this.deccel = null;
      this.step_pin = null;
      this.dir_pin = null;
      this.steps_per_rev = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('set_speed')) {
        this.set_speed = initObj.set_speed
      }
      else {
        this.set_speed = 0.0;
      }
      if (initObj.hasOwnProperty('max_speed')) {
        this.max_speed = initObj.max_speed
      }
      else {
        this.max_speed = 0.0;
      }
      if (initObj.hasOwnProperty('min_speed')) {
        this.min_speed = initObj.min_speed
      }
      else {
        this.min_speed = 0.0;
      }
      if (initObj.hasOwnProperty('accel')) {
        this.accel = initObj.accel
      }
      else {
        this.accel = 0.0;
      }
      if (initObj.hasOwnProperty('deccel')) {
        this.deccel = initObj.deccel
      }
      else {
        this.deccel = 0.0;
      }
      if (initObj.hasOwnProperty('step_pin')) {
        this.step_pin = initObj.step_pin
      }
      else {
        this.step_pin = 0;
      }
      if (initObj.hasOwnProperty('dir_pin')) {
        this.dir_pin = initObj.dir_pin
      }
      else {
        this.dir_pin = 0;
      }
      if (initObj.hasOwnProperty('steps_per_rev')) {
        this.steps_per_rev = initObj.steps_per_rev
      }
      else {
        this.steps_per_rev = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type StepperConfig
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [set_speed]
    bufferOffset = _serializer.float32(obj.set_speed, buffer, bufferOffset);
    // Serialize message field [max_speed]
    bufferOffset = _serializer.float32(obj.max_speed, buffer, bufferOffset);
    // Serialize message field [min_speed]
    bufferOffset = _serializer.float32(obj.min_speed, buffer, bufferOffset);
    // Serialize message field [accel]
    bufferOffset = _serializer.float32(obj.accel, buffer, bufferOffset);
    // Serialize message field [deccel]
    bufferOffset = _serializer.float32(obj.deccel, buffer, bufferOffset);
    // Serialize message field [step_pin]
    bufferOffset = _serializer.uint8(obj.step_pin, buffer, bufferOffset);
    // Serialize message field [dir_pin]
    bufferOffset = _serializer.uint8(obj.dir_pin, buffer, bufferOffset);
    // Serialize message field [steps_per_rev]
    bufferOffset = _serializer.int64(obj.steps_per_rev, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type StepperConfig
    let len;
    let data = new StepperConfig(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [set_speed]
    data.set_speed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [max_speed]
    data.max_speed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [min_speed]
    data.min_speed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [accel]
    data.accel = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [deccel]
    data.deccel = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [step_pin]
    data.step_pin = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [dir_pin]
    data.dir_pin = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [steps_per_rev]
    data.steps_per_rev = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 30;
  }

  static datatype() {
    // Returns string type for a message object
    return 'stepper_motor/StepperConfig';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f33d563e99c62fa98073f3435668c039';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float32 set_speed
    float32 max_speed
    float32 min_speed
    float32 accel
    float32 deccel
    uint8 step_pin
    uint8 dir_pin
    int64 steps_per_rev
    
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new StepperConfig(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.set_speed !== undefined) {
      resolved.set_speed = msg.set_speed;
    }
    else {
      resolved.set_speed = 0.0
    }

    if (msg.max_speed !== undefined) {
      resolved.max_speed = msg.max_speed;
    }
    else {
      resolved.max_speed = 0.0
    }

    if (msg.min_speed !== undefined) {
      resolved.min_speed = msg.min_speed;
    }
    else {
      resolved.min_speed = 0.0
    }

    if (msg.accel !== undefined) {
      resolved.accel = msg.accel;
    }
    else {
      resolved.accel = 0.0
    }

    if (msg.deccel !== undefined) {
      resolved.deccel = msg.deccel;
    }
    else {
      resolved.deccel = 0.0
    }

    if (msg.step_pin !== undefined) {
      resolved.step_pin = msg.step_pin;
    }
    else {
      resolved.step_pin = 0
    }

    if (msg.dir_pin !== undefined) {
      resolved.dir_pin = msg.dir_pin;
    }
    else {
      resolved.dir_pin = 0
    }

    if (msg.steps_per_rev !== undefined) {
      resolved.steps_per_rev = msg.steps_per_rev;
    }
    else {
      resolved.steps_per_rev = 0
    }

    return resolved;
    }
};

module.exports = StepperConfig;
