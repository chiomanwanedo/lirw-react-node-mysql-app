#!/bin/bash

cd /home/ec2-user/backend

echo "Installing backend dependencies..."
npm config set unsafe-perm true
npm install

# Seed DB only once
if [ ! -f .seeded ]; then
  echo "Running seed.sql..."
  mysql -h 172.31.21.179 -P 3306 -u lirw_user -pcadd1 lirw_app < seed.sql
  touch .seeded
else
  echo "Database already seeded. Skipping seed.sql"
fi
