#!/bin/bash
# Hook: Check for duplicate applications (PostToolUse)
# Warns but does NOT block — exit 0 with context injection

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Only run on cover letter files
if [[ "$FILE_PATH" != *"cover-letter"* ]]; then
  exit 0
fi

STATE="job-hunting/job-state.md"

if [ ! -f "$STATE" ]; then
  exit 0
fi

# Get content from the tool result (PostToolUse has the result)
CONTENT=$(echo "$INPUT" | jq -r '.tool_use_result // empty')

# Try to find a company name in the file path or content
COMPANY=$(echo "$FILE_PATH" | grep -oE "[A-Z][a-z]+[A-Z][a-z]+" | head -1)

if [ -n "$COMPANY" ] && grep -qi "$COMPANY" "$STATE"; then
  # Print context for Claude to see (not blocking — just informing)
  echo "WARNING: You may have already applied to $COMPANY. Check job-state.md before submitting."
fi

exit 0
