#!/bin/bash

echo "Cleaning backend folder but keeping seed.sql..."

BACKEND_DIR="/home/ec2-user/backend"

# Delete all files except seed.sql
find "$BACKEND_DIR" -type f ! -name 'seed.sql' -delete

# Delete all subdirectories (like node_modules, scripts, etc.)
find "$BACKEND_DIR" -mindepth 1 -type d -exec rm -rf {} +
