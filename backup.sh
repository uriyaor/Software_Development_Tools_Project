#!/bin/bash
echo "🔹 Updating package lists..."
sudo apt update

echo "🔹 Installing MySQL client..."
sudo apt install -y MySQL-client-core-8.0

echo "🔹 Backing up all MySQL databases..."
docker exec mysql_container sh -c 'exec mysqldump --all-databases -uroot -pmy-secret-pw' | gzip > drupal_backup.sql.gz

echo "✅ Backup completed successfully! File saved as: drupal_backup.sql.gz"
