#!/bin/bash

# Set the current date
DATE=$(date +"%Y-%m-%d")

# Check if today is Friday
if [ $(date +%u) -eq 5 ]; then
  echo "Today is Friday, skipping backup"
  exit 0
fi

# Export the database to a file
mysqldump -u goutham -pgoutham sample > /home/goutham/2cloud/db_$DATE.sql

# Upload the file to S3
aws s3 cp /home/goutham/2cloud/db_$DATE.sql s3://myawsbuckethi/db_backups/db_$DATE.sql
