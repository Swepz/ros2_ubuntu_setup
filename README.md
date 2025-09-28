# ROS2 Development Environment Setup

Automated ROS2 installation for Ubuntu using Ansible. Supports both Jazzy (24.04) and Humble (22.04).

## Quick Start

```bash
# Install Ansible
sudo apt update && sudo apt install ansible

# For Ubuntu 24.04 - Install ROS2 Jazzy (default)
make install

# For Ubuntu 22.04 - Install ROS2 Humble
make humble
```

## Supported Versions

| ROS2 Version | Ubuntu Version | Command |
|-------------|---------------|---------|
| Jazzy (latest) | 24.04 (Noble) | `make jazzy` |
| Humble (LTS) | 22.04 (Jammy) | `make humble` |

## What Gets Installed

**Core:**
- ROS2 Desktop (Jazzy or Humble)
- Navigation2 packages
- Build tools, Python environment
- Development tools (colcon, rosdep, vcstool)

**Version-specific:**
- Humble: TurtleBot3 Gazebo simulation
- Jazzy: Nav2 minimal TB packages, loopback sim

**Additional tools:**
- Docker
- Visual Studio Code with ROS2 extensions
- Oh-My-Bash, tmux, GitHub CLI

## Commands

```bash
make jazzy        # Install ROS2 Jazzy
make humble       # Install ROS2 Humble
make check        # Preview what would be installed
make test         # Test syntax
```

## Manual Installation

```bash
# For custom options
ansible-playbook -i localhost, playbook.yml --ask-become-pass

# Specify ROS2 version
ansible-playbook -i localhost, playbook.yml --ask-become-pass -e ros_distro=humble
```

## Project Structure

```
├── playbook.yml          # Main playbook
├── Makefile             # Simple commands
└── tasks/
    ├── dependencies.yml  # System packages
    ├── ros2.yml         # ROS2 installation (handles both versions)
    ├── extras.yml       # Optional tools
    ├── docker.yml       # Docker
    └── vscode.yml       # VSCode
```

## Post-Installation

1. Restart terminal or run `source ~/.bashrc`
2. Test ROS2: `ros2 run demo_nodes_cpp talker`
3. For Docker: logout/login for group changes

## Testing Navigation2

```bash
# For Jazzy - TurtleBot4 loopback simulation
ros2 launch nav2_bringup tb4_loopback_simulation.launch.py

# For Humble - TurtleBot3 simulation
export TURTLEBOT3_MODEL=burger  # Already set in bashrc
ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
```

## Notes

- Automatically detects and verifies correct Ubuntu version for each ROS2 distro
- Idempotent - safe to run multiple times
- Version-specific environment variables configured automatically