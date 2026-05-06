# /dev-docs Command

**Purpose**: Create or review implementation plans for book production work
**Output**: `dev/active/[feature-name]/`

---

## Usage

```bash
# Create new dev-docs
/dev-docs "Act 2 Chapters 4-6"

# Review existing
/dev-docs review

# List active work
/dev-docs list
```

---

## What It Creates

**Location**: `dev/active/[feature-name]/`

```
dev/active/act2-part2-first-builds/
├── plan.md      # Architecture, approach, key decisions
├── context.md   # Session tracking, discoveries, blockers
└── tasks.md     # Checkbox progress by phase
```

---

## Plan Contents

1. **Goal** — What this work produces and why it matters
2. **Approach** — How we'll do it (key decisions, patterns to follow)
3. **Dependencies** — What must exist before this work starts
4. **Phase Breakdown** — Phases with deliverables
5. **Key Files** — What gets created or modified
6. **Quality Gate** — How we know it's done (scoring, review criteria)
7. **Risks** — What could go wrong

---

## Workflow

```bash
/dev-docs "feature"              # Create plan
# Do the work...
/dev-docs-update "feature"       # Track progress between sessions
/book-status                     # Check overall book progress
```

---

## Rules

- One dev-docs per major work unit (not per chapter — per production phase)
- Tasks use `[ ]` / `[x]` / `[~]` (pending / done / partial)
- Context.md is append-only for session history
- Update before session ends or context switches
