#!/bin/bash

# Check if user has provided a valid number as input
if [[ ! $1 =~ ^[0-9]+$ ]]; then
    echo "Usage: $0 <number_of_files>"
    exit 1
fi

# Get the number of files from user input
num_files=$1

# Loop to create text files
for ((i=1; i<=$num_files; i++)); do
    filename="file_$i.txt"
    echo "Creating $filename"
    touch "$filename"
done

echo "Created $num_files text files."

