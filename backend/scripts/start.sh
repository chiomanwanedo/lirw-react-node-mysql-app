#!/bin/bash
cd /home/ec2-user/backend
pm2 delete server || true
pm2 start server.js --name server || true
exit 0
