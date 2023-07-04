#!/bin/bash

# Update package lists
sudo apt update

# Install SSH client
sudo apt install -y ssh

# Install SSH server (sshd)
sudo apt install -y openssh-server

# Start the SSH server
sudo service ssh start

# Enable SSH server to start on system boot
sudo systemctl enable ssh

# Print SSH status
sudo service ssh status

