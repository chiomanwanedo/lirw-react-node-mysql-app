#!/bin/bash
cd /home/ec2-user/backend

# Start the backend server using PM2 (or node if PM2 isn't preferred)
sudo npm install -g pm2  # Safe even if PM2 is already installed
pm2 delete server || true
pm2 start server.js --name server
