#!/bin/bash

echo "🔹 Updating package lists..."
sudo apt update

echo "🔹 Installing Docker..."
sudo apt install -y docker.io

echo "🔹 Creating Docker network..."
docker network create drupal_network || echo "Network already exists."

echo "🔹 Starting MySQL container..."
docker run -d --name mysql_container --network drupal_network \
  -e MYSQL_ROOT_PASSWORD=my-secret-pw \
  -e MYSQL_DATABASE=drupal \
  -e MYSQL_USER=drupaluser \
  -e MYSQL_PASSWORD=drupalpass \
  -p 3306:3306 \
  mysql:latest || echo "MySQL container is already running."

echo "🔹 Waiting for MySQL to be ready..."
sleep 15

echo "🔹 Starting Drupal container..."
docker run -d --name drupal_container --network drupal_network \
  -p 8080:80 \
  -e DRUPAL_DATABASE_HOST=mysql_container \
  -e DRUPAL_DATABASE_NAME=drupal \
  -e DRUPAL_DATABASE_USER=drupaluser \
  -e DRUPAL_DATABASE_PASSWORD=drupalpass \
  drupal:latest || echo "Drupal container is already running."

echo "🔹 Waiting for Drupal to start..."
sleep 20

echo "🔹 Installing required packages inside Drupal container..."
docker exec drupal_container bash -c "apt update && apt install -y curl unzip git"

echo "🔹 Installing Composer inside Drupal container..."
docker exec drupal_container bash -c "curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer"

echo "🔹 Installing Drush inside Drupal container..."
docker exec drupal_container bash -c "composer require drush/drush"

echo "🔹 Running automatic Drupal installation..."
docker exec drupal_container bash -c "vendor/bin/drush site-install standard \
  --db-url=mysql://drupaluser:drupalpass@mysql_container/drupal \
  --site-name='Uriya_Guy_Sarit' \
  --account-name=demoadmin \
  --account-pass=secretpass\
  --account-mail=demoadmin@example.com \
  -y"

echo "🔹 Fixing file permissions..."
docker exec drupal_container chmod -R 777 /var/www/html/sites/default/files
docker exec drupal_container chmod 777 /var/www/html/sites/default/settings.php

echo "✅ Drupal has been successfully installed! Access it at: http://localhost:8080"
