#!/bin/bash
cd /home/ec2-user/frontend

# Fix folder ownership
sudo chown -R ec2-user:ec2-user .

# Install dependencies
npm install
