#!/usr/bin/env bash
# skill-suggester.sh — Suggest commands based on user prompt keywords
# Event: UserPromptSubmit
# Always exits 0

set -euo pipefail

PROMPT=$(cat | jq -r '.user_prompt // empty' 2>/dev/null)

if [ -z "$PROMPT" ]; then
  exit 0
fi

LOWER_PROMPT=$(echo "$PROMPT" | tr '[:upper:]' '[:lower:]')

SUGGESTIONS=()

if echo "$LOWER_PROMPT" | grep -qE "(draft|write|chapter)"; then
  SUGGESTIONS+=("/draft — Draft a chapter section")
fi

if echo "$LOWER_PROMPT" | grep -qE "(review|edit|voice|jargon|score)"; then
  SUGGESTIONS+=("/review — Review a draft for voice and quality")
fi

if echo "$LOWER_PROMPT" | grep -qE "(prompt|template|community|curate)"; then
  SUGGESTIONS+=("/curate-prompts — Find and catalog community prompts")
fi

if echo "$LOWER_PROMPT" | grep -qE "(research|docs|anthropic|cowork feature|capability)"; then
  SUGGESTIONS+=("/research-topic — Research a specific Cowork capability")
fi

if echo "$LOWER_PROMPT" | grep -qE "(status|progress|what.s next|overview)"; then
  SUGGESTIONS+=("/book-status — Overall book progress report")
  SUGGESTIONS+=("/chapter-next — What chapter to work on next")
fi

if echo "$LOWER_PROMPT" | grep -qE "(test|try this prompt|verify)"; then
  SUGGESTIONS+=("/prompt-test — Test a Cowork prompt and document results")
fi

if [ ${#SUGGESTIONS[@]} -gt 0 ]; then
  echo "Available commands that might help:"
  for suggestion in "${SUGGESTIONS[@]}"; do
    echo "  $suggestion"
  done
fi

exit 0
