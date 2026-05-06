#!/bin/bash
# Hook: Remind about weak areas after quiz generation (PostToolUse)
# Non-blocking — injects context for Claude to consider

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

if [[ "$FILE_PATH" != *"quiz"* ]]; then
  exit 0
fi

STATE="study-system/study-state.md"

if [ ! -f "$STATE" ]; then
  exit 0
fi

# Extract weak areas from state file
WEAK_AREAS=$(sed -n '/## Weak Areas/,/## /p' "$STATE" | grep -v "^#" | grep -v "^$" | grep -v "Claude updates")

if [ -n "$WEAK_AREAS" ]; then
  echo "Current weak areas from study-state.md:"
  echo "$WEAK_AREAS"
  echo ""
  echo "Verify that at least 6 of 10 questions target these areas."
fi

exit 0
