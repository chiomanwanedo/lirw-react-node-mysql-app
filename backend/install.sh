#!/bin/bash
cd /home/ec2-user/backend

# Ensure the directory is writable by ec2-user
sudo chown -R ec2-user:ec2-user .

# Install node dependencies as ec2-user (no sudo needed)
npm install
