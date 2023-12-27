// Generated by gencpp from file stepper_motor/StepperConfig.msg
// DO NOT EDIT!


#ifndef STEPPER_MOTOR_MESSAGE_STEPPERCONFIG_H
#define STEPPER_MOTOR_MESSAGE_STEPPERCONFIG_H


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
struct StepperConfig_
{
  typedef StepperConfig_<ContainerAllocator> Type;

  StepperConfig_()
    : header()
    , set_speed(0.0)
    , max_speed(0.0)
    , min_speed(0.0)
    , accel(0.0)
    , deccel(0.0)
    , step_pin(0)
    , dir_pin(0)
    , steps_per_rev(0)  {
    }
  StepperConfig_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , set_speed(0.0)
    , max_speed(0.0)
    , min_speed(0.0)
    , accel(0.0)
    , deccel(0.0)
    , step_pin(0)
    , dir_pin(0)
    , steps_per_rev(0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef float _set_speed_type;
  _set_speed_type set_speed;

   typedef float _max_speed_type;
  _max_speed_type max_speed;

   typedef float _min_speed_type;
  _min_speed_type min_speed;

   typedef float _accel_type;
  _accel_type accel;

   typedef float _deccel_type;
  _deccel_type deccel;

   typedef uint8_t _step_pin_type;
  _step_pin_type step_pin;

   typedef uint8_t _dir_pin_type;
  _dir_pin_type dir_pin;

   typedef int64_t _steps_per_rev_type;
  _steps_per_rev_type steps_per_rev;





  typedef boost::shared_ptr< ::stepper_motor::StepperConfig_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::stepper_motor::StepperConfig_<ContainerAllocator> const> ConstPtr;

}; // struct StepperConfig_

typedef ::stepper_motor::StepperConfig_<std::allocator<void> > StepperConfig;

typedef boost::shared_ptr< ::stepper_motor::StepperConfig > StepperConfigPtr;
typedef boost::shared_ptr< ::stepper_motor::StepperConfig const> StepperConfigConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::stepper_motor::StepperConfig_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::stepper_motor::StepperConfig_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::stepper_motor::StepperConfig_<ContainerAllocator1> & lhs, const ::stepper_motor::StepperConfig_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.set_speed == rhs.set_speed &&
    lhs.max_speed == rhs.max_speed &&
    lhs.min_speed == rhs.min_speed &&
    lhs.accel == rhs.accel &&
    lhs.deccel == rhs.deccel &&
    lhs.step_pin == rhs.step_pin &&
    lhs.dir_pin == rhs.dir_pin &&
    lhs.steps_per_rev == rhs.steps_per_rev;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::stepper_motor::StepperConfig_<ContainerAllocator1> & lhs, const ::stepper_motor::StepperConfig_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace stepper_motor

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::stepper_motor::StepperConfig_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::stepper_motor::StepperConfig_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::stepper_motor::StepperConfig_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::stepper_motor::StepperConfig_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::stepper_motor::StepperConfig_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::stepper_motor::StepperConfig_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::stepper_motor::StepperConfig_<ContainerAllocator> >
{
  static const char* value()
  {
    return "f33d563e99c62fa98073f3435668c039";
  }

  static const char* value(const ::stepper_motor::StepperConfig_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xf33d563e99c62fa9ULL;
  static const uint64_t static_value2 = 0x8073f3435668c039ULL;
};

template<class ContainerAllocator>
struct DataType< ::stepper_motor::StepperConfig_<ContainerAllocator> >
{
  static const char* value()
  {
    return "stepper_motor/StepperConfig";
  }

  static const char* value(const ::stepper_motor::StepperConfig_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::stepper_motor::StepperConfig_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"float32 set_speed\n"
"float32 max_speed\n"
"float32 min_speed\n"
"float32 accel\n"
"float32 deccel\n"
"uint8 step_pin\n"
"uint8 dir_pin\n"
"int64 steps_per_rev\n"
"\n"
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

  static const char* value(const ::stepper_motor::StepperConfig_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::stepper_motor::StepperConfig_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.set_speed);
      stream.next(m.max_speed);
      stream.next(m.min_speed);
      stream.next(m.accel);
      stream.next(m.deccel);
      stream.next(m.step_pin);
      stream.next(m.dir_pin);
      stream.next(m.steps_per_rev);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct StepperConfig_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::stepper_motor::StepperConfig_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::stepper_motor::StepperConfig_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "set_speed: ";
    Printer<float>::stream(s, indent + "  ", v.set_speed);
    s << indent << "max_speed: ";
    Printer<float>::stream(s, indent + "  ", v.max_speed);
    s << indent << "min_speed: ";
    Printer<float>::stream(s, indent + "  ", v.min_speed);
    s << indent << "accel: ";
    Printer<float>::stream(s, indent + "  ", v.accel);
    s << indent << "deccel: ";
    Printer<float>::stream(s, indent + "  ", v.deccel);
    s << indent << "step_pin: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.step_pin);
    s << indent << "dir_pin: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.dir_pin);
    s << indent << "steps_per_rev: ";
    Printer<int64_t>::stream(s, indent + "  ", v.steps_per_rev);
  }
};

} // namespace message_operations
} // namespace ros

#endif // STEPPER_MOTOR_MESSAGE_STEPPERCONFIG_H
