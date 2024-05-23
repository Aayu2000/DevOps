#!/bin/bash
###############################
# Author: Aayush
# Date: 14/05/2024
# Version: V1
# This script will backup folder with all its content
#
# Usage - call the script it will create a backup of the specified source file or folder
###############################
# Source directory to back up
SOURCE_DIR="/home/ubuntu/Source/"

# Destination directory where backups will be stored
DEST_DIR="/home/ubuntu/Destination/"

# Create a timestamp
TIMESTAMP=$(date +"%d-%m-%Y_%H-%M-%S")

# Create the destination directory with the timestamp
BACKUP_DIR="${DEST_DIR}/backup_${TIMESTAMP}"
mkdir -p "${BACKUP_DIR}"

# Perform the backup using rsync
rsync -av --delete "${SOURCE_DIR}/" "${BACKUP_DIR}/"

# Print a message indicating the backup is complete
echo "Backup of ${SOURCE_DIR} completed at ${TIMESTAMP} and stored in ${BACKUP_DIR}"

