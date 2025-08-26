#!/usr/bin/env bash
# ^ "shebang" line → tells the system how to run this script.
#   /usr/bin/env bash = safer than /bin/bash
#   because it looks up "bash" in your PATH, no matter where it is installed.
#   (On some systems, bash may not live exactly at /bin/bash.)

set -euo pipefail
# ^ safety settings for bash scripts:
#   -e  → exit immediately if any command fails (no silent errors)
#   -u  → treat use of undefined (unset) variables as errors
#   -o pipefail → if a pipeline fails in the middle, the script exits as failed
#   (Without this, "cmd1 | cmd2" might look successful even if cmd1 failed.)

# -------- Input Arguments --------
DIR="${1:-}"
# ^ First argument given to the script = directory to search.
#   If not given, it defaults to "" (empty string).
#   "${1:-}" means → take $1 if provided, otherwise empty.
#   Example: ./find_topN.sh ./sandbox/logs 5
#   Here $1 = "./sandbox/logs" → stored in DIR

N="${2:-10}"
# ^ Second argument given to the script = how many files to show.
#   If not given, default = 10.
#   "${2:-10}" means → take $2 if provided, otherwise 10.

# -------- Input Validation --------
if [[ -z "${DIR}" || -z "${N}" ]]; then
  # -z STRING → true if STRING has length zero (empty).
  # So if DIR is empty OR N is empty, show usage and exit.
  echo "Usage: $0 <DIR> <N>" >&2
  exit 1
fi

if [[ ! -d "${DIR}" ]]; then
  # -d PATH → true if PATH exists and is a directory.
  # If DIR does not exist (not a directory), error out.
  echo "Error: DIR not found: ${DIR}" >&2
  exit 2
fi

# -------- Main Command --------
echo "Top ${N} largest files under: ${DIR}"

find "$DIR" -type f -exec du -h {} + | sort -rh | head -n "$N"
#   find "$DIR"        → look in this directory
#   -type f            → only files (ignore directories)
#   -exec du -h {} +   → for each file found, run "du -h" (disk usage, human-readable)
#                        {} = placeholder for the filename
#                        "+" means run du in batches (faster than one-by-one)
#   | sort -rh         → sort results by size, reverse order (largest first)
#   | head -n "$N"     → take the first N lines (default = 10, or as user passed)
