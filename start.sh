#!/bin/bash

echo "[INFO] Starting VPS..."

# start tmate
tmate -S /tmp/tmate.sock new-session -d

echo "[INFO] Waiting for tmate..."
sleep 10

echo "========== TMATE LOGIN =========="

tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'
tmate -S /tmp/tmate.sock display -p '#{tmate_web}'

echo "================================="

# install python simple server (stable)
echo "[INFO] Starting web server..."

python3 -m http.server 10000
