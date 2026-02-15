#!/bin/bash

# =====================================================
# MongoDB 8.2 Installation Script (Ubuntu 24.04 Noble)
# =====================================================
# This script installs MongoDB, enables auto-start,
# and verifies the installation.
# =====================================================

set -e  # Exit immediately if a command fails

echo "🔐 Importing MongoDB GPG key..."
curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc \
  | sudo gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg --dearmor

echo "✅ GPG key added."

echo "📦 Adding MongoDB repository..."
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.2 multiverse" \
  | sudo tee /etc/apt/sources.list.d/mongodb-org-8.2.list > /dev/null

echo "✅ Repository added."

echo "🔄 Updating package index..."
sudo apt update

echo "⬇️ Installing MongoDB..."
sudo apt install -y mongodb-org

echo "✅ MongoDB installed."

echo "🚀 Enabling MongoDB to start at boot..."
sudo systemctl enable mongod

echo "✅ MongoDB enabled on startup."

echo "🔍 Verifying MongoDB installation..."
mongod --version

echo "🔎 Confirming service enable status..."
systemctl is-enabled mongod

echo ""
echo "🎉 MongoDB installation complete!"
echo "👉 To start MongoDB now, run:"
echo "   sudo systemctl start mongod"
echo ""
echo "👉 To check status:"
echo "   sudo systemctl status mongod"
