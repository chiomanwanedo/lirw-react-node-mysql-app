#!/bin/bash

cd /home/ec2-user/backend || exit 1

echo "Fixing permissions..."
sudo chown -R ec2-user:ec2-user .

echo "Installing backend dependencies..."
npm install

# Database config
DB_USER="lirw_user"
DB_PASS="cadd1"
DB_NAME="lirw_app"
DB_HOST="172.31.21.179"

# Seed DB only once
if [ ! -f .seeded ]; then
  echo "Seeding the database..."
  if mysql -h "$DB_HOST" -P 3306 -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < seed.sql; then
    echo "Seeding successful. Marking as seeded."
    touch .seeded
  else
    echo "❌ Database seeding failed."
    exit 1
  fi
else
  echo "Database already seeded. Skipping."
fi

exit 0
