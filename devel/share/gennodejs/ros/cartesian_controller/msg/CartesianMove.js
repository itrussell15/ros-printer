// Auto-generated. Do not edit!

// (in-package cartesian_controller.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let stepper_motor = _finder('stepper_motor');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class CartesianMove {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.x = null;
      this.y = null;
      this.z = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = new stepper_motor.msg.AbsoluteMove();
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = new stepper_motor.msg.AbsoluteMove();
      }
      if (initObj.hasOwnProperty('z')) {
        this.z = initObj.z
      }
      else {
        this.z = new stepper_motor.msg.AbsoluteMove();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CartesianMove
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [x]
    bufferOffset = stepper_motor.msg.AbsoluteMove.serialize(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = stepper_motor.msg.AbsoluteMove.serialize(obj.y, buffer, bufferOffset);
    // Serialize message field [z]
    bufferOffset = stepper_motor.msg.AbsoluteMove.serialize(obj.z, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CartesianMove
    let len;
    let data = new CartesianMove(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [x]
    data.x = stepper_motor.msg.AbsoluteMove.deserialize(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = stepper_motor.msg.AbsoluteMove.deserialize(buffer, bufferOffset);
    // Deserialize message field [z]
    data.z = stepper_motor.msg.AbsoluteMove.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += stepper_motor.msg.AbsoluteMove.getMessageSize(object.x);
    length += stepper_motor.msg.AbsoluteMove.getMessageSize(object.y);
    length += stepper_motor.msg.AbsoluteMove.getMessageSize(object.z);
    return length;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cartesian_controller/CartesianMove';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '168cb11f321e52482a5826f10f646af5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    stepper_motor/AbsoluteMove x
    stepper_motor/AbsoluteMove y
    stepper_motor/AbsoluteMove z
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
    MSG: stepper_motor/AbsoluteMove
    Header header
    int64 abs_position
    int64 speed
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CartesianMove(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.x !== undefined) {
      resolved.x = stepper_motor.msg.AbsoluteMove.Resolve(msg.x)
    }
    else {
      resolved.x = new stepper_motor.msg.AbsoluteMove()
    }

    if (msg.y !== undefined) {
      resolved.y = stepper_motor.msg.AbsoluteMove.Resolve(msg.y)
    }
    else {
      resolved.y = new stepper_motor.msg.AbsoluteMove()
    }

    if (msg.z !== undefined) {
      resolved.z = stepper_motor.msg.AbsoluteMove.Resolve(msg.z)
    }
    else {
      resolved.z = new stepper_motor.msg.AbsoluteMove()
    }

    return resolved;
    }
};

module.exports = CartesianMove;
