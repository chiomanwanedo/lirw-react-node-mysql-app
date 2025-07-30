#!/bin/bash
cd /home/ec2-user/backend

# Optional but recommended: ensure proper file ownership
sudo chown -R ec2-user:ec2-user .

# Install PM2 globally (only the first time)
sudo npm install -g pm2

# Start the server
pm2 start server.js
