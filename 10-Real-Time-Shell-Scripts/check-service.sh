###############################
# Author: Aayush
# Date: 23/05/2024
# Version: V1
# This script will check if the service is running if not then it will start the service
#
# Usage - call the script with the service name
###############################

#!/bin/bash

# Function to check if a service exists
service_exists() {
    if systemctl list-units --type=service --all | grep -Fq "$1.service"; then
        return 0
    else
        return 1
    fi
}

# Function to check if a service is running
service_running() {
    if systemctl is-active --quiet "$1"; then
        return 0
    else
        return 1
    fi
}

# Check if a service name was provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <service-name>"
    exit 1
fi

SERVICE_NAME="$1"

# Check if the service exists
if service_exists "$SERVICE_NAME"; then
    # Check if the service is running
    if service_running "$SERVICE_NAME"; then
        echo "Service '$SERVICE_NAME' is already running."
    else
        # Start the service if it is not running
        echo "Service '$SERVICE_NAME' is not running. Starting it now..."
        sudo systemctl start "$SERVICE_NAME"
        
        # Check again if the service is running after attempting to start it
        if service_running "$SERVICE_NAME"; then
            echo "Service '$SERVICE_NAME' started successfully."
        else
            echo "Failed to start service '$SERVICE_NAME'."
        fi
    fi
else
    echo "Could not find any service named: $SERVICE_NAME"
fi

