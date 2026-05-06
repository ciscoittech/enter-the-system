#!/bin/bash
# Hook: Verify quiz format (PreToolUse on Edit|Write)
# Checks: correct number of questions, answers marked

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Only run on quiz files
if [[ "$FILE_PATH" != *"quiz"* ]]; then
  exit 0
fi

CONTENT=$(echo "$INPUT" | jq -r '.tool_input.content // .tool_input.new_string // empty')

if [ -z "$CONTENT" ]; then
  exit 0
fi

ERRORS=""

# Check: Count questions
QUESTION_COUNT=$(echo "$CONTENT" | grep -cE "^[0-9]+[\.\)]")
if [ "$QUESTION_COUNT" -lt 10 ]; then
  ERRORS="$ERRORS- Quiz has $QUESTION_COUNT questions (expected 10)\n"
fi

# Check: Answer markers present
ANSWER_COUNT=$(echo "$CONTENT" | grep -ciE "correct answer|✓|✅|\*\*correct\*\*")
if [ "$ANSWER_COUNT" -lt "$QUESTION_COUNT" ]; then
  ERRORS="$ERRORS- Only $ANSWER_COUNT answers marked out of $QUESTION_COUNT questions\n"
fi

if [ -n "$ERRORS" ]; then
  echo "QUIZ FORMAT CHECKS FAILED:" >&2
  echo -e "$ERRORS" >&2
  exit 2
fi

exit 0
