cmake_minimum_required(VERSION 3.0.2)
project(irsl_docker_pkg_sample)

find_package(catkin REQUIRED)

message("build_local: $ENV{IRSL_BUILD_LOCAL}")
if ("$ENV{IRSL_BUILD_LOCAL}")
  message("build_mode: BUILD_LOCAL")
else()
  message("build_mode: JUST_INSTALL_FILES")
endif()

if ("$ENV{IRSL_BUILD_LOCAL}")
### if you require some packages (but not needed for python)
#find_package(catkin REQUIRED  COMPONENTS
#  some_packages ...
#)

## Uncomment this if the package has a setup.py. This macro ensures
## modules and global scripts declared therein get installed
## See http://ros.org/doc/api/catkin/html/user_guide/setup_dot_py.html
catkin_python_setup()
endif()

###################################
## catkin specific configuration ##
###################################
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
## INCLUDE_DIRS: uncomment this if your package contains header files
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need
catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES irsl_docker_pkg_sample
#  CATKIN_DEPENDS irsl_detection_msgs irsl_detection_srvs rospy sensor_msgs std_msgs
#  DEPENDS system_lib
)

#############
## Install ##
#############

# all install targets should use catkin DESTINATION variables
# See http://ros.org/doc/api/catkin/html/adv_user_guide/variables.html

if ("$ENV{IRSL_BUILD_LOCAL}")
## Mark executable scripts (Python etc.) for installation
## in contrast to setup.py, you can choose the destination
catkin_install_python(PROGRAMS
   nodes/sub_and_pub.py
   DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
 )
endif()

## Mark cpp header files for installation
# install(DIRECTORY include/${PROJECT_NAME}/
#   DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
#   FILES_MATCHING PATTERN "*.h"
#   PATTERN ".svn" EXCLUDE
# )

## Mark other files for installation (e.g. launch and bag files, etc.)
install(FILES
  docker/run_docker.sh
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
  PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE
)

install(DIRECTORY
  launch
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
 )
