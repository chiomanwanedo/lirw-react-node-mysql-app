#!/bin/bash

cd /home/ec2-user/backend

# Ensure the correct ownership
sudo chown -R ec2-user:ec2-user .

# Install PM2 globally (safe to run multiple times)
sudo npm install -g pm2

# Stop any existing backend instance (optional, helpful during redeploys)
pm2 delete server || true

# Start the server using PM2
pm2 start server.js --name server
