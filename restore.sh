#!/bin/bash

echo "🔹 Downloading backup file from GitHub..."
wget -O drupal_backup.sql.gz "https://raw.githubusercontent.com/uriyaor/Software_Development_Tools_Project/main/drupal_backup.sql.gz"

echo "🔹 Creating the Drupal database if it does not exist..."
docker exec mysql_container sh -c "exec mysqladmin -uroot -pmy-secret-pw create drupal"

echo "🔹 Restoring the database from the backup file..."
gunzip < drupal_backup.sql.gz | docker exec -i mysql_container sh -c "exec mysql -h 127.0.0.1 -uroot -pmy-secret-pw --force drupal"

echo "✅ Database restore completed successfully!"
