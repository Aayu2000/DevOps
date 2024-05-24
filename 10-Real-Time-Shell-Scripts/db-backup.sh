###############################
# Author: Aayush
# Date: 24/05/2024
# Version: V1
# Description: This script will backup mysql database
#
# Usage - call the script it will create a backup of the specified database in /home/ubuntu/Database_Backup with a timestamp
###############################

#!/bin/bash

# Variables
DB_USER="root"
DB_NAME="mydatabase"
OUTPUT_DIR="/home/ubuntu/Database_Backup/"
TIMESTAMP=$(date +"%d-%m-%Y_%H-%M-%S")
OUTPUT_SUBDIR="${OUTPUT_DIR}/${TIMESTAMP}"
OUTPUT_FILE="${OUTPUT_SUBDIR}/backup_${DB_NAME}.sql"

# Prompt for MySQL root password
read -sp 'Enter MySQL root password: ' DB_PASSWORD
echo

# Check if the output directory exists
if [ ! -d "$OUTPUT_DIR" ]; then
    echo "Output directory does not exist. Creating it now..."
    mkdir -p "$OUTPUT_DIR"
fi

# Create the datetime-stamped subdirectory
if [ ! -d "$OUTPUT_SUBDIR" ]; then
    echo "Creating backup directory: $OUTPUT_SUBDIR"
    mkdir -p "$OUTPUT_SUBDIR"
fi

# Take the MySQL database backup
mysqldump -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" > "$OUTPUT_FILE"

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Database backup successful. Backup file created at: $OUTPUT_FILE"
else
    echo "Database backup failed."
    exit 1
fi

