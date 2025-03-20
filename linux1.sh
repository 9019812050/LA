#!/bin/bash

# Create the Backup directory inside Documents
mkdir -p ~/Documents/Backup

# Copy all .c files to the Backup directory
cp *.c ~/Documents/Backup/ 2>/dev/null

# Change to the Documents directory
cd ~/Documents || exit

# Create a compressed tar.gz file of the Backup folder
tar -czf Backup.tar.gz Backup

# Delete the Backup directory
rm -r ~/Documents/Backup

# Verify the contents of the archive
tar -tzf Backup.tar.gz


