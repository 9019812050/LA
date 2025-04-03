#!/bin/bash

# (1) Create a 'backup' directory
mkdir backup

# (2) Copies all .txt files from the current directory to it
cp *.txt backup/

# (3) Lists contents of backup
ls backup/
