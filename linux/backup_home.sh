#!/bin/bash

# Define backup directory
BACKUP_DIR="/backups"

# Create timestamp for directory name
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_PATH="${BACKUP_DIR}/home_backup_${TIMESTAMP}"

# (1) Creates timestamped directory in /backups
sudo mkdir -p "$BACKUP_PATH"

# (2) Copies /home to it
sudo cp -rp /home/* "$BACKUP_PATH"

# (3) Compresses the backup
sudo tar -czvf "${BACKUP_PATH}.tar.gz" "$BACKUP_PATH"
sudo rm -rf "$BACKUP_PATH"

# (4) Verifies backup integrity (basic check)
echo "Verifying backup..."
sudo tar -tvf "${BACKUP_PATH}.tar.gz" | head -n 10
echo "First 10 files in the archive listed above. Further verification might be needed."
