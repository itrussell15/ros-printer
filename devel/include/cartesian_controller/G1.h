// Generated by gencpp from file cartesian_controller/G1.msg
// DO NOT EDIT!


#ifndef CARTESIAN_CONTROLLER_MESSAGE_G1_H
#define CARTESIAN_CONTROLLER_MESSAGE_G1_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <geometry_msgs/Vector3.h>

namespace cartesian_controller
{
template <class ContainerAllocator>
struct G1_
{
  typedef G1_<ContainerAllocator> Type;

  G1_()
    : header()
    , position()
    , tool_speed(0)  {
    }
  G1_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , position(_alloc)
    , tool_speed(0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _position_type;
  _position_type position;

   typedef int64_t _tool_speed_type;
  _tool_speed_type tool_speed;





  typedef boost::shared_ptr< ::cartesian_controller::G1_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cartesian_controller::G1_<ContainerAllocator> const> ConstPtr;

}; // struct G1_

typedef ::cartesian_controller::G1_<std::allocator<void> > G1;

typedef boost::shared_ptr< ::cartesian_controller::G1 > G1Ptr;
typedef boost::shared_ptr< ::cartesian_controller::G1 const> G1ConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cartesian_controller::G1_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cartesian_controller::G1_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::cartesian_controller::G1_<ContainerAllocator1> & lhs, const ::cartesian_controller::G1_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.position == rhs.position &&
    lhs.tool_speed == rhs.tool_speed;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::cartesian_controller::G1_<ContainerAllocator1> & lhs, const ::cartesian_controller::G1_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace cartesian_controller

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::cartesian_controller::G1_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cartesian_controller::G1_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cartesian_controller::G1_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cartesian_controller::G1_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cartesian_controller::G1_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cartesian_controller::G1_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cartesian_controller::G1_<ContainerAllocator> >
{
  static const char* value()
  {
    return "140562008abdeeb2209e48c70e6b4eb8";
  }

  static const char* value(const ::cartesian_controller::G1_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x140562008abdeeb2ULL;
  static const uint64_t static_value2 = 0x209e48c70e6b4eb8ULL;
};

template<class ContainerAllocator>
struct DataType< ::cartesian_controller::G1_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cartesian_controller/G1";
  }

  static const char* value(const ::cartesian_controller::G1_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cartesian_controller::G1_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"geometry_msgs/Vector3 position\n"
"int64 tool_speed\n"
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
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Vector3\n"
"# This represents a vector in free space. \n"
"# It is only meant to represent a direction. Therefore, it does not\n"
"# make sense to apply a translation to it (e.g., when applying a \n"
"# generic rigid transformation to a Vector3, tf2 will only apply the\n"
"# rotation). If you want your data to be translatable too, use the\n"
"# geometry_msgs/Point message instead.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::cartesian_controller::G1_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cartesian_controller::G1_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.position);
      stream.next(m.tool_speed);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct G1_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cartesian_controller::G1_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cartesian_controller::G1_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "position: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.position);
    s << indent << "tool_speed: ";
    Printer<int64_t>::stream(s, indent + "  ", v.tool_speed);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CARTESIAN_CONTROLLER_MESSAGE_G1_H