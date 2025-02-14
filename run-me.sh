#!/bin/bash

# Notify the user that the process is starting
echo "Starting the process..."

# Install Docker if it's not already installed
echo "Now running the command: Installing Docker"
sudo apt-get update && sudo apt-get install docker.io -y >/dev/null 2>&1

# Create Docker network if it does not exist
echo "Now running the command: Creating Docker network"
docker network create drupal_network >/dev/null 2>&1

# Start MySQL container
echo "Now running the command: Starting MySQL container"
docker run --name mysql_container --network drupal_network -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=drupal -d mysql:latest >/dev/null 2>&1

# Wait for MySQL container to be ready
echo "Now running the command: Waiting for MySQL to be ready"
sleep 10  # Allow some time for MySQL to start

# Start Drupal container
echo "Now running the command: Starting Drupal container"
docker run --name drupal_container --network drupal_network -d -p 8080:80 drupal:latest >/dev/null 2>&1

# Wait for Drupal container to be ready
echo "Now running the command: Waiting for Drupal to start"
sleep 10  # Allow some time for Drupal to start

# Install Drupal requirements inside the container
echo "Now running the command: Installing Drupal dependencies inside the container"
docker exec -it drupal_container bash -c "apt-get update && apt-get install -y curl git unzip" >/dev/null 2>&1

# Run Drupal installation steps (install Composer and Drush)
echo "Now running the command: Running automatic Drupal installation"
docker exec -it drupal_container bash -c "curl -sS https://getcomposer.org/installer | php" >/dev/null 2>&1
docker exec -it drupal_container bash -c "mv composer.phar /usr/local/bin/composer" >/dev/null 2>&1

# Download backup file from GitHub
echo "Now running the command: Downloading backup file"
curl -L https://raw.githubusercontent.com/uriyaor/Software_Development_Tools_Project/main/drupal_backup.sql.gz -o /tmp/drupal_backup.sql.gz >/dev/null 2>&1

# Restore the database from the backup file
echo "Now running the command: Restoring the database"
docker cp /tmp/drupal_backup.sql.gz mysql_container:/tmp/drupal_backup.sql.gz >/dev/null 2>&1
docker exec -i mysql_container bash -c "gunzip < /tmp/drupal_backup.sql.gz | mysql -u root -proot drupal" >/dev/null 2>&1

# Notify the user that the process is complete
echo "Drupal installation and database restoration are complete! Access it at: http://localhost:8080"
