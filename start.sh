#!/bin/bash

echo "[INFO] Updating system..."
apt update -y && apt upgrade -y

echo "[INFO] Installing basic packages..."
apt install -y curl wget sudo git unzip tar neofetch

echo "[INFO] Installing tmate..."
apt install -y tmate

echo "[INFO] Starting tmate session..."
tmate -F &

sleep 10

echo "[INFO] Your SSH Session:"
tmate display -p '#{tmate_ssh}'

echo "[INFO] Your Web Session:"
tmate display -p '#{tmate_web}'

echo "[INFO] Installing Docker (for Wings)..."
apt install -y docker.io
systemctl start docker
systemctl enable docker

echo "[INFO] Installing NodeJS..."
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt install -y nodejs

echo "[INFO] Installing Pterodactyl dependencies..."
apt install -y software-properties-common ca-certificates apt-transport-https gnupg

echo "[INFO] Installing Nginx & PHP..."
apt install -y nginx php php-cli php-fpm php-mysql php-zip php-gd php-mbstring php-curl php-xml php-bcmath

echo "[INFO] Installing Composer..."
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

echo "[INFO] Setup Complete!"
neofetch

echo "[INFO] VPS Ready!"
