FROM ubuntu:24.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Update and install basic requirements
RUN apt-get update && apt-get install -y \
    sudo \
    ansible \
    python3 \
    python3-pip \
    systemctl \
    && rm -rf /var/lib/apt/lists/*

# Create a test user with sudo privileges
RUN useradd -m -s /bin/bash testuser && \
    echo 'testuser:testpass' | chpasswd && \
    usermod -aG sudo testuser && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Copy the Ansible playbook
COPY . /workspace
WORKDIR /workspace

# Change ownership to testuser
RUN chown -R testuser:testuser /workspace

# Switch to testuser
USER testuser

# Set environment
ENV HOME=/home/testuser
ENV USER=testuser

# Default command
CMD ["/bin/bash"]