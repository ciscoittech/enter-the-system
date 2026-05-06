# Ch 5 Research: State Files in Claude Code

Research compiled 2026-05-06 for "From Prompts to Pipelines" Ch 5 (State component).

---

## How It Actually Works

### The Two Built-In Memory Systems

Claude Code has two native memory mechanisms, both loaded at session start:

1. **CLAUDE.md files** -- Written by the user. Persistent instructions, project context, rules. Loaded in full at every session start. Multiple locations with cascading priority (managed policy > project > user > local).

2. **Auto memory (MEMORY.md)** -- Written by Claude itself. Learnings, patterns, debugging insights Claude decides are worth remembering. Stored at `~/.claude/projects/<project>/memory/MEMORY.md` plus optional topic files. Only the **first 200 lines or 25KB** (whichever comes first) of MEMORY.md loads at session start.

Neither of these is what our chapter teaches. Our chapter teaches **user-created state files** -- custom markdown files the reader creates, references in CLAUDE.md, and instructs Claude to read/update each session. This is a deliberate, structured pattern layered on top of the built-in systems.

### How Claude Reads Files

- **CLAUDE.md files** (and anything they `@import`) load automatically at session start. They consume tokens in the context window.
- **Other files** (including user-created state files) are read **on demand** -- Claude uses the `Read` tool when it needs them, or when instructed to in CLAUDE.md.
- The `Read` tool reads up to 2,000 lines by default, supports `offset` and `limit` parameters for large files.
- Files in subdirectories' CLAUDE.md files load lazily -- only when Claude reads files in that subdirectory.

### How Claude Writes/Edits Files

Claude has two file-modification tools:

1. **Edit tool** -- "Makes targeted edits to specific files." This does **exact string replacement**, not line-by-line rewriting. Claude finds a unique string in the file and replaces it with a new string. This is how Claude updates a specific row in a markdown table -- it matches the old row text and replaces it.

2. **Write tool** -- "Creates or overwrites files." This replaces the entire file content. Used for new files or complete rewrites.

Both require permission (the user approves unless auto-accept is enabled).

**Key implication for state files:** Claude CAN update a single row in a markdown table using the Edit tool's string replacement. It reads the file, finds the exact text of the row to change, and replaces it. It does NOT need to rewrite the whole file for a small update. However, if the table is malformed or has duplicate rows, the Edit tool may fail (it requires the match string to be unique in the file).

### The @import Mechanism

CLAUDE.md files can reference other files using `@path/to/file` syntax:

```markdown
# Project State
Current progress tracked in @book/book-state.md
```

- Both relative and absolute paths work. Relative paths resolve from the file containing the import.
- Imported files load into context at launch (they DO consume tokens).
- Recursive imports supported up to 5 levels deep.
- First time external imports are encountered, Claude shows an approval dialog.

**This is the primary mechanism for state files.** The reader puts `@path/to/state.md` in their CLAUDE.md, and that file's contents are injected into Claude's context every session.

### Context Window Basics

- Standard context: 200,000 tokens. Max/Team/Enterprise plans: 1,000,000 tokens.
- ~4 characters per token, so ~750 words per 1,000 tokens.
- CLAUDE.md + imported files + auto memory all consume context alongside the conversation.
- Official guidance: keep CLAUDE.md under 200 lines per file.
- When context fills up, older content gets deprioritized. Claude doesn't crash -- it just starts "forgetting" earlier material.
- `/compact` compresses conversation history but re-reads project-root CLAUDE.md from disk after compaction.

---

## What Works Well

### Best Format: Markdown Tables

Markdown tables are the strongest format for state tracking because:

1. **Claude handles them natively.** Recent Claude Code updates specifically fixed markdown table issues (pipe characters in cells, column alignment for GitHub/Notion/Slack compatibility).
2. **Edit tool works well with tables.** Each row is a unique string, so Claude can target a specific row for update via string replacement.
3. **Human-readable.** The reader can open the file in any text editor and understand it immediately.
4. **Structured enough for Claude to parse.** Columns create predictable fields Claude can reason about.

Example state file format that works well:

```markdown
# Study System State
Last updated: 2026-05-06

| Topic | Status | Sessions | Last Studied | Notes |
|-------|--------|----------|-------------|-------|
| Python Basics | Complete | 5 | 2026-04-28 | Solid understanding |
| Data Structures | In Progress | 3 | 2026-05-05 | Need more practice on trees |
| Algorithms | Not Started | 0 | - | Blocked on data structures |
```

### The @import Pattern (Recommended for Ch 5)

The cleanest pattern for non-technical readers:

1. Create a state file (e.g., `study-state.md`) in the project directory
2. Reference it in CLAUDE.md with `@study-state.md`
3. Add an instruction in CLAUDE.md: "Read study-state.md at session start. Update it when tasks are completed."

This way the state file loads automatically every session without the reader needing to remember to ask Claude to read it.

### The "Planning with Files" Pattern

A community skill (github.com/othmanadi/planning-with-files) implements a 3-file pattern:

- `task_plan.md` -- Phases and checkboxes for completion tracking
- `findings.md` -- Research and discoveries
- `progress.md` -- Session logs

Key insight: Uses hooks to auto-remind Claude to check and update files. The skill creates a `.planning/` directory with date-slug isolation for parallel plans.

### The Ian Paterson Memory Architecture

A well-documented community pattern using:

- MEMORY.md as a concise index (hard 200-line cap)
- Domain-specific topic files (bash.md, security.md, etc.)
- Date-stamped entries: `[YYYY-MM-DD] lesson learned`
- Weekly cron jobs for rotation and archival
- Append-only discipline for durability

Key finding: "Without rotation, lessons pile up until 60% of them are invisible" (due to the 200-line/25KB auto-memory cap).

### Session Recovery Pattern

The "planning-with-files" skill uses hooks for session recovery:
- PreToolUse hook: re-reads the plan before major decisions
- PostToolUse hook: reminds user to update status after file writes
- Stop hook: verifies completion before stopping

When `/clear` resets context, the system detects previous session data and generates a catchup report.

---

## What Breaks / Gotchas

### Size Limits and Performance Degradation

| Concern | Limit | What Happens |
|---------|-------|-------------|
| CLAUDE.md per file | ~200 lines recommended | Longer files reduce adherence -- Claude starts ignoring instructions |
| Auto memory (MEMORY.md) | 200 lines OR 25KB | Content beyond this threshold is NOT loaded at session start |
| @imported state files | Loaded in full | Consume tokens alongside conversation; large files eat context fast |
| Context window (standard) | 200K tokens (~150K words) | Performance degrades as it fills; older content deprioritized |
| Individual file read | 2,000 lines default | Can request more with offset/limit parameters |
| Files on disk | 500MB max | Not relevant for state files, but it's the hard ceiling |

**Critical for Ch 5:** A state file imported via `@` loads in full every session. If a state file grows to 100+ rows, it consumes meaningful context. At ~300-500 rows, it could noticeably degrade session performance. The reader needs to learn to keep state files lean.

### The Edit Tool Uniqueness Requirement

The Edit tool requires the `old_string` to be **unique** in the file. If two rows in a markdown table look identical (e.g., same status, same notes), the Edit tool will fail. Claude will either:
- Ask the user for clarification
- Fall back to the Write tool (rewriting the whole file)
- Add surrounding context to make the match unique

**Implication for readers:** Design state file rows to have at least one unique field (like a topic name or date). Don't create rows that are identical.

### Markdown Table Formatting Sensitivity

- **Pipe characters in cell content** break tables. Recent Claude Code updates fixed this, but older versions may still have issues.
- **Missing header separator** (the `|---|---|` row) makes the table unparseable as a table -- Claude may still understand it but can't reliably target rows.
- **Inconsistent column counts** (some rows have more/fewer pipes than the header) cause confusion.
- **Trailing whitespace** in cells is generally fine -- Claude handles this gracefully.
- A typo in table formatting (e.g., missing pipe) won't crash anything, but Claude may misinterpret the structure.

### If the Reader Forgets to Reference the State File in CLAUDE.md

- The file still exists on disk but **Claude won't read it automatically**.
- The reader would need to manually say "read study-state.md" each session.
- This is the most common mistake: creating a great state file but not wiring it into CLAUDE.md.
- Without the `@` reference, the file is invisible to Claude at session start.

### Compaction Behavior

- After `/compact`, Claude re-reads project-root CLAUDE.md (and its `@imports`) from disk. State files referenced via `@` survive compaction.
- State files referenced only in conversation (not `@imported`) may be lost after compaction.
- Nested CLAUDE.md files in subdirectories do NOT auto-reload after compaction -- they reload when Claude reads files in that subdirectory.

### File Encoding

- Claude Code works with UTF-8 by default.
- Standard line endings (LF on macOS/Linux, CRLF on Windows) are handled correctly.
- Emoji and special characters in state files work fine in cells.
- No known encoding issues for standard markdown content.

### What Auto-Memory Does vs. What State Files Do

This is a conceptual gotcha, not a technical one. Readers may confuse:

| Feature | Auto Memory | User State Files |
|---------|------------|-----------------|
| Who writes it | Claude | The user (via Claude) |
| What it tracks | Learnings, patterns, corrections | Structured progress data |
| Where it lives | `~/.claude/projects/<project>/memory/` | In the project directory |
| Version controlled | No (machine-local) | Yes (in the project repo) |
| Format | Claude's choice | User's design |
| Loaded how | First 200 lines auto-loaded | Via `@import` in CLAUDE.md |

**Ch 5 teaches state files, not auto memory.** The reader is deliberately designing what gets tracked and how. Auto memory is Claude's notebook; state files are the reader's dashboard.

---

## Community Patterns

### Pattern 1: The Flat Tracker

Single markdown file with one table. Simple, works for small projects.

```
project-state.md (referenced via @import in CLAUDE.md)
```

Pros: Dead simple. One file to maintain.
Cons: Grows unbounded. No topic separation.

### Pattern 2: The Index + Topic Files

MEMORY.md as index, separate files per domain. The Ian Paterson pattern.

```
memory/
  MEMORY.md (index, <200 lines)
  debugging.md
  api-conventions.md
  progress.md
```

Pros: Scales well. Topic files load on demand (not at startup).
Cons: More complex. Requires discipline to keep index updated.

### Pattern 3: The Planning Directory

Isolated planning directories per project/task. The planning-with-files pattern.

```
.planning/2026-05-06-study-system/
  task_plan.md
  findings.md
  progress.md
```

Pros: Clean isolation. Date-stamped for history. Hooks for automation.
Cons: Overhead for simple tasks. Requires hook setup.

### Pattern 4: The Session Log

Daily markdown files capturing what happened each session.

```
memory/auto-capture/
  2026-05-06.md
  2026-05-05.md
```

Pros: Natural chronological record. Easy to audit.
Cons: Doesn't aggregate status. Reader must synthesize across files. Race conditions with parallel sessions.

### Pattern 5: Hybrid (What Power Users Actually Do)

Most experienced users combine:
- A lean state file (`@imported`, <50 lines) for current status
- Auto memory for Claude's learnings
- Session resumption (`claude --continue`) for short-term continuity
- Periodic manual pruning

The community consensus from multiple sources: "None of these solutions are great. They're workarounds for a tool design limitation." But the flat tracker + `@import` pattern gets "80% of the continuity" with minimal effort.

### Anti-Patterns Identified by Community

1. **Orphaned files** -- State files that exist but aren't referenced anywhere. Claude never sees them.
2. **No date stamps** -- Without dates, you can't tell if data is current or stale.
3. **Duplicate facts** -- Same information in CLAUDE.md AND state file. They diverge over time.
4. **Unbounded growth** -- State file grows forever. Eventually dominates context window.
5. **Overly complex schemas** -- YAML or JSON state files that are hard for the reader to hand-edit.
6. **Skipping updates** -- One community test found notes were skipped 40% of the time after frustrating sessions. The discipline problem is real.

---

## Implications for the Chapter

### What We Must Teach

1. **The @import mechanism.** This is how state files become persistent -- reference them in CLAUDE.md with `@state-file.md`. Without this, the file is invisible at session start. This is the single most important thing in the chapter.

2. **Markdown tables as the default format.** They're human-readable, Claude-friendly, and the Edit tool handles them well. Don't teach JSON or YAML -- they're harder for non-technical readers and offer no advantage here.

3. **The uniqueness principle.** Every row needs at least one unique field so Claude can target it for updates. Teach this through the "break it on purpose" exercise.

