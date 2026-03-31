#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

echo "[INFO] Starting VPS Setup..."

echo "[INFO] Updating system..."
apt update -y

echo "[INFO] Fixing timezone (no prompt)..."
ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata

echo "[INFO] Installing packages..."
apt install -y curl wget sudo git unzip tar tmate

echo "[INFO] Starting tmate..."
tmate -F > /dev/null 2>&1 &

sleep 8

echo "========== TMATE LOGIN =========="
tmate display -p '#{tmate_ssh}'
tmate display -p '#{tmate_web}'
echo "================================="

echo "[SUCCESS] VPS READY!"

# fake web server for Render (IMPORTANT)
echo "[INFO] Starting dummy server on port 10000..."
while true; do
  echo -e "HTTP/1.1 200 OK\n\nVPS Running" | nc -l -p 10000 -q 1
done
