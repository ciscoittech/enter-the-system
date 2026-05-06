#!/usr/bin/env bash
# jargon-check.sh — Warn on AI jargon in book drafts (non-blocking)
# Event: PreToolUse on Edit|Write
# Always exits 0 (warning only, never blocks)

set -euo pipefail

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.path // empty' 2>/dev/null)

# Only check book chapter drafts
if [[ "$FILE_PATH" != *"book/chapters/"* ]]; then
  exit 0
fi

CONTENT=$(echo "$INPUT" | jq -r '.tool_input.content // .tool_input.new_string // empty' 2>/dev/null)

if [ -z "$CONTENT" ]; then
  exit 0
fi

JARGON_TERMS=(
  "context window"
  "hallucinate"
  "hallucination"
  "neural network"
  "fine-tune"
  "fine-tuning"
  "inference"
  "embedding"
  "vector database"
  "RAG"
  "agentic"
  "large language model"
  "prompt engineering"
)

FOUND=()
for term in "${JARGON_TERMS[@]}"; do
  if echo "$CONTENT" | grep -qi "$term"; then
    FOUND+=("$term")
  fi
done

if [ ${#FOUND[@]} -gt 0 ]; then
  echo "JARGON WARNING: The following terms may need plain-language translation:" >&2
  for term in "${FOUND[@]}"; do
    echo "  - $term" >&2
  done
  echo "See .claude/skills/book-writer/references/anti-jargon.md for translations." >&2
fi

exit 0
