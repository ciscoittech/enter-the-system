# Ch 6 Research: Skills in Claude Code

Researched 2026-05-06. Based on official Anthropic documentation, community blog posts, GitHub issues, and the project's own skill files as working examples.

---

## How It Actually Works

A **skill** is a directory containing a `SKILL.md` file (required) plus optional supporting files (templates, scripts, examples). The `SKILL.md` has two parts: YAML frontmatter between `---` markers, and markdown instructions.

At session startup, Claude Code scans all skill directories and reads **only the name and description** from each skill (~100 tokens per skill). This is the "skill listing" that Claude sees at all times. The full skill body is **not loaded** until the skill is invoked -- either by the user typing `/skill-name` or by Claude deciding the skill matches the current task.

Once invoked, the full SKILL.md content enters the conversation as a single message and **stays in context for the rest of the session**. Claude Code does not re-read the file on later turns. After auto-compaction (when context fills up), Claude Code re-attaches the most recent invocation of each skill, keeping the first 5,000 tokens of each. Re-attached skills share a combined budget of 25,000 tokens, filled starting from most-recently-invoked. Older skills can be dropped entirely after compaction.

**Key distinction from CLAUDE.md**: CLAUDE.md content loads at session start and is always present. Skill content loads on-demand and costs nothing until invoked. This is why the docs say: "Create a skill when a section of CLAUDE.md has grown into a procedure rather than a fact."

Custom commands (`.claude/commands/`) have been **merged into skills**. A file at `.claude/commands/deploy.md` and a skill at `.claude/skills/deploy/SKILL.md` both create `/deploy`. Existing commands keep working. Skills add: supporting file directories, invocation control frontmatter, and automatic loading by Claude.

