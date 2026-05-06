#!/bin/bash
# Hook: Verify cover letter before Claude saves it
# Runs on PreToolUse (Edit|Write) — blocks if checks fail
# Checks: company name present, no fabricated experience, word count

# Read the JSON that Claude Code sends on stdin
INPUT=$(cat)

# Extract the file path from the tool input
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Only run on cover letter files
if [[ "$FILE_PATH" != *"cover-letter"* ]]; then
  exit 0
fi

# Get the new content Claude is trying to write
# For Write tool, content is in .tool_input.content
# For Edit tool, content is in .tool_input.new_string
CONTENT=$(echo "$INPUT" | jq -r '.tool_input.content // .tool_input.new_string // empty')

if [ -z "$CONTENT" ]; then
  exit 0
fi

ERRORS=""

# Check 1: Company name is not a placeholder
if echo "$CONTENT" | grep -qi "your company\|the company\|\[company\]"; then
  ERRORS="$ERRORS- Cover letter uses a placeholder instead of the actual company name\n"
fi

# Check 2: Word count under 400
WORD_COUNT=$(echo "$CONTENT" | wc -w | tr -d ' ')
if [ "$WORD_COUNT" -gt 400 ]; then
  ERRORS="$ERRORS- Cover letter is $WORD_COUNT words (limit: 400)\n"
fi

# Check 3: No claims that aren't in the career profile
PROFILE=".claude/skills/career-profile.md"
if [ -f "$PROFILE" ]; then
  # Look for "at [Company]" patterns and check against career profile
  COMPANIES=$(echo "$CONTENT" | grep -oE "at [A-Z][a-zA-Z]+" | sed 's/at //' | sort -u)
  for COMPANY in $COMPANIES; do
    if ! grep -qi "$COMPANY" "$PROFILE"; then
      ERRORS="$ERRORS- Mentions '$COMPANY' but this company isn't in your career profile — possible fabrication\n"
    fi
  done
fi

if [ -n "$ERRORS" ]; then
  # Exit 2 = BLOCK the action. Exit 1 would NOT block (Claude Code convention).
  echo "COVER LETTER FAILED CHECKS:" >&2
  echo -e "$ERRORS" >&2
  exit 2
fi

exit 0
