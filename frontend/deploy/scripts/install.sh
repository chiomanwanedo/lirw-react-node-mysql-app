#!/bin/bash

cd /home/ec2-user/frontend || exit 1

echo "📦 Installing frontend dependencies..."
npm install

echo "⚙️ Building frontend..."
npm run build

echo "🧹 Cleaning up old frontend files in /var/www/html..."
sudo rm -rf /var/www/html/*

echo "🚀 Copying new build to /var/www/html..."
sudo cp -r dist/* /var/www/html/

echo "✅ Frontend deployment complete."