Skills follow the [Agent Skills](https://agentskills.io) open standard, which works across multiple AI tools (not just Claude Code).

---

## Skill File Format

### Directory structure

```
.claude/skills/my-skill/
  SKILL.md           # Required -- main instructions
  template.md        # Optional -- template for Claude to fill in
  examples/
    sample.md        # Optional -- example output
  scripts/
    validate.sh      # Optional -- script Claude can execute
```

The directory name becomes the `/slash-command` name (unless overridden by `name` in frontmatter).

### SKILL.md format

```yaml
---
name: my-skill
description: What this skill does and when to use it. Claude uses this to decide when to apply the skill automatically.
---

Your instructions here in markdown.
```

### All frontmatter fields

| Field | Required | What it does |
|-------|----------|-------------|
| `name` | No | Display name, becomes `/name`. Lowercase, numbers, hyphens only. Max 64 chars. Defaults to directory name. |
| `description` | Recommended | What the skill does and when to use it. Claude uses this for automatic matching. Truncated at 1,536 chars in the listing. |
| `when_to_use` | No | Additional trigger context. Appended to description, shares the 1,536-char cap. |
| `argument-hint` | No | Shown during autocomplete, e.g. `[issue-number]`. |
| `arguments` | No | Named positional arguments for `$name` substitution. Space-separated or YAML list. |
| `disable-model-invocation` | No | `true` = only user can invoke (prevents Claude auto-loading). Default: `false`. |
| `user-invocable` | No | `false` = hidden from `/` menu, only Claude can invoke. For background knowledge. Default: `true`. |
| `allowed-tools` | No | Tools Claude can use without asking permission when skill is active. Space-separated or YAML list. |
| `model` | No | Model override while skill is active. Reverts on next user prompt. |
| `effort` | No | Effort level override: `low`, `medium`, `high`, `xhigh`, `max`. |
| `context` | No | `fork` = run in isolated subagent context. |
| `agent` | No | Which subagent type when `context: fork` is set (e.g., `Explore`, `Plan`). |
| `hooks` | No | Hooks scoped to this skill's lifecycle. |
| `paths` | No | Glob patterns -- skill only auto-activates when working with matching files. |
| `shell` | No | `bash` (default) or `powershell` for `!command` blocks. |

### String substitutions available in skill content

- `$ARGUMENTS` -- all arguments passed when invoking
- `$ARGUMENTS[N]` or `$N` -- specific argument by position (0-based)
- `$name` -- named argument from `arguments` frontmatter list
- `${CLAUDE_SESSION_ID}` -- current session ID
- `${CLAUDE_EFFORT}` -- current effort level
- `${CLAUDE_SKILL_DIR}` -- directory containing this SKILL.md

---

## Loading Behavior

### Where skills live (priority order, highest first)

| Level | Path | Scope |
|-------|------|-------|
| Enterprise | Managed settings | All org users |
| Personal | `~/.claude/skills/<name>/SKILL.md` | All your projects |
| Project | `.claude/skills/<name>/SKILL.md` | This project only |
| Plugin | `<plugin>/skills/<name>/SKILL.md` | Where plugin enabled |

When skills share the same name: enterprise overrides personal, personal overrides project. Plugin skills use `plugin-name:skill-name` namespace so they cannot conflict.

### Discovery and automatic loading

1. **At startup**: Claude Code scans skill directories, reads name + description only. This populates the "skill listing" Claude always sees.
2. **During conversation**: When the user sends a message, Claude checks if any skill descriptions match. If one does, Claude loads the full SKILL.md content.
3. **Manual invocation**: User types `/skill-name` with optional arguments.
4. **Automatic invocation**: Claude decides to load a skill based on description matching the user's request.

### Live change detection

Adding, editing, or removing a skill takes effect **within the current session** without restarting. Exception: creating a **new top-level** `.claude/skills/` directory that didn't exist at session start requires a restart.

### Nested directory discovery (monorepo support)

When editing files in subdirectories, Claude Code also discovers skills from nested `.claude/skills/` directories. Example: editing in `packages/frontend/` also finds skills in `packages/frontend/.claude/skills/`.

### --add-dir exception

Skills in `.claude/skills/` within `--add-dir` directories are loaded automatically. This is a specific exception -- other `.claude/` configuration (subagents, commands, output styles) is NOT loaded from added directories.

### Stacking behavior

Multiple skills can be active simultaneously. Each invoked skill's content enters the conversation and persists. After compaction:
- Each skill keeps first 5,000 tokens
- Combined budget of 25,000 tokens for all re-attached skills
- Most-recently-invoked skills get priority
- Older skills may be dropped entirely

---

## What Works Well

### Skill size sweet spot

- **Official recommendation**: Keep SKILL.md under 500 lines. Move detailed reference to supporting files.
- **Community finding**: Complexity caps out around 500 lines. Beyond that, refactor into supporting files.
- **Description field**: Spend 70% of iteration time on the description. It determines whether the skill fires.

### Organization patterns that work

1. **One skill per domain/task** -- not one mega-skill. A `commit` skill, a `deploy` skill, a `review` skill -- not a `git-workflow` skill that tries to do all three.
2. **Reference skills** (background knowledge) vs **Task skills** (step-by-step actions). Reference skills run inline. Task skills often use `disable-model-invocation: true`.
3. **Supporting files for large reference material** -- keep SKILL.md as the overview/navigator, link to detail files.

### Description writing that triggers reliably

- **Directive language**: "Use when the user asks to..." or "ALWAYS invoke when..."
- **Include trigger phrases**: actual words the user would say
- **Be specific**: "Runs the project's pytest suite when the user asks to run, check, or verify tests" beats "Helps with tests"
- **Put key use case first** -- description is truncated at 1,536 chars

### Real example from this project

```yaml
---
name: book-writer
description: Voice rules, chapter structure, CLI-demonstrated approach, and scoring rubric for "From Prompts to Pipelines." Use when drafting chapters. Loaded by /draft command.
---
```

This works because: specific product name, clear trigger ("drafting chapters"), explicit command reference.

---

## What Breaks / Gotchas

### 1. Silent description budget overflow (most common problem)

All skill descriptions share a default budget of ~15,000 characters (~4,000 tokens). **Five to six verbose skills can exceed this.** When exceeded, descriptions are silently truncated -- Claude never sees them, skills never fire, and there is no warning.

**Fix**: Set `SLASH_COMMAND_TOOL_CHAR_BUDGET=30000` environment variable before launching. Or use `skillOverrides` in settings to set low-priority skills to `"name-only"`.

The budget scales dynamically at 1% of the context window, with a fallback of 8,000 characters.

### 2. YAML frontmatter formatting breaks

Multi-line descriptions using YAML block scalars (`>` or `|`) can break the skill loader, especially when auto-formatters like Prettier reflow the text.

**Fix**: Keep descriptions on a single line. Add `# prettier-ignore` if using Prettier.

### 3. Autonomous triggering is only ~50% reliable

Even with perfect descriptions, Claude autonomously triggering skills achieves roughly 50% success rate in real sessions. Claude prioritizes task completion over checking available tools.

**Fix for critical skills**: Use `UserPromptSubmit` hooks with explicit `"Use Skill(skill-name)"` instructions instead of relying on description matching alone. Or just tell users to invoke with `/skill-name` directly.

### 4. Malformed frontmatter fails silently

If the YAML between `---` markers has syntax errors (missing colon, bad indentation, unquoted special characters), the skill may not load. No error message is shown.

**Fix**: Test with `/skill-name` immediately after creating. Check `What skills are available?` to verify Claude sees it.

### 5. Context rot from large skill files

If skill files consume 20,000 tokens out of a 200,000-token context, that's 10% of capacity gone before any code is read. For complex multi-step tasks requiring large file reads, this creates real compression.

**Fix**: Keep SKILL.md concise (under 500 lines). Move reference material to supporting files that Claude reads only when needed.

### 6. Skills don't re-read on later turns

The rendered SKILL.md loads once and stays as-is. If the skill says "check the current branch" using dynamic injection, that value is frozen at invocation time -- it won't update on subsequent turns.

### 7. After compaction, skills may disappear

If you invoke many skills in one session, older ones may be dropped entirely after auto-compaction. The 25,000-token combined budget fills from most-recently-invoked first.

**Fix**: Re-invoke the skill after compaction to restore full content.

### 8. New top-level directory requires restart

Creating `.claude/skills/` for the first time (when it didn't exist at session start) requires restarting Claude Code. Edits within an existing directory are picked up live.

---

## Community Patterns

### Common organization approaches

1. **Personal skills in `~/.claude/skills/`** for cross-project tools (commit helpers, code review, debugging)
2. **Project skills in `.claude/skills/`** checked into version control for team-shared conventions
3. **Plugin skills** for distribution to other users

### Popular community skill categories

- **Code review and commit**: Structured review checklists, commit message formatting
- **Architecture and design**: API conventions, design patterns for a codebase
- **Documentation**: Auto-generate docs from code
- **Deployment**: Step-by-step deploy workflows with `disable-model-invocation: true`
- **Codebase visualization**: Generate interactive HTML views (official docs include a full example)

### Community repos worth noting

- `anthropics/skills` -- Anthropic's official public skills repository
- `travisvn/awesome-claude-skills` -- curated community collection
- `ComposioHQ/awesome-claude-skills` -- another curated list
- `glebis/claude-skills` -- collection of workflow-focused skills
- `shanraisshan/claude-code-best-practice` -- includes skill organization patterns

### Community wisdom

- "Spend 70% of SKILL.md iteration time on the description field"
- "Write three test cases before authoring the body"
- Properly optimized descriptions improve activation from 20% to 90% (with examples included)
- Directive language ("ALWAYS invoke when...") outperforms descriptive language ("Helps with...")
- The `!`command`` dynamic injection pattern is underused but powerful -- pre-loads live data before Claude sees the skill

---

## Implications for the Chapter

### What we must teach

1. **The mental model**: Skills are reusable knowledge documents that load on-demand. They are NOT always-on like CLAUDE.md. They load when relevant, cost nothing until invoked.
2. **The two-part format**: Frontmatter (when to use it) + Body (what to do). The frontmatter description is the most important line -- it determines whether the skill fires.
3. **Where to put them**: `.claude/skills/<name>/SKILL.md` -- directory name becomes the command name.
4. **The difference from CLAUDE.md**: CLAUDE.md = facts and preferences (always loaded). Skills = procedures and checklists (loaded when needed). The official guidance: "Create a skill when a section of CLAUDE.md has grown into a procedure rather than a fact."
5. **Supporting files**: Skills can include templates, examples, scripts. SKILL.md is the navigator; supporting files are the reference library.
6. **Testing**: Invoke with `/skill-name` immediately. Ask "What skills are available?" to verify Claude sees it.

### What to warn about

1. **Description quality matters enormously** -- vague descriptions = skills that never fire. This is the #1 beginner mistake.
2. **Silent failures** -- malformed YAML, budget overflow, and truncated descriptions all fail without error messages. The fix is always to test immediately.
3. **Don't make mega-skills** -- one skill per task/domain. Split large procedures into focused skills.
4. **Autonomous triggering is not 100% reliable** -- teach readers to use `/skill-name` for critical workflows, not rely on Claude deciding to load them.
5. **Size discipline** -- keep SKILL.md under 500 lines. Every line is a recurring token cost once loaded.

### What to skip or defer

- `context: fork` and subagent execution -- too advanced for Ch 6 (maybe Ch 11 pipelines)
- `allowed-tools` -- permission management is a separate concept
- `model` and `effort` overrides -- power-user features
- Plugin distribution -- not relevant for personal system building
- Dynamic context injection (`!`command``) -- powerful but requires shell comfort. Could be a brief "advanced" callout or saved for later chapter.

### Chapter build suggestion

The throughline system for Ch 6 should show the reader:
1. Taking a procedure they keep re-explaining to Claude (e.g., "review my study notes using spaced repetition principles") and turning it into a skill
2. Writing the frontmatter description so it actually triggers
3. Testing it fires correctly
4. Seeing the difference: without the skill, Claude gives generic advice. With it, Claude follows the reader's specific method every time.

The quality gate: "Remove the skill file, ask Claude the same question. Then restore it and ask again. The difference in response quality is your skill working."

---

## Sources

- [Extend Claude with skills -- Claude Code Docs](https://code.claude.com/docs/en/skills) (accessed 2026-05-06) -- primary official documentation, extremely comprehensive
- [Why Claude Code Skills Don't Trigger (And How to Fix Them in 2026) -- DEV Community](https://dev.to/lizechengnet/why-claude-code-skills-dont-trigger-and-how-to-fix-them-in-2026-o7h) (accessed 2026-05-06) -- budget overflow, YAML issues, triggering rates
- [Claude Code Skills Not Recognised? -- Scott Spence](https://scottspence.com/posts/claude-code-skills-not-recognised) (accessed 2026-05-06) -- troubleshooting recognition issues
- [Claude Code skills not triggering? -- fsck.com](https://blog.fsck.com/2025/12/17/claude-code-skills-not-triggering/) (accessed 2026-05-06) -- early report on triggering failures
- [How to Activate Claude Skills Automatically -- DEV Community](https://dev.to/oluwawunmiadesewa/claude-code-skills-not-triggering-2-fixes-for-100-activation-3b57) (accessed 2026-05-06) -- activation optimization
- [What Is Context Rot in Claude Code Skills? -- MindStudio](https://www.mindstudio.ai/blog/context-rot-claude-code-skills-bloated-files) (accessed 2026-05-06) -- skill file size and context impact
- [GitHub: anthropics/skills](https://github.com/anthropics/skills) -- Anthropic's official public skills repository
- [GitHub: travisvn/awesome-claude-skills](https://github.com/travisvn/awesome-claude-skills) -- curated community collection
- [GitHub: ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) -- community collection
- [GitHub: shanraisshan/claude-code-best-practice](https://github.com/shanraisshan/claude-code-best-practice) -- best practices including skill patterns
- [Claude Code Skills: A Practical Guide for 2026 -- DEV Community](https://dev.to/muhammad_moeed/claude-code-skills-a-practical-guide-for-2026-3f6p) (accessed 2026-05-06)
- [How to Make Claude Code Skills Actually Activate (650 Trials) -- Medium](https://medium.com/@ivan.seleznov1/why-claude-code-skills-dont-activate-and-how-to-fix-it-86f679409af1) (accessed 2026-05-06)
- This project's own `.claude/skills/` directory -- 5 working skill files as real-world examples
