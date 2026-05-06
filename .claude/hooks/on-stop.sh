#!/usr/bin/env bash
# on-stop.sh — Remind to update book-state.md on session end
# Event: Stop
# Always exits 0

set -euo pipefail

BOOK_STATE="book/book-state.md"

# Check if any chapter drafts were modified recently (last 30 min)
RECENT_CHANGES=$(find book/chapters -name "draft.md" -mmin -30 2>/dev/null | wc -l | tr -d ' ')

if [ "$RECENT_CHANGES" -gt 0 ]; then
  STATE_RECENT=$(find "$BOOK_STATE" -mmin -30 2>/dev/null | wc -l | tr -d ' ')
  if [ "$STATE_RECENT" -eq 0 ]; then
    echo "REMINDER: $RECENT_CHANGES chapter draft(s) were modified this session."
    echo "Please update book/book-state.md before ending the session."
  fi
fi

exit 0
