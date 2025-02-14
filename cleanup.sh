#!/bin/bash

docker stop drupal_container mysql_container
docker rm drupal_container mysql_container
docker rmi drupal mysql

echo "✅ Cleanup completed successfully!"
