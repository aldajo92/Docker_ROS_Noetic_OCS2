FROM ros:noetic-ros-base-focal
ENV ROS_DISTRO noetic

RUN apt update && apt install -y \
    python3-rosinstall \
    git \
    nano \
    graphviz \
    tmux wget curl

RUN apt install -y ros-noetic-tf2-tools iputils-ping net-tools ros-noetic-catkin python3-catkin-tools

RUN apt install -y ros-noetic-tf2-tools iputils-ping net-tools git

RUN apt update && apt install -y \
    libeigen3-dev \
    libglpk-dev \
    ros-noetic-pybind11-catkin \
    doxygen \
    doxygen-latex


############################################################################################################
RUN apt install -y rsync
# Install necessary packages
RUN apt-get update && apt-get install -y wget rsync

# Download and extract ONNX Runtime
RUN cd /tmp && \
    wget https://github.com/microsoft/onnxruntime/releases/download/v1.7.0/onnxruntime-linux-x64-1.7.0.tgz && \
    tar xf onnxruntime-linux-x64-1.7.0.tgz

# Install ONNX Runtime
RUN mkdir -p /usr/local/include/onnxruntime /usr/local/lib /usr/local/share/cmake/onnxruntime

RUN rsync -a /tmp/onnxruntime-linux-x64-1.7.0/include/ /usr/local/include/onnxruntime && \
    rsync -a /tmp/onnxruntime-linux-x64-1.7.0/lib/ /usr/local/lib
    # rsync -a /catkin_ws/src/ocs2/ocs2_mpcnet/ocs2_mpcnet_core/misc/onnxruntime/cmake/ /usr/local/share/cmake/onnxruntime

# Cleanup temporary files
RUN rm -rf /tmp/onnxruntime-linux-x64-1.7.0.tgz /tmp/onnxruntime-linux-x64-1.7.0

# Set environment variables if necessary
# ENV LD_LIBRARY_PATH=/usr/local/lib:${LD_LIBRARY_PATH}
############################################################################################################

RUN apt install -y liburdfdom-dev liboctomap-dev libassimp-dev

RUN apt install -y ros-noetic-rqt-multiplot

RUN apt install -y libboost-log-dev \
    ros-noetic-interactive-markers \
    ros-noetic-grid-map-msgs \
    ros-noetic-grid-map-filters \
    ros-noetic-tf-conversions \
    ros-noetic-urdf \
    ros-noetic-image-transport

# Non interactive
ENV DEBIAN_FRONTEND=noninteractive
RUN apt install -y ros-noetic-pcl-ros \
    ros-noetic-rviz \
    ros-noetic-kdl-parser \
    ros-noetic-octomap-msgs \
    ros-noetic-costmap-2d \
    ros-noetic-robot-state-publisher \
    libgmp-dev \
    libmpfr-dev \
    python3-sphinx \
    ros-noetic-xacro

RUN apt install -y gnome-terminal

COPY ./autostart.sh /autostart.sh
RUN chmod +x /autostart.sh

ENTRYPOINT [ "/ros_entrypoint.sh" ]
