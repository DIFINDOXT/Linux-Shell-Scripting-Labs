#!/usr/bin/env bash
# check_port.sh - simple port check script
# Usage: ./check_port.sh <port>

set -euo pipefail

PORT="${1:-}"
if [[ -z "$PORT" ]]; then
  echo "Usage: $0 <port>"
  exit 1
fi

# Check with ss
if ss -tuln | grep -q ":$PORT "; then
  echo "[OK] Port $PORT is listening"
else
  echo "[FAIL] Port $PORT is not listening"
fi
