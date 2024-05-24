#!/bin/bash
###############################
# Author: Aayush
# Date: 24/05/2024
# Version: V1
# This script will check the network connectivity with the specified host
#
# Usage - call the script it will show message as connectivity to host is successful/failed
###############################

# Host to check connectivity
HOST="$1"

# Fixed output file path
OUTPUT_FILE="/home/ubuntu/connectivity-output.txt"

# Check if host is provided as an argument
if [ -z "$HOST" ]; then
    echo "Usage: $0 <host>"
    exit 1
fi

# Function to check connectivity
check_connectivity() {
    if ping -c 1 "$HOST" &> /dev/null; then
        MESSAGE="[$(date +"%Y-%m-%d %H:%M:%S")] Connectivity to $HOST is successful."
    else
        MESSAGE="[$(date +"%Y-%m-%d %H:%M:%S")] Connectivity to $HOST failed."
    fi
    # Print message to terminal and append to output file
    echo "$MESSAGE" | tee -a "$OUTPUT_FILE"
}

# Perform the connectivity check and write to output file
check_connectivity

