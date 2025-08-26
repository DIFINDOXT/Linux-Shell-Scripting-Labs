#!/usr/bin/env bash
# Purpose: List files older than X days with sizes, sorted largest-first.
# Usage:   ./older_than_days.sh <DIR> <DAYS>
# Example: ./older_than_days.sh ./sandbox/logs 30
# Notes:
#   - Uses find with -mtime (content older than DAYS)
#   - Uses -printf "%p\t%k KB\n" to print path + size
#   - Sorts by second column numerically, reverse (largest on top)

set -euo pipefail
#   -e → exit on error
#   -u → exit if undefined var is used
#   -o pipefail → fail if any command in pipeline fails

DIR="${1:-}"
DAYS="${2:-}"

if [[ -z "${DIR}" || -z "${DAYS}" ]]; then
  echo "Usage: $0 <DIR> <DAYS>" >&2
  exit 1
fi

if [[ ! -d "${DIR}" ]]; then
  echo "Error: DIR not found: ${DIR}" >&2
  exit 2
fi

echo "Files older than ${DAYS} days under: ${DIR}"

# -mtime +${DAYS} → files older than DAYS
# -printf "%p\t%k KB\n" → print file path and size (KB)
# sort -k2,2nr → sort by 2nd column, numeric, reverse order
find "$DIR" -type f -mtime +"${DAYS}" -printf "%p\t%k KB\n" | sort -k2,2nr
