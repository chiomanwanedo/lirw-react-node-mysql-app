#!/bin/bash

echo "🚀 Running start.sh"

cd /home/ec2-user/frontend

# Ensure proper ownership and permissions again
sudo chown -R ec2-user:ec2-user .
sudo chmod -R u+rwX .

# Create log file for output
touch frontend.log
chmod 666 frontend.log

# Start the frontend app
nohup npm start > frontend.log 2>&1 &
