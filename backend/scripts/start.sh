#!/bin/bash

cd /home/ec2-user/backend || exit 1

echo "Installing PM2 globally..."
sudo npm install -g pm2

echo "Restarting backend with PM2..."

# Stop and delete old process if it exists
pm2 delete server || true

# Start the backend server using PM2
pm2 start server.js --name server

# Save PM2 process list (optional if using pm2 startup)
pm2 save

exit 0