4. **Size discipline from day one.** State files load every session. Teach a target: under 50 rows for a single-table state file. Show what happens when it gets too big (context fills up, Claude starts forgetting things).

5. **The update instruction in CLAUDE.md.** Not just `@state-file.md` but also an explicit instruction: "Update study-state.md when tasks are completed." Claude is more reliable about updating when explicitly told to.

6. **How the Edit tool works (conceptually).** Readers don't need to know the tool name, but they need to understand: Claude can change one row without rewriting the whole file. This makes state files practical.

### What We Must Warn About

1. **Forgetting the @import.** The #1 beginner mistake. The file exists but Claude doesn't see it. Include this in the "break it on purpose" exercise: remove the `@` reference, start a new session, watch Claude not know about previous progress.

2. **State file growing too large.** Give a concrete number (50 rows is comfortable, 100+ starts eating context). Teach the rotation pattern: archive completed items to a separate file.

3. **Compaction can lose conversation-only state.** If the reader mentions something in chat but doesn't put it in the state file, compaction may erase it. The state file IS the memory -- the conversation is ephemeral.

4. **Duplicate rows confuse the Edit tool.** If two items have identical content, Claude may update the wrong one or fail. Keep items distinguishable.

5. **Auto memory is separate.** Readers may think their state file IS auto memory. Clarify: auto memory is Claude's personal notes. State files are YOUR structured tracker.

### Chapter Exercise Design

The "break it on purpose" quality gate should include:

1. **Remove the @import** -- Start a session, confirm Claude doesn't know previous state. Re-add it, confirm it does. This teaches the wiring.

2. **Create duplicate rows** -- Two items with identical fields. Ask Claude to update one. Watch it struggle or update the wrong one. Fix by adding unique identifiers.

3. **Let the file grow** -- Add 20+ items to see context impact (or discuss it -- actually growing to degradation point would waste the reader's time/money).

### What NOT to Teach (Keep It Simple)

- **Don't teach hooks for state updates.** Hooks are Ch 8. State files work without them.
- **Don't teach auto memory configuration.** That's a different system. State files are manual and deliberate.
- **Don't teach YAML/JSON formats.** Markdown tables are sufficient and more accessible.
- **Don't teach session resumption as state.** `claude --continue` is useful but it's conversation continuity, not structured state.
- **Don't teach the MEMORY.md index pattern yet.** That's advanced. Ch 5 is one file, one table.

---

## Sources

- [How Claude remembers your project - Official Docs](https://code.claude.com/docs/en/memory) (2026-05-06)
- [How Claude Code works - Official Docs](https://code.claude.com/docs/en/how-claude-code-works) (2026-05-06)
- [Tools reference - Official Docs](https://code.claude.com/docs/en/tools-reference) (2026-05-06)
- [Best practices for Claude Code - Official Docs](https://code.claude.com/docs/en/best-practices) (2026-05-06)
- [Context window management - MindStudio](https://www.mindstudio.ai/blog/claude-code-context-window-limit-management) (2026-05-06)
- [Claude Code Memory Architecture - Ian Paterson](https://ianlpaterson.com/blog/claude-code-memory-architecture/) (2026-05-06)
- [3 Ways to Fix Claude Code Memory - DEV Community](https://dev.to/gonewx/i-tried-3-different-ways-to-fix-claude-codes-memory-problem-heres-what-actually-worked-30fk) (2026-05-06)
- [DIY Lightweight Memory Alternative - DEV Community](https://dev.to/kanta13jp1/adding-persistent-memory-to-claude-code-with-claude-mem-plus-a-diy-lightweight-alternative-4gha) (2026-05-06)
- [Planning with Files - GitHub](https://github.com/othmanadi/planning-with-files) (2026-05-06)
- [Claude Code Session Memory Mechanics - ClaudeFast](https://claudefa.st/blog/guide/mechanics/session-memory) (2026-05-06)
- [6 Memory Layers Explained - MindStudio](https://www.mindstudio.ai/blog/claude-code-memory-levels-explained-6-layers-claude-md-cross-tool-shared-memory) (2026-05-06)
- [Using CLAUDE.md Files - Claude Blog](https://claude.com/blog/using-claude-md-files) (2026-05-06)
