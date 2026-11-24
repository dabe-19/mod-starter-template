#!/usr/bin/env bash
# hooks/health.sh — Module healthcheck invoked by /app health starter-template
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
python3 "$SCRIPT_DIR/tools/cli.py" list <<< '{"limit":1}' >/dev/null
echo '{"status":"ok","module":"starter-template","runtime":"shared_locked"}'
