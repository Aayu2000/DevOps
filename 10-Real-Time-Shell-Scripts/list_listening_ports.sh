#!/bin/bash
#
# Author: Aayush
# Version: 1.0
# Description: This script lists all listening ports using net-tools' netstat command.
# Usage: ./list_listening_ports.sh
#

# Check if net-tools package is installed
if ! dpkg -s net-tools &> /dev/null; then
    echo "Error: net-tools package is not installed."
    exit 1
fi

# List all listening ports
echo "List of Listening Ports:"
netstat -tuln

