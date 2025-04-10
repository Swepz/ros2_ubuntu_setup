#!/bin/bash

# Source common functions
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/common.sh"

echo "Starting ROS2 Humble installation..."

# Set ROS2 distribution to Humble
ROS2_DISTRO="humble"

# Install ROS2 Humble
echo "Installing ROS2 Humble..."
ensure_dir ~/Downloads
cd ~/Downloads
git clone https://github.com/Tiryoh/ros2_setup_scripts_ubuntu.git
cd ros2_setup_scripts_ubuntu
chmod +x "ros2-humble-desktop-main.sh"
./ros2-humble-desktop-main.sh
check_status "ROS2 Humble installation"

# Install Navigation2 and dependencies
echo "Installing Navigation2 and dependencies..."
# Humble-specific packages
sudo apt install -y ros-humble-navigation2
sudo apt install -y ros-humble-nav2-bringup
sudo apt install -y ros-humble-turtlebot3-gazebo
check_status "Navigation2 installation"

# Add ROS2 and development environment to bashrc
echo "Configuring ROS2 environment..."
echo '' >>~/.bashrc
echo "# ROS2 Humble and development environment" >>~/.bashrc
echo "source /opt/ros/humble/setup.bash" >>~/.bashrc
echo 'source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash' >>~/.bashrc
echo 'source /usr/share/colcon_cd/function/colcon_cd.sh' >>~/.bashrc
echo "export _colcon_cd_root=/opt/ros/humble/" >>~/.bashrc

# Add Turtlebot3 configurations
echo 'export TURTLEBOT3_MODEL=burger' >>~/.bashrc
echo "export GAZEBO_MODEL_PATH=\$GAZEBO_MODEL_PATH:/opt/ros/humble/share/turtlebot3_gazebo/models" >>~/.bashrc
echo "source /usr/share/gazebo/setup.bash" >>~/.bashrc
echo "export ROS_LOCALHOST_ONLY=1" >>~/.bashrc

check_status "ROS2 environment configuration"

# Source the ROS2 environment for the current session
source "/opt/ros/humble/setup.bash"

echo "ROS2 Humble installation completed successfully!"
echo ""
echo "Important: Please restart your terminal for the ROS2 environment to take effect."
