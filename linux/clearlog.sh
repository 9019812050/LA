#!/bin/bash

# Define log directory and archive directory
LOG_DIR="/var/log"
ARCHIVE_DIR="/var/log/archives"

# Create archive directory if it doesn't exist
sudo mkdir -p "$ARCHIVE_DIR"

# (1) Lists all .log files in /var/log
echo "Listing .log files in $LOG_DIR:"
find "$LOG_DIR" -maxdepth 1 -name "*.log" -print0 | xargs -0 -n 1 echo

# (2) Archives them
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
ARCHIVE_NAME="${ARCHIVE_DIR}/logs_${TIMESTAMP}.tar.gz"
echo "Archiving .log files to $ARCHIVE_NAME..."
sudo tar -czvf "$ARCHIVE_NAME" $(find "$LOG_DIR" -maxdepth 1 -name "*.log" -print0)

# (3) Truncates original files
echo "Truncating original .log files in $LOG_DIR..."
sudo find "$LOG_DIR" -maxdepth 1 -name "*.log" -exec truncate -s 0 {} +

# (4) Confirms operation
echo "Listing .log files in $LOG_DIR after truncation:"
find "$LOG_DIR" -maxdepth 1 -name "*.log" -print0 | xargs -0 -n 1 echo
echo "Operation completed."
