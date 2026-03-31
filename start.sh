#!/bin/bash

echo "[INFO] 🚀 Ultimate VPS Starting..."

# 🔥 custom identity
hostname hemantgamerr
export PS1="root@hemantgamerr:~# "

# 🔁 SSHX AUTO LOOP (30 MIN)
(
while true; do
  echo "======================================"
  echo "[SSHX] 🔐 NEW SESSION STARTED"
  echo "======================================"

  # start sshx
  curl -sSf https://sshx.io/get | sh -s run --name hemantgamerr &

  sleep 12

  echo "[INFO] ✅ SSHX READY (check link above)"

  # ⏳ run for 30 min
  for i in {1..6}; do
    echo "[KEEP-ALIVE] ⏱️ Running... ($i/6)"
    sleep 300   # 5 min x 6 = 30 min
  done

  echo "[INFO] 🔄 Restarting SSHX session..."

  pkill -f sshx || true
  sleep 3

done
) &

# 🌐 Render PORT (IMPORTANT)
PORT=10000

echo "[INFO] 🌐 Opening Web Server on $PORT..."

# 🔥 Stable server (uptime compatible)
python3 -m http.server $PORT
