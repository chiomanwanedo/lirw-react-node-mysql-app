#!/bin/bash

cd /home/ec2-user/backend

echo "Installing PM2..."
sudo npm install -g pm2

echo "Starting backend with PM2..."
pm2 delete server || true
pm2 start server.js --name server

exit 0
