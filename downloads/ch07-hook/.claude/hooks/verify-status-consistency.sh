#!/bin/bash
# Hook: Check PM status updates for consistency (PostToolUse)
# Non-blocking — warns about overdue tasks

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Only run on status/update files
if [[ "$FILE_PATH" != *"status"* ]] && [[ "$FILE_PATH" != *"update"* ]]; then
  exit 0
fi

STATE="project-mgmt/project-state.md"

if [ ! -f "$STATE" ]; then
  exit 0
fi

# Check for overdue tasks
TODAY=$(date +%Y-%m-%d)
OVERDUE=""

while IFS='|' read -r _ task _ status _ due_date _; do
  due_date=$(echo "$due_date" | tr -d ' ')
  status=$(echo "$status" | tr -d ' ')
  if [[ "$due_date" =~ ^[0-9]{4} ]] && [[ "$due_date" < "$TODAY" ]] && [[ "$status" != "done" ]] && [[ "$status" != "blocked" ]]; then
    task=$(echo "$task" | xargs)
    OVERDUE="$OVERDUE- OVERDUE: '$task' was due $due_date (status: $status)\n"
  fi
done < <(grep "|" "$STATE" | grep -v "^|[-—]" | grep -v "^| Task")

if [ -n "$OVERDUE" ]; then
  echo "STATUS CONSISTENCY WARNINGS:"
  echo -e "$OVERDUE"
fi

exit 0
