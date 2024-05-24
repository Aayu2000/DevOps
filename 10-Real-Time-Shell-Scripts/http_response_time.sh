#!/bin/bash

# Author: Aayush
# Version: 1.0
# Description: This script checks the HTTP response time for multiple sites.
# Usage: Modify the sites array with the URLs you want to test, then run the script.

# Array of sites to check
sites=(
    "https://www.linkedin.com"
    "https://www.google.com"
    "https://www.github.com"
)

# Function to check response time
check_response_time() {
    site=$1
    response_time=$(curl -o /dev/null -s -w "%{time_total}\n" "$site")
    echo "Response time for $site: $response_time seconds"
}

# Loop through the sites array and check response time
for site in "${sites[@]}"
do
    check_response_time "$site"
done

