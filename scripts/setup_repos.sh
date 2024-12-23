#!/bin/bash

# Cloning repositories with various options
echo "Cloning pinocchio with submodules..."
git clone --recurse-submodules https://github.com/leggedrobotics/pinocchio.git

echo "Cloning hpp-fcl with submodules..."
git clone --recurse-submodules https://github.com/leggedrobotics/hpp-fcl.git

echo "Cloning ocs2_robotic_assets..."
git clone https://github.com/leggedrobotics/ocs2_robotic_assets.git

echo "Cloning specific branch of raisimLib..."
git clone --depth 1 https://github.com/raisimTech/raisimLib.git -b v1.1.01

echo "Cloning ocs2..."
git clone git@github.com:leggedrobotics/ocs2.git

echo "Cloning grid_map..."
git clone https://github.com/ANYbotics/grid_map.git

echo "Cloning elevation_mapping_cupy..."
git clone https://github.com/leggedrobotics/elevation_mapping_cupy.git

echo "Cloning ros_msft_onnx..."
git clone https://github.com/ms-iot/ros_msft_onnx -b noetic-devel

echo "All repositories have been cloned and builds executed where specified."
