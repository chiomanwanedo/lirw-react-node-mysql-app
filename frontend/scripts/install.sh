#!/bin/bash
# Update and install nginx if not already installed
sudo yum update -y
sudo yum install -y nginx
sudo systemctl enable nginx
