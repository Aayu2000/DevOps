###############################
# Author: Aayush
# Date: 24/05/2024
# Version: V1
# Description: This script will check the system uptime
#
# Usage - call the script it will show the system uptime
###############################

#!/bin/bash

# Get the current date and time
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Get the system uptime
UPTIME=$(uptime -p)

# Print the timestamp and uptime to the terminal
echo "[$TIMESTAMP] System Uptime: $UPTIME"

