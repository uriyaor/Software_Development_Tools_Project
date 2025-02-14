#!/bin/bash

# Download the repository from GitHub
git clone https://github.com/uriyaor/drupal-docker-backup.git

# Change to the repository directory
cd drupal-docker-backup

# Make the script executable
chmod +x setup.sh
chmod +x restore.sh

# Run the setup script
./setup.sh

# Run the restore script (if needed)
./restore.sh
