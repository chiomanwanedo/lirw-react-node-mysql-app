#!/bin/bash

cd /home/ec2-user/backend

echo "Installing backend dependencies..."
npm config set unsafe-perm true
npm install

# Seed DB only once
if [ ! -f .seeded ]; then
  echo "Running seed.sql..."
  mysql -u YOUR_DB_USER -pYOUR_DB_PASSWORD YOUR_DB_NAME < seed.sql
  touch .seeded
else
  echo "Database already seeded. Skipping seed.sql"
fi
