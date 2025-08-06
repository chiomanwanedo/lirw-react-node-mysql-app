#!/bin/bash

cd /home/ec2-user/backend

echo "Fixing permissions..."
sudo chown -R ec2-user:ec2-user .

echo "Installing backend dependencies..."
npm config set unsafe-perm true
npm install

# Database config
DB_USER="lirw_user"
DB_PASS="cadd1"
DB_NAME="lirw_app"
DB_HOST="172.31.21.179"

# Seed DB only once
if [ ! -f /home/ec2-user/backend/.seeded ]; then
  echo "Seeding the database..."
  mysql -h $DB_HOST -P 3306 -u $DB_USER -p$DB_PASS $DB_NAME < db.sql
  touch /home/ec2-user/backend/.seeded
else
  echo "Database already seeded. Skipping."
fi
