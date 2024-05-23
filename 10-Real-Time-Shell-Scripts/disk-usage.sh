#!/bin/bash

# Set the threshold percentage
THRESHOLD=80

# Get the disk usage percentage of the root filesystem
# You can change '/' to any specific mount point if needed
USAGE=$(df -h / | grep -vE '^Filesystem' | awk '{print $5}' | sed 's/%//')

# Check if the usage is above the threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "Warning: Disk usage is above ${THRESHOLD}% (currently ${USAGE}%)"
else
    echo "Disk usage is under control (currently ${USAGE}%)"
fi

