#!/bin/bash

USE_GNOME='gnome-terminal -- '

${USE_GNOME}bash -c 'source /opt/ros/noetic/setup.bash && roscore' &
sleep 2

${USE_GNOME}bash -c 'source /opt/ros/noetic/setup.bash && rostopic echo /strout' &
${USE_GNOME}bash -c 'source /opt/ros/noetic/setup.bash && rostopic pub -r 1 /strin std_msgs/String "test"' &

## source irsl_catkin_ws/install/setup.bash && roslaunch irsl_docker_pkg_sample run.launch
## source irsl_catkin_ws/install/setup.bash && roslaunch irsl_docker_pkg_sample run_docker.launch ## ??
## source irsl_catkin_ws/install/setup.bash && rosrun irsl_docker_pkg_sample run_docker.sh
