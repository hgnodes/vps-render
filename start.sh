#!/bin/bash

echo "[INFO] Ultimate VPS Starting..."

# set hostname
hostname hemantgamerr

# custom prompt
export PS1="root@hemantgamerr:~# "

# start SSHX
echo "[INFO] Starting SSHX..."
curl -sSf https://sshx.io/get | sh -s run --name hemantgamerr &

sleep 8

echo "======================================"
echo "   SSH ACCESS READY 🔐"
echo "======================================"

# auto restart loop (ANTI-SLEEP 🔥)
while true; do
  echo "[KEEP-ALIVE] Running..."
  sleep 30
done &

# open port (VERY IMPORTANT)
echo "[INFO] Opening port 10000..."

while true; do
  echo -e "HTTP/1.1 200 OK\n\nVPS ALIVE" | nc -l -p 10000 -q 1
done
