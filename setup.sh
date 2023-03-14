#!/bin/bash

# Update system
echo "Updating system packages..."
sudo apt-get update && sudo apt-get upgrade -y

# Install basic packages
echo "Installing basic packages..."
sudo apt-get install -y nano git curl wget htop

# Set up user
read -p "Enter your desired password: " PASSWORD
sudo passwd $PASSWORD

# Install additional packages (optional)
echo "Installing additional packages..."
sudo apt-get install -y build-essential python3 python3-pip

# Configure timezone
echo "Configuring timezone..."
sudo dpkg-reconfigure tzdata

# Add user-specific configurations (optional)
echo "Setting up user configurations..."
sudo -u kali bash -c "git clone https://github.com/kaipyroami/dotfiles.git ~/dotfiles"
sudo -u kali bash -c "cd ~/dotfiles && ./install.sh"

echo "Downloading SecLists"
sudo -u kali bash -c "git clone https://github.com/danielmiessler/SecLists.git ~/SecLists"

echo "Install Jupyter Lab"
sudo -u kali bash -c "pip3 install jupyterlab"

# Reboot system
echo "Configuration complete. Rebooting system..."
sudo reboot
