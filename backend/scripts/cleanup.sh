#!/bin/bash

echo "Cleaning backend folder but keeping seed.sql..."

# Delete all files in backend except seed.sql
find /home/ec2-user/backend -type f ! -name 'seed.sql' -delete

# Delete all subdirectories inside backend except backend itself
find /home/ec2-user/backend -mindepth 1 -type d -exec rm -rf {} +
