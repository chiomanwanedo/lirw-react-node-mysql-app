#!/bin/bash
cd /home/ec2-user/backend

# Ensure PM2 is installed
sudo npm install -g pm2

# Stop existing PM2 process if it exists
pm2 delete server || true

# Start the server with PM2
pm2 start server.js --name server || true

# Always return success to CodeDeploy
exit 0
