#!/bin/bash

echo "[INFO] 🚀 Ultimate VPS Starting..."

# identity
hostname hemantgamerr
export PS1="root@hemantgamerr:~# "

# 📦 install tmate (IMPORTANT)
echo "[INFO] Installing tmate..."
apt update -y
apt install -y tmate

# 🔐 TMATE START (ONE TIME)
echo "======================================"
echo "[TMATE] 🔐 SESSION START"
echo "======================================"

tmate -S /tmp/tmate.sock new-session -d

sleep 10

echo "[TMATE SSH]"
tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'

echo "[TMATE WEB]"
tmate -S /tmp/tmate.sock display -p '#{tmate_web}'

echo "======================================"

# 🔁 SSHX AUTO LOOP (30 MIN)
(
while true; do
  echo "======================================"
  echo "[SSHX] 🔐 NEW SESSION STARTED"
  echo "======================================"

  curl -sSf https://sshx.io/get | sh -s run --name hemantgamerr &

  sleep 15

  echo "[INFO] ✅ SSHX READY (check link above)"

  # 30 min run
  for i in {1..6}; do
    echo "[KEEP-ALIVE] ⏱️ Running... ($i/6)"
    sleep 300
  done

  echo "[INFO] 🔄 Restarting SSHX..."

  pkill -f sshx || true
  sleep 3

done
) &

# 🌐 Render PORT (IMPORTANT)
PORT=10000

echo "[INFO] 🌐 Opening Web Server on $PORT..."

python3 -m http.server $PORT
