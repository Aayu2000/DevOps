#!/bin/bash
#
# Author: Aayush
# Version: 1.0
# Description: This script updates all available packages to their latest versions.
# Usage: ./update_packages.sh

# Update package lists
echo "Updating package lists..."
sudo apt update

# Perform upgrade
echo "Upgrading packages..."
sudo apt upgrade -y

# Perform autoremove to clean up unused packages
echo "Removing unused packages..."
sudo apt autoremove -y

echo "All updates completed."
