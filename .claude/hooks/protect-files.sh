#!/usr/bin/env bash
# protect-files.sh — Block writes to protected directories
# Event: PreToolUse on Edit|Write
# Exit 0 = allow, Exit 2 = block

set -euo pipefail

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.path // empty' 2>/dev/null)

if [ -z "$FILE_PATH" ]; then
  exit 0
fi

PROTECTED_PATTERNS=(
  "book/published/"
  "research/raw/"
  ".env"
  "secrets.json"
  "credentials.json"
)

for pattern in "${PROTECTED_PATTERNS[@]}"; do
  if [[ "$FILE_PATH" == *"$pattern"* ]]; then
    echo "BLOCKED: $FILE_PATH is in a protected directory ($pattern)." >&2
    echo "Published files and raw research are read-only." >&2
    exit 2
  fi
done

exit 0
