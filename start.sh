#!/bin/bash

echo "[INFO] Starting VPS Setup..."

echo "[INFO] Updating system..."
apt update -y

echo "[INFO] Installing basic packages..."
apt install -y curl wget sudo git unzip tar tmate docker.io

echo "[INFO] Starting Docker..."
service docker start || true

echo "[INFO] Starting tmate..."
tmate -F > /dev/null 2>&1 &

sleep 8

echo "========== TMATE LOGIN =========="
tmate display -p '#{tmate_ssh}'
tmate display -p '#{tmate_web}'
echo "================================="

echo "[INFO] Installing NodeJS..."
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt install -y nodejs

echo "[INFO] Installing Pterodactyl deps..."
apt install -y nginx php php-cli php-fpm php-mysql php-zip php-gd php-mbstring php-curl php-xml php-bcmath

echo "[INFO] Installing Composer..."
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

echo "[SUCCESS] VPS READY!"

# keep alive
while true; do sleep 1000; done
