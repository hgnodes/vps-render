#!/bin/bash

echo "[INFO] Ultimate VPS Starting..."

hostname hemantgamerr
export PS1="root@hemantgamerr:~# "

echo "[INFO] Starting SSHX..."
curl -sSf https://sshx.io/get | sh -s run --name hemantgamerr &

sleep 8

echo "======================================"
echo "   SSH ACCESS READY 🔐"
echo "======================================"

# simple stable web server (NO ERROR)
python3 -m http.server 10000
