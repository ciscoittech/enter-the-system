#!/bin/bash
# Hook: Check PM status update matches audience format (PostToolUse)
# Non-blocking — warns if executive summary is too long

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

if [[ "$FILE_PATH" != *"status"* ]] && [[ "$FILE_PATH" != *"update"* ]]; then
  exit 0
fi

CONTENT=$(echo "$INPUT" | jq -r '.tool_use_result // empty')

if [ -z "$CONTENT" ]; then
  exit 0
fi

WORD_COUNT=$(echo "$CONTENT" | wc -w | tr -d ' ')

# If it looks like an executive summary, check brevity
if echo "$CONTENT" | grep -qi "executive\|summary\|boss"; then
  if [ "$WORD_COUNT" -gt 300 ]; then
    echo "WARNING: Executive summary is $WORD_COUNT words — should be under 300 (3-5 bullet points). Check pm-methodology skill."
  fi
fi

exit 0
