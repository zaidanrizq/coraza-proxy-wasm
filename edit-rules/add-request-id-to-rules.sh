#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RULES_DIR="$SCRIPT_DIR/../wasmplugin/rules/crs"
BACKUP_DIR="$SCRIPT_DIR/backup_original_confs"

# Create backup dir inside change-rules/ (script dir)
mkdir -p "$BACKUP_DIR"

if [ ! -d "$RULES_DIR" ]; then
  echo "Error: Directory $RULES_DIR does not exist."
  exit 1
fi

# Copy original .conf files to backup folder before editing
cp "$RULES_DIR"/*.conf "$BACKUP_DIR/"

# Now edit files in place WITHOUT backup to avoid .bak files in original dir
sed -i -E "s/(logdata:'[^']*)'/\1 with X-Request-ID: %{tx.request_id}'/" "$RULES_DIR"/*.conf
sed -i -f script.sed "$RULES_DIR"/REQUEST-949-BLOCKING-EVALUATION.conf

echo "Update complete. Original .conf files backed up in $BACKUP_DIR"
