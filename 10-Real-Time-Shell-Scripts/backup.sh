#!/bin/bash 
SOURCE="/home/ubuntu/Source/"
DESTINATION="/home/ubuntu/Destination/"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
# Create backup directory and copy files 
mkdir -p $DESTINATION/$DATE |
cp -r $SOURCE $DESTINATION/$DATE
echo "Backup completed on $DATE" 
