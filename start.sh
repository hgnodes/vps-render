#!/bin/bash

echo "[INFO] 🚀 VPS Starting..."

hostname hemantgamerr
export PS1="root@hemantgamerr:~# "

# install required tools
echo "[INFO] Installing packages..."
apt update -y && apt install -y tmate curl

# =========================
# 🔐 TMATE SETUP (FIXED)
# =========================
echo "======================================"
echo "[TMATE] STARTING SESSION..."
echo "======================================"

tmate -S /tmp/tmate.sock new-session -d

# wait until ready
until tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}' &>/dev/null; do
  sleep 2
done

echo "[TMATE SSH]"
tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'

echo "[TMATE WEB]"
tmate -S /tmp/tmate.sock display -p '#{tmate_web}'

echo "======================================"

# =========================
# 🔁 SSHX LOOP (FIXED)
# =========================
(
while true; do
  echo "======================================"
  echo "[SSHX] NEW SESSION 🔐"
  echo "======================================"

  # foreground run so link PRINT ho
  curl -sSf https://sshx.io/get | sh -s run --name hemantgamerr

  echo "[INFO] SSHX ended → restarting in 5 sec..."
  sleep 5
done
) &

# =========================
# 🌐 RENDER PORT FIX
# =========================
PORT=10000
echo "[INFO] Starting web server on $PORT..."

python3 -m http.server $PORT
