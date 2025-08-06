#!/bin/bash

echo "Fully cleaning backend folder..."

BACKEND_DIR="/home/ec2-user/backend"

# Delete all files and folders (including seed.sql)
rm -rf "$BACKEND_DIR"/*
rm -rf "$BACKEND_DIR"/.* 2>/dev/null || true
