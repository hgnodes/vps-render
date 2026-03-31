#!/bin/bash

echo "[INFO] Starting VPS Setup..."

apt update -y && apt upgrade -y

apt install -y curl wget sudo git unzip tar neofetch tmate docker.io

echo "[INFO] Starting Docker..."
systemctl start docker || service docker start

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

neofetch

echo "[SUCCESS] VPS READY!"

# keep alive
while true; do sleep 1000; done
