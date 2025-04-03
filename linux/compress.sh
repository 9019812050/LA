#!/bin/bash

# Create a tar archive of /var/log
echo "Creating tar archive of /var/log"
tar -cvf /tmp/var_log_backup.tar /var/log

# Compress the archive with gzip
echo "Compressing the tar archive"
gzip /tmp/var_log_backup.tar

# List the created archive
echo "Listing the created archive:"
ls /tmp/var_log_backup.tar.gz

