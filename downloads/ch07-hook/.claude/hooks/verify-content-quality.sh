#!/bin/bash
# Hook: Check content drafts for banned words and quality (PreToolUse)
# BLOCKS if banned words found or word count way off

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Only run on draft/post/blog files
if [[ "$FILE_PATH" != *"draft"* ]] && [[ "$FILE_PATH" != *"post"* ]] && [[ "$FILE_PATH" != *"blog"* ]]; then
  exit 0
fi

CONTENT=$(echo "$INPUT" | jq -r '.tool_input.content // .tool_input.new_string // empty')

if [ -z "$CONTENT" ]; then
  exit 0
fi

ERRORS=""

# Check 1: Banned words from editorial voice
BANNED="leverage|utilize|delve|ecosystem|game-changing|rapidly evolving|in today's"
FOUND=$(echo "$CONTENT" | grep -oiE "$BANNED" | sort -u | tr '\n' ', ' | sed 's/,$//')
if [ -n "$FOUND" ]; then
  ERRORS="$ERRORS- Banned words found: $FOUND\n"
fi

# Check 2: Word count (target: 800-1200 for blog posts)
WORD_COUNT=$(echo "$CONTENT" | wc -w | tr -d ' ')
if [ "$WORD_COUNT" -lt 600 ]; then
  ERRORS="$ERRORS- Draft is only $WORD_COUNT words (target: 800-1,200)\n"
elif [ "$WORD_COUNT" -gt 1500 ]; then
  ERRORS="$ERRORS- Draft is $WORD_COUNT words (target: 800-1,200)\n"
fi

# Check 3: Statistics without sources
STATS_COUNT=$(echo "$CONTENT" | grep -cE "[0-9]+%")
SOURCE_COUNT=$(echo "$CONTENT" | grep -ciE "source:|according to|\[VERIFY\]|based on my")
if [ "$STATS_COUNT" -gt 0 ] && [ "$SOURCE_COUNT" -eq 0 ]; then
  ERRORS="$ERRORS- Contains statistics but no sources or [VERIFY] flags\n"
fi

if [ -n "$ERRORS" ]; then
  echo "CONTENT QUALITY CHECKS FAILED:" >&2
  echo -e "$ERRORS" >&2
  exit 2
fi

exit 0
