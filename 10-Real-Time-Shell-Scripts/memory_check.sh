#!/bin/bash

# Author: Aayush
# Version: 1.0
# Description: This script checks all system processes and shows their memory usage. It also displays a warning if memory usage is above 80% of the available memory.
# Usage: ./memory_check.sh

# Function to get total memory
get_total_memory() {
    free -m | awk '/^Mem:/{print $2}'
}

# Function to get used memory
get_used_memory() {
    free -m | awk '/^Mem:/{print $3}'
}

# Function to get memory usage of each process
get_process_memory_usage() {
    ps aux --sort=-%mem | awk 'NR==1{print $0} NR>1{printf "%-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s\n", $1, $2, $3, $4, $5, $6, $7, $8, $9}'
}

# Function to display warning if memory usage is above 80%
check_memory_usage() {
    total_memory=$(get_total_memory)
    used_memory=$(get_used_memory)
    memory_usage_percentage=$((used_memory * 100 / total_memory))

    echo "Total Memory: ${total_memory}MB"
    echo "Used Memory: ${used_memory}MB"
    echo "Memory Usage: ${memory_usage_percentage}%"

    if [ "$memory_usage_percentage" -gt 80 ]; then
        echo "Warning: Memory usage is above 80%!"
    fi
}

# Display the memory usage of each process
echo "Memory usage of each process:"
get_process_memory_usage

# Check the overall memory usage and display a warning if necessary
check_memory_usage
