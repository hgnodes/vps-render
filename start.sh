#!/bin/bash

echo "[INFO] Starting VPS..."

tmate -F > /dev/null 2>&1 &

sleep 8

echo "========== TMATE LOGIN =========="
tmate display -p '#{tmate_ssh}'
tmate display -p '#{tmate_web}'
echo "================================="

# keep alive + port for render
while true; do
  echo -e "HTTP/1.1 200 OK\n\nVPS Running" | nc -l -p 10000 -q 1
done
