# /dev-docs-update Command

**Purpose**: Update dev docs before session compaction or context switches
**Preserves**: Context across session boundaries

---

## Usage

```bash
/dev-docs-update "feature-name"
```

---

## What Gets Updated

### context.md
- Session summary (date, what was done)
- Discoveries and decisions made
- Blockers found
- Next steps

### tasks.md
- Task completion status
- New tasks discovered during work

---

## When to Run

Run before:
- Session ends
- End of work day
- Major context switches
- Before asking for help

---

## Rules

- **Append** session entries — don't overwrite prior sessions
- **Update book-state.md** if chapter status changed
- **Flag blockers** that affect other work units
