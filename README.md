# ROS2 Jazzy Ubuntu 24.04 Setup

Automated ROS2 Jazzy installation for Ubuntu 24.04 using Ansible.

## Quick Start

```bash
# Install Ansible
sudo apt update && sudo apt install ansible

# Install ROS2
make install

# Or install everything (ROS2 + Docker + VSCode)
make all
```

## What Gets Installed

**Core (always):**
- ROS2 Jazzy Desktop with Navigation2
- Build tools, Python environment, networking setup

**Optional:**
- Docker (`make docker`)
- VSCode with ROS2 extensions (`make vscode`)
- Extras: Oh-My-Bash, tmux, GitHub CLI (`make extras`)

## Commands

```bash
make help     # Show all commands
make check    # Dry run
make test     # Test in Docker
```

## Files

- `playbook.yml` - Main playbook
- `group_vars/all.yml` - Configuration
- `tasks/` - Installation tasks
  - `dependencies.yml` - System packages and networking
  - `ros2.yml` - ROS2 installation
  - `extras.yml` - Optional tools
  - `docker.yml` - Docker
  - `vscode.yml` - VSCode

## Post-Installation

1. Restart terminal
2. For Docker: logout/login
3. Test ROS2: `ros2 --version`