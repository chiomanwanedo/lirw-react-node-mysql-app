#!/bin/bash
cd /home/ec2-user/backend
pm2 start index.js --name backend-app
