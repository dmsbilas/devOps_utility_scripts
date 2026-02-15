#!/bin/bash
echo "🔄 Updating package index..."
sudo apt update

echo "⬇️ Installing Node.js and npm..."
sudo apt install -y nodejs npm