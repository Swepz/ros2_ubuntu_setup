# Ubuntu 24.04 - ROS2 Jazzy Development Environment Setup
This repository contains scripts for setting up a development environment on Ubuntu 24.04 with ROS2 Jazzy. The scripts are modular and can be run individually or all at once.

## Structure
```
.
├── install.sh              # Main installation script
└── scripts/
    ├── common.sh          # Common functions used by all scripts
    ├── base.sh            # Base development tools installation
    ├── docker.sh          # Docker installation
    ├── vscode.sh          # VS Code installation and configuration
    └── ros2.sh            # ROS2 Jazzy installation and setup
```
Each script in the `scripts` directory is a self-contained module that can be run independently or through the main `install.sh` script.

## Supported Configuration
- Ubuntu 24.04 LTS with ROS2 Jazzy

## Installation Summary
This setup script installs the following components:

### Base Development Tools
- System packages: git, curl, wget, python-is-python3, build-essential, xclip, ssh
- SSH server with firewall rules
- Oh-My-Bash shell customization
- GitHub CLI
- Powerline Fonts
- Neovim (latest) with vim alias configuration
- tmux with custom configuration
- Python tools: pip3, pylint, yapf, isort

### Docker
- Docker CE
- User added to docker group (requires logout/login to take effect)

### Visual Studio Code
- VS Code with extensions for:
  - ROS development (ms-iot.vscode-ros)
  - Python development (ms-python.python, pylance, debugpy)
  - C++ development (cpptools, cmake-tools)
  - Docker integration
  - Remote development
  - UI enhancements (SynthWave '84 theme, indent-rainbow)
- Custom VS Code settings (theme, sidebar location)

### ROS2 Jazzy
- ROS2 Jazzy for Ubuntu 24.04
- Navigation2 packages
- Nav2 loopback simulation
- Colcon build tools
- Environment configuration in .bashrc

### Modified Configuration Files
- ~/.bashrc (ROS2 environment, aliases)
- ~/.tmux.conf (tmux configuration)
- ~/.config/Code/User/settings.json (VS Code settings)

**Note:** These changes will require a terminal restart or system logout/login to fully take effect.

## Usage
Clone the repository and make the scripts executable:
```bash
git clone https://github.com/Swepz/ros2_ubuntu_setup.git -b jazzy
cd ros2_ubuntu_setup
chmod +x install.sh scripts/*.sh
```

### Running the Installation
You can run the installation in several ways:
1. Install everything:
```bash
./install.sh -a
```

2. Install a specific component:
```bash
./install.sh -c ros2    # Install ROS2 Jazzy

# Other components
./install.sh -c base    # Install base development tools
./install.sh -c docker  # Install Docker
./install.sh -c vscode  # Install VS Code
```

3. View available options:
```bash
./install.sh -h
```

4. List available components:
```bash
./install.sh -l
```

## Post-Installation
After running the installation scripts:
1. Restart your terminal for all changes to take effect
2. Some components may require logging out and back in
3. Check the output of each script for component-specific instructions

### Testing Your Environment
After installation, you can test your ROS2 environment with Navigation2:
```bash
source ~/.bashrc
ros2 launch nav2_bringup loopback_sim_launch.py
```

Note: The simulation might be slow the first time because it needs to download models
