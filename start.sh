#!/bin/bash

echo "[INFO] Starting VPS..."

echo "======================================"
echo "        SSHX REMOTE ACCESS 🔐"
echo "======================================"

# set hostname (ye important hai)
hostname hemantgamerr

# start sshx with custom name
curl -sSf https://sshx.io/get | sh -s run --name hemantgamerr &

sleep 6

echo "[INFO] SSHX session started!"
echo "[INFO] Your session name: root@hemantgamerr"

echo "======================================"

# keep alive
while true; do sleep 1000; done
