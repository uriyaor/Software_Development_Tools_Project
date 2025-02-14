#!/bin/bash

# Message about cloning the repository
echo "Now running the command: git clone"
git clone https://github.com/uriyaor/drupal-docker-backup.git

# Message about changing to the repository directory
echo "Now running the command: cd drupal-docker-backup"
cd drupal-docker-backup

# Message about making the script executable
echo "Now running the command: chmod +x setup.sh"
chmod +x setup.sh

# Message about running the setup script
echo "Now running the command: ./setup.sh"
./setup.sh

# Message about running the restore script
echo "Now running the command: ./restore.sh"
./restore.sh
