#!/bin/bash

echo "[INFO] Starting VPS..."

echo "======================================"
echo "        SSHX REMOTE ACCESS 🔐"
echo "======================================"

# install curl (just in case)
apt update -y
apt install -y curl

# run sshx
curl -sSf https://sshx.io/get | sh -s run &

sleep 5

echo "[INFO] SSHX session started!"
echo "[INFO] Check logs above for your SSH link"

echo "======================================"

# keep render alive (no URL needed)
while true; do sleep 1000; done
