#!/bin/bash

# (1) Creates /var/log/backups directory
sudo mkdir -p /var/log/backups

# (2) Compresses all .log files into backup_MMDD.tar.gz
DATE=$(date +%m%d)
ARCHIVE_NAME="/var/log/backups/backup_${DATE}.tar.gz"
sudo tar -czvf "$ARCHIVE_NAME" /var/log/*.log

# (3) Lists created archive
ls -lh "$ARCHIVE_NAME"
