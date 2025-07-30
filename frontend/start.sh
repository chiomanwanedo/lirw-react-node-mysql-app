#!/bin/bash

cd /home/ec2-user/frontend

# Build the frontend
npm install
npm run build

# Install "serve" globally if not already installed
if ! command -v serve &> /dev/null
then
    npm install -g serve
fi

# Kill any process using port 3000 (optional but helpful in redeploys)
fuser -k 3000/tcp || true

# Start the app in the background
nohup serve -s dist -l 3000 > frontend.log 2>&1 &
