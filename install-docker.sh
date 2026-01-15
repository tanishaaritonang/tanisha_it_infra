#!/bin/bash

set -e

echo "======================================"
echo " Docker Installation Script (Ubuntu)"
echo "======================================"

# Prevent running as root
if [ "$EUID" -eq 0 ]; then
  echo "❌ Please run this script as a NON-root user."
  echo "   The script will use sudo when required."
  exit 1
fi

echo "[1/6] Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "[2/6] Installing required dependencies..."
sudo apt install -y ca-certificates curl gnupg lsb-release

echo "[3/6] Adding Docker GPG key..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "[4/6] Adding Docker repository..."
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "[5/6] Installing Docker Engine and Docker Compose..."
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "[6/6] Starting and enabling Docker service..."
sudo systemctl start docker
sudo systemctl enable docker

echo "Adding current user to docker group..."
sudo usermod -aG docker $USER

echo "======================================"
echo "✅ Docker installation completed"
echo "ℹ️  Please LOG OUT and LOG IN again"
echo "   to apply docker group permissions."
echo "======================================"

