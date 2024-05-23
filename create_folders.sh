#!/bin/bash

# Check if the user provided an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <number_of_folders>"
    exit 1
fi

# Check if the argument is a positive integer
if ! [[ "$1" =~ ^[0-9]+$ ]] || [ "$1" -lt 1 ]; then
    echo "Please provide a valid positive integer."
    exit 1
fi

# Create folders
for ((i=1; i<=$1; i++)); do
    mkdir "Folder_$i"
done

echo "Created $1 folders."

