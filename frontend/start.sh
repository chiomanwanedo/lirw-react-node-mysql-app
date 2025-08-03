#!/bin/bash
cd /home/ec2-user/frontend

# Fix ownership before building
sudo chown -R ec2-user:ec2-user .

# Build the frontend
npm run build

# Install serve globally (if needed)
if ! command -v serve &> /dev/null
then
    npm install -g serve
fi

# Kill anything on port 3000
fuser -k 3000/tcp || true

# Create log file with proper permissions
touch frontend.log
chmod 666 frontend.log

# Start the server
nohup serve -s dist -l 3000 > frontend.log 2>&1 &
