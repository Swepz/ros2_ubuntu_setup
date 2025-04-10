#!/bin/bash

# Source common functions
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/common.sh"

echo "Starting ROS2 Jazzy installation..."

# Set ROS2 distribution to Jazzy
ROS2_DISTRO="jazzy"

# Install ROS2 Jazzy
echo "Installing ROS2 Jazzy..."
ensure_dir ~/Downloads
cd ~/Downloads
git clone https://github.com/Tiryoh/ros2_setup_scripts_ubuntu.git
cd ros2_setup_scripts_ubuntu
chmod +x "ros2-jazzy-desktop-main.sh"
./ros2-jazzy-desktop-main.sh
check_status "ROS2 Jazzy installation"

# Install Navigation2 and dependencies
echo "Installing Navigation2 and dependencies..."
# Jazzy-specific packages
sudo apt install -y ros-jazzy-navigation2
sudo apt install -y ros-jazzy-nav2-bringup
sudo apt install -y ros-jazzy-nav2-minimal-tb*
sudo apt install -y ros-jazzy-nav2-loopback-sim
check_status "Navigation2 installation"

# Add ROS2 and development environment to bashrc
echo "Configuring ROS2 environment..."
echo '' >>~/.bashrc
echo "# ROS2 Jazzy and development environment" >>~/.bashrc
echo "source /opt/ros/jazzy/setup.bash" >>~/.bashrc
echo 'source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash' >>~/.bashrc
echo 'source /usr/share/colcon_cd/function/colcon_cd.sh' >>~/.bashrc
echo "export _colcon_cd_root=/opt/ros/jazzy/" >>~/.bashrc

check_status "ROS2 environment configuration"

# Source the ROS2 environment for the current session
source "/opt/ros/jazzy/setup.bash"

echo "ROS2 Jazzy installation completed successfully!"
echo ""
echo "Important: Please restart your terminal for the ROS2 environment to take effect."
