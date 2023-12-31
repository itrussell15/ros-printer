// Generated by gencpp from file stepper_motor/position_msg.msg
// DO NOT EDIT!


#ifndef STEPPER_MOTOR_MESSAGE_POSITION_MSG_H
#define STEPPER_MOTOR_MESSAGE_POSITION_MSG_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace stepper_motor
{
template <class ContainerAllocator>
struct position_msg_
{
  typedef position_msg_<ContainerAllocator> Type;

  position_msg_()
    : header()
    , abs_position(0)
    , speed(0)  {
    }
  position_msg_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , abs_position(0)
    , speed(0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef int64_t _abs_position_type;
  _abs_position_type abs_position;

   typedef int64_t _speed_type;
  _speed_type speed;





  typedef boost::shared_ptr< ::stepper_motor::position_msg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::stepper_motor::position_msg_<ContainerAllocator> const> ConstPtr;

}; // struct position_msg_

typedef ::stepper_motor::position_msg_<std::allocator<void> > position_msg;

typedef boost::shared_ptr< ::stepper_motor::position_msg > position_msgPtr;
typedef boost::shared_ptr< ::stepper_motor::position_msg const> position_msgConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::stepper_motor::position_msg_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::stepper_motor::position_msg_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::stepper_motor::position_msg_<ContainerAllocator1> & lhs, const ::stepper_motor::position_msg_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.abs_position == rhs.abs_position &&
    lhs.speed == rhs.speed;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::stepper_motor::position_msg_<ContainerAllocator1> & lhs, const ::stepper_motor::position_msg_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace stepper_motor

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::stepper_motor::position_msg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::stepper_motor::position_msg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::stepper_motor::position_msg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::stepper_motor::position_msg_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::stepper_motor::position_msg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::stepper_motor::position_msg_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::stepper_motor::position_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "39a958d42d70ce7e9cb38bf6691bdd7b";
  }

  static const char* value(const ::stepper_motor::position_msg_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x39a958d42d70ce7eULL;
  static const uint64_t static_value2 = 0x9cb38bf6691bdd7bULL;
};

template<class ContainerAllocator>
struct DataType< ::stepper_motor::position_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "stepper_motor/position_msg";
  }

  static const char* value(const ::stepper_motor::position_msg_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::stepper_motor::position_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"int64 abs_position\n"
"int64 speed\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::stepper_motor::position_msg_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::stepper_motor::position_msg_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.abs_position);
      stream.next(m.speed);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct position_msg_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::stepper_motor::position_msg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::stepper_motor::position_msg_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "abs_position: ";
    Printer<int64_t>::stream(s, indent + "  ", v.abs_position);
    s << indent << "speed: ";
    Printer<int64_t>::stream(s, indent + "  ", v.speed);
  }
};

} // namespace message_operations
} // namespace ros

#endif // STEPPER_MOTOR_MESSAGE_POSITION_MSG_H
