#!/bin/bash

echo "🔧 Running install.sh"

# Remove the old frontend directory if it exists
rm -rf /home/ec2-user/frontend

# Move the deployed code into place
mv /home/ec2-user/deployment-temp /home/ec2-user/frontend

# Navigate into the new frontend directory
cd /home/ec2-user/frontend

# Set proper ownership and permissions
sudo chown -R ec2-user:ec2-user .
sudo chmod -R u+rwX .

# Install dependencies
npm install

# Build the frontend
npm run build
