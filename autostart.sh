#!/bin/bash

source /opt/ros/$ROS_DISTRO/setup.bash

rsync -a /catkin_ws/src/ocs2/ocs2_mpcnet/ocs2_mpcnet_core/misc/onnxruntime/cmake/ /usr/local/share/cmake/onnxruntime

# cd /catkin_ws && catkin build

source /opt/ros/noetic/setup.bash && source /catkin_ws/devel/setup.bash --

exec "$@"
