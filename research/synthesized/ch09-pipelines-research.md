# Ch 9 Research: Pipelines and Commands in Claude Code

Research compiled 2026-05-06 from official Anthropic documentation (code.claude.com/docs/en/skills, /commands, /sub-agents, /headless, /hooks, /agent-teams, /common-workflows, /best-practices, /cli-usage), community patterns, and this project's own `.claude/` directory as a working example.

---

## How It Actually Works

There is **no built-in "pipeline" primitive** in Claude Code. You don't declare a pipeline in a config file and have Claude execute it. Instead, pipelines are **emergent** -- you build them by combining skills, commands, hooks, state files, and subagents. This is actually the core teaching point for Chapter 9: a pipeline is a *pattern* you compose from components you already have.

The reader already knows (from prior chapters): prompts, state files, skills, hooks, and connections. A pipeline is what happens when you wire those together into a multi-stage sequence with entry/exit criteria and quality gates between stages.

### The building blocks for pipelines

| Building block | Role in a pipeline | Chapter where reader learned it |
|----------------|-------------------|-------------------------------|
| **Skill** (SKILL.md) | Defines what each stage does -- its instructions, tools, and constraints | Ch 6 |
| **State file** | Tracks which stage the pipeline is in, what happened at each stage, pass/fail | Ch 5 |
| **Hook** | Quality gate between stages -- blocks progression if output fails checks | Ch 7 |
| **Subagent** | Runs a stage in isolated context (keeps verbose work out of main conversation) | New in Ch 9 |
| **Command/slash command** | The trigger that kicks off the pipeline (`/draft`, `/review`, etc.) | Ch 6 (skills section) |
| **Connection (MCP)** | Pulls live data into a stage (e.g., research stage queries web search) | Ch 8 |

### How Claude handles "run stage 1, check result, then run stage 2"

Claude Code does not have a declarative pipeline runner. Instead, there are three patterns people use:

1. **Single skill with multi-step instructions**: One SKILL.md that says "Do step 1, then check X, then do step 2..." Claude follows the steps in order as natural language instructions. Simplest, but everything runs in one context window.

2. **Human-in-the-loop chain**: User runs `/research`, reviews output, then runs `/draft`, reviews, then runs `/review`. Each command is a separate skill. State file tracks progress. This is what this book's production pipeline uses.

3. **Orchestrator skill**: One skill that invokes subagents for each stage, checks results between stages, and decides whether to proceed or loop back. Most complex, most automated.

---

## Command File Format

### The merger: Commands = Skills

Custom commands (`.claude/commands/`) have been **merged into skills**. Both create `/slash-command` entries. The docs say:

> "A file at `.claude/commands/deploy.md` and a skill at `.claude/skills/deploy/SKILL.md` both create `/deploy` and work the same way. Your existing `.claude/commands/` files keep working."

Skills are the recommended path going forward because they support:
- Supporting file directories (templates, scripts, examples)
- Invocation control frontmatter (`disable-model-invocation`, `user-invocable`)
- Automatic loading by Claude when relevant (based on `description`)
- `context: fork` for running in a subagent
- Dynamic context injection (`` !`command` ``)

### Simplest working command file

A command file is just a markdown file in `.claude/commands/`:

```
.claude/commands/hello.md
```

Content:
```markdown
Say hello to the user and tell them what day it is.
```

That's it. The reader types `/hello` and Claude follows those instructions.

### Simplest working skill file

```
.claude/skills/hello/SKILL.md
```

```yaml
---
description: Greet the user with the current date
---

Say hello to the user and tell them what day it is.
```

Same behavior, but now Claude can also invoke it automatically when it thinks the skill is relevant (based on the description).

### Real example from this project

The `/draft` command in this book's repo (`.claude/commands/draft.md`) is a 9-step pipeline instruction:

1. Load the `book-writer` skill for voice rules
2. Check dependencies via `structure-architect`
3. Read research files
4. Read curated prompts
5. Draft following a specific template
6. Self-score against rubric
7. Write to specific file path
8. Extract prompts to separate files
9. Update state file

This is a **single-command pipeline** -- all stages run in one conversation, but each stage has clear entry/exit criteria documented in the command file.

---

## Slash Command Mechanics

### How commands are discovered

Claude Code scans these directories at session start:

| Location | Scope | Priority |
|----------|-------|----------|
| Enterprise managed settings | Organization-wide | Highest |
| `~/.claude/skills/<name>/SKILL.md` | Personal (all projects) | High |
| `.claude/skills/<name>/SKILL.md` | Project-specific | Medium |
| `.claude/commands/<name>.md` | Project-specific (legacy) | Lower |
| Plugin `skills/` directory | Where plugin is enabled | Lowest |

If a skill and a command share the same name, the skill takes precedence.

### How they're invoked

- **User types `/name`**: Claude receives the skill's full SKILL.md content as a message
- **User types `/name some arguments`**: `$ARGUMENTS` in the skill content is replaced with "some arguments"
- **Claude auto-invokes**: If `disable-model-invocation` is not `true`, Claude can load the skill when it decides the task matches the skill's description
- **Programmatic**: In `-p` mode, describe the task; Claude may auto-invoke matching skills (unless `--bare` is used, which skips skill discovery)

### Arguments

Skills accept arguments through several mechanisms:

- `$ARGUMENTS` -- all arguments as a single string
- `$ARGUMENTS[0]`, `$ARGUMENTS[1]` or `$0`, `$1` -- positional arguments (0-based)
- Named arguments via `arguments` frontmatter: `arguments: [issue, branch]` then `$issue` and `$branch` in the content
- Shell-style quoting: `/my-skill "hello world" second` makes `$0` = "hello world", `$1` = "second"

If the skill content doesn't include `$ARGUMENTS`, Claude Code appends `ARGUMENTS: <value>` to the end.

### Can a command reference other files?

Yes, multiple ways:

1. **Supporting files in the skill directory**: SKILL.md can reference `[reference.md](reference.md)` and Claude will read it when needed
2. **Dynamic context injection**: `` !`git diff HEAD` `` runs a command and injects output before Claude sees the skill
3. **@ references**: Skill content can mention `@path/to/file` to load file contents
4. **Natural language references**: "Read the state file at `book/book-state.md`" -- Claude follows the instruction
5. **Script execution**: Skills can bundle scripts in their directory and reference them via `${CLAUDE_SKILL_DIR}/scripts/validate.sh`

---

## Multi-Stage Patterns

### Pattern 1: Sequential Skills (Human-in-the-Loop)

The simplest pipeline. Each stage is a separate skill. The reader runs them in order. State file tracks progress.

```
/research topic        → writes research/synthesized/topic.md
/draft topic           → reads research, writes chapters/topic-draft.md
/review topic          → reads draft, scores it, writes review notes
```

**How the reader connects stages**: State file. Each skill reads the state file to know what's been done and writes to it when done. The reader checks state to know what's next.

**Quality gate**: The `/review` skill checks the draft score. If < 20/30, it flags what needs fixing. The reader decides whether to re-run `/draft` or fix manually.

**Pros**: Simple, reader stays in control, easy to debug
**Cons**: Manual, reader must remember the sequence

### Pattern 2: Single Orchestrator Skill

One skill file contains all stages as numbered instructions:

```yaml
---
name: content-pipeline
description: Run the full content production pipeline
disable-model-invocation: true
---

Run the content production pipeline for: $ARGUMENTS

## Stage 1: RESEARCH
- Search for sources on the topic using web search
- Write findings to state/research-notes.md
- GATE: Must have at least 3 credible sources. If not, stop and report.

## Stage 2: OUTLINE
- Read research notes
- Generate outline following the editorial voice skill
- Write to state/outline.md
- GATE: Outline must have 5-8 sections. Each section has a clear thesis.

## Stage 3: DRAFT
- Read outline and research
- Draft the full piece
- Write to state/draft.md
- GATE: Draft must be 800-1500 words. Check for unsourced claims.

## Stage 4: REVIEW
- Read draft against the quality rubric
- Score on 6 dimensions
- If score < 20/30, revise and re-score (max 2 revision loops)
- Write final to output/

## Stage 5: POLISH
- Final formatting for target platform
- Update state file with completion log
```

**How stages connect**: Claude follows the numbered instructions sequentially. Each stage's output (written to a file) becomes the next stage's input (Claude reads it).

**Quality gates**: Written as natural language conditions ("Must have at least 3 credible sources. If not, stop and report."). Claude evaluates them. This is advisory, not deterministic -- Claude may not always catch failures.

**For deterministic gates**: Combine with hooks. A `PostToolUse` hook on `Write` can run a validation script that checks the output file and returns exit code 2 to block if it fails.

**Pros**: Fully automated once kicked off, clear documentation of the full pipeline
**Cons**: Entire pipeline runs in one context window (can fill up), quality gates are advisory unless backed by hooks

### Pattern 3: Subagent Pipeline

Each stage runs in an isolated subagent context. The main conversation orchestrates.

```yaml
---
name: research-stage
description: Research stage of content pipeline
context: fork
agent: Explore
---

Research $ARGUMENTS thoroughly:
1. Find at least 5 sources using web search and file reading
2. Evaluate source credibility
3. Write structured research notes to research-notes.md
4. Include source URLs for every claim
```

The orchestrator skill invokes subagents in sequence:
```
"Use the research-stage subagent for [topic]" → results return
Check results: enough sources? → if yes, continue
"Use the outline-stage subagent with these research notes" → results return
Check results: good outline? → if yes, continue
...
```

**Pros**: Each stage gets clean context, main conversation stays lean, can use different models per stage (Haiku for research, Opus for drafting)
**Cons**: More complex to set up, subagents can't spawn other subagents, orchestration logic is in the main conversation

### Pattern 4: Bash Script Pipeline (Non-Interactive)

For fully automated pipelines, chain `claude -p` calls in a shell script:

```bash
#!/bin/bash
# content-pipeline.sh

TOPIC="$1"

# Stage 1: Research
claude -p "Research '$TOPIC'. Find 5+ sources. Write findings to research-notes.md" \
  --allowedTools "Read,Write,Bash(curl *)" \
  --output-format json > /tmp/stage1.json

# Check gate
if ! grep -q '"result"' /tmp/stage1.json; then
  echo "Stage 1 failed" && exit 1
fi

# Stage 2: Outline (continue conversation)
SESSION=$(jq -r '.session_id' /tmp/stage1.json)
claude -p "Read research-notes.md. Create outline. Write to outline.md" \
  --resume "$SESSION" \
  --allowedTools "Read,Write" \
  --output-format json > /tmp/stage2.json

# Stage 3: Draft
claude -p "Read outline.md and research-notes.md. Draft the full piece to draft.md" \
  --resume "$SESSION" \
  --allowedTools "Read,Write" \
  --output-format json > /tmp/stage3.json

# Stage 4: Review (fresh context for unbiased review)
claude -p "Review draft.md against this rubric: [rubric]. Score it. If < 20/30, list issues." \
  --allowedTools "Read" \
  --output-format json > /tmp/stage4.json

echo "Pipeline complete. Review: $(jq -r '.result' /tmp/stage4.json)"
```

**Key detail**: `--resume "$SESSION"` continues the same conversation (preserving context from prior stages). Starting a new `claude -p` without `--resume` gives a fresh context (useful for unbiased review).

**Pros**: Fully scriptable, can add real programmatic gates (bash conditionals), integrates with CI/CD
**Cons**: Requires comfort with command line, no interactive feedback during execution

---

## Subagent Behavior

### What subagents are

Subagents are specialized AI assistants that run in their **own context window** with their own system prompt, tool access, and permissions. When Claude encounters a task matching a subagent's description, it delegates -- the subagent works independently and returns only the summary.

### Built-in subagents

| Agent | Model | Purpose |
|-------|-------|---------|
| **Explore** | Haiku (fast) | Read-only codebase search and analysis |
| **Plan** | Inherits | Research for plan mode |
| **general-purpose** | Inherits | Complex multi-step tasks requiring both read and write |

### Key behaviors for pipeline design

1. **Subagents cannot spawn other subagents.** This means you can't build a recursive pipeline where stage 1's subagent kicks off stage 2's subagent. The main conversation must orchestrate.

2. **Subagents run in their own context window.** This is the key pipeline benefit -- a research stage that reads 50 files fills the subagent's context, not yours. Only the summary comes back.

3. **Claude decides foreground vs background.** You can also ask explicitly ("run this in the background") or press Ctrl+B. Background subagents pre-approve permissions at launch.

4. **Parallel execution is possible.** "Research the authentication, database, and API modules in parallel using separate subagents" -- Claude spawns multiple subagents that work simultaneously.

5. **Chaining is explicit.** "Use the code-reviewer subagent to find issues, then use the optimizer subagent to fix them" -- Claude runs them in sequence, passing context between.

6. **Custom subagents live in `.claude/agents/`**. Each is a markdown file with YAML frontmatter (name, description, tools, model) and a system prompt body.

7. **Skills can run as subagents** via `context: fork` in the skill frontmatter. This means a pipeline stage defined as a skill can be isolated into its own context.

8. **Skills can be preloaded into subagents** via the `skills` frontmatter field. A subagent can load domain knowledge skills at startup.

### Agent Teams (experimental, for advanced readers)

Agent teams coordinate **multiple independent Claude Code sessions** -- each with its own context window, communicating via shared task lists and messaging. This is the most powerful (and most expensive) pattern for parallel pipeline stages.

Key differences from subagents:
- Subagents report only to the main agent
- Agent team members can message each other directly
- Agent teams use significantly more tokens
- Require `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1`

Not recommended for the book's target audience due to complexity and cost, but worth mentioning as "what's possible" for advanced readers.

---

## What Works Well

### Skills as pipeline stage definitions

Skills are the natural unit for pipeline stages because:
- Each stage is a separate skill directory with its own instructions
- Supporting files (templates, examples, rubrics) live alongside the skill
- `$ARGUMENTS` passes data between stages
- `context: fork` isolates heavy stages
- `disable-model-invocation: true` prevents Claude from running stages out of order

### State files as pipeline memory

State files (from Ch 5) track:
- Which stage the current item is in
- What happened at each stage (timestamps, scores, issues)
- What needs attention (items failing quality gates)
- Historical performance (which stages fail most often)

### Hooks as deterministic quality gates

Hooks (from Ch 7) enforce quality gates that Claude can't skip:
- `PostToolUse` on `Write|Edit` runs validation after Claude writes a stage output
- `Stop` hook runs final checks before Claude considers the pipeline done
- Exit code 2 blocks progression -- Claude gets the error message and must address it
- Unlike natural language instructions ("check that the draft has sources"), hooks always fire

### Dynamic context injection for live data

The `` !`command` `` syntax in skills runs commands before Claude sees the content:
```yaml
## Current state
!`cat pipeline-state.json`

## Latest research
!`cat research/latest-notes.md`
```

This pre-loads the current pipeline state into every stage invocation without Claude needing to manually read files.

---

## What Breaks / Gotchas

### Context window exhaustion

**The #1 pipeline failure.** A multi-stage pipeline in a single conversation fills the context window. Claude's performance degrades as context fills. Symptoms: Claude "forgets" earlier stage results, makes mistakes in later stages, ignores quality criteria.

**Mitigation**: Use `context: fork` for heavy stages, `/compact` between stages, or the bash script pattern with `--resume` for critical context and fresh sessions for independent stages.

### Advisory quality gates vs. deterministic gates

Natural language quality gates ("check that the draft has at least 800 words") are **advisory**. Claude usually follows them, but not always. For gates that must always fire, use hooks with validation scripts and exit code 2.

**Teaching implication**: The book should show both -- natural language gates for "nice to have" checks, hooks for "must not pass" checks. The reader learns when to use which.

### Subagent limitations

- Subagents cannot spawn other subagents (no recursive pipelines)
- Subagents don't inherit the parent's conversation history (must pass context explicitly)
- Subagent results returning to the main conversation consume context
- Running many subagents whose results all return can fill the main context

### Skill content stays in context

Once invoked, a skill's content stays in the conversation for the rest of the session. If you invoke 5 pipeline-stage skills, all 5 are in context simultaneously. After auto-compaction, only 25,000 tokens of re-attached skill content survive (first 5,000 tokens each, most-recent-first).

**Mitigation**: Keep stage skills concise. Use supporting files for reference material (Claude reads them on demand, they don't stay in context).

### Pipeline resumability is manual

There's no built-in "resume pipeline from stage 3" mechanism. The reader must:
1. Check the state file to see which stage was last completed
2. Manually invoke the next stage's skill
3. Or the orchestrator skill must read state and skip completed stages

**Teaching implication**: Emphasize that the state file IS the resumability mechanism. If the state file is well-maintained, resuming is just "read state, continue from where we left off."

### Exit code 1 vs 2 confusion

In hooks, exit code 1 is **non-blocking** (error, but continues). Exit code 2 is **blocking** (stops the action). This is counterintuitive -- most people expect exit 1 to be the blocking error. Must be taught explicitly.

### `/batch` -- the built-in parallel pipeline

Claude Code includes a bundled `/batch` skill that decomposes work into 5-30 independent units, spawns one background agent per unit in isolated git worktrees, and each opens a PR. This is essentially a built-in fan-out pipeline for code migrations. Worth mentioning as "Claude Code already uses pipelines internally."

---

## Community Patterns

### The "Writer/Reviewer" pattern

Run one Claude session to write, another to review. The reviewer has fresh context and isn't biased toward code it just wrote. From the official best practices:

> "A fresh context improves code review since Claude won't be biased toward code it just wrote."

This is a two-stage pipeline where the quality gate is literally a second AI with clean context.

### The "Interview then Execute" pattern

From official best practices: have Claude interview you first to build a spec, then start a fresh session to execute it. The interview fills context with exploration; the fresh session has clean context focused on implementation.

### Fan-out across files

From official docs: generate a task list, then loop through it calling `claude -p` for each file. This is a pipeline with a "decompose" stage followed by parallel "execute" stages:

```bash
for file in $(cat files.txt); do
  claude -p "Migrate $file from React to Vue" \
    --allowedTools "Edit,Bash(git commit *)"
done
```

### The "Explore → Plan → Implement → Commit" workflow

From official best practices. Four phases, each in a different mode:
1. Plan mode: explore and understand
2. Plan mode: create detailed plan
3. Default mode: implement
4. Default mode: commit

This is a pipeline where the "mode switch" acts as a gate (you can't write code in plan mode).

### Production pipeline in this book's repo

This project's own `.claude/commands/draft.md` is a working 9-step pipeline:
1. Load writer skill (voice rules)
2. Check dependencies (structural gate)
3. Read research (data stage)
4. Read curated prompts (data stage)
5. Draft following template (generation stage)
6. Self-score against rubric (quality gate)
7. Write to file (output stage)
8. Extract prompts (secondary output)
9. Update state file (state tracking)

This is exactly the kind of pipeline the book teaches -- and the reader can see it working in their own book project files.

---

## Implications for Chapter 9

### What the reader already has

By Chapter 9, the reader has built all four systems (Study, Job Hunting, Project Management, Content) with prompts, state files, skills, hooks, and connections. They've experienced each component individually. They know:
- Skills give Claude focused instructions for one task
- State files remember what happened between sessions
- Hooks enforce rules Claude can't skip
- Connections pull in live data

### What Chapter 9 teaches

**The key insight**: A pipeline is not a new component. It's the *pattern* of connecting components you already have into a sequence where each stage's output feeds the next, with quality gates between stages.

### Recommended teaching sequence

1. **Show the failure**: Reader gives Claude "write me a blog post about X." Single prompt produces mediocre output across all stages (research, outline, draft, edit).

2. **Decompose into stages**: What if each stage got its own focused attention? Map the Content System pipeline: Research → Outline → Draft → Review → Polish.

3. **Entry/exit criteria**: Each stage knows what it needs (entry) and what "done" looks like (exit). Write these down -- they become the stage skill instructions.

4. **Wire stages together**: State file tracks stage progress. Each skill reads state to know where the pipeline is. Each skill writes state when done.

5. **Add quality gates**: Between Draft and Review, add a hook that checks word count and source presence. Exit code 2 blocks if the draft is too short or has unsourced claims.

6. **Run it**: `/content-pipeline "remote work trends"` -- the orchestrator skill runs all stages in sequence.

7. **Break it on purpose**: Give it a topic with contradictory sources. Does the Review stage catch the contradiction? If not, tighten the quality gate.

8. **Show resumability**: Stop the pipeline mid-run. Check state file. Resume by running the next stage's skill manually. State file IS the resume mechanism.

9. **Extend to other systems**: Show how the same pipeline pattern applies to Study (Research → Synthesize → Generate Practice → Test → Analyze), Job Hunting (Search → Match → Tailor → Apply → Track), and Project Management (Plan → Assign → Track → Report → Review).

### What NOT to teach in this chapter

- Agent teams (too complex, too expensive, experimental)
- Bash script pipelines with `claude -p` (readers are non-technical)
- The Agent SDK (developer tooling, wrong audience)
- Building custom subagents from scratch (the subagent concept should be introduced only as "run a heavy stage in isolation" via `context: fork` in a skill)

### Key terminology translations for the audience

- "Pipeline" → "a conveyor belt where each station does one job and checks its work before passing to the next station"
- "Quality gate" → "a checkpoint that won't let bad work through"
- "Entry criteria" → "what a stage needs before it can start"
- "Exit criteria" → "what 'done' looks like for this stage"
- "Stage" → "one focused step in the pipeline"
- "Orchestrator" → "the skill that runs the whole sequence"
- "Subagent" → "a helper that does one stage's work in a separate workspace"
- "Resumability" → "the pipeline can pick up where it left off instead of starting over"
- "Bottleneck" → "the slowest or most failure-prone stage -- the one worth fixing first"

---

## Sources

### Official Anthropic Documentation
- code.claude.com/docs/en/skills -- Skills documentation (comprehensive, primary source for commands/skills)
- code.claude.com/docs/en/commands -- Built-in commands reference
- code.claude.com/docs/en/sub-agents -- Subagent documentation (comprehensive)
- code.claude.com/docs/en/headless -- Non-interactive/SDK mode for scripted pipelines
- code.claude.com/docs/en/hooks -- Hook lifecycle events, exit codes, quality gate patterns
- code.claude.com/docs/en/hooks-guide -- Hook configuration guide
- code.claude.com/docs/en/agent-teams -- Agent teams (experimental, multi-session coordination)
- code.claude.com/docs/en/common-workflows -- Workflow recipes and patterns
- code.claude.com/docs/en/best-practices -- Best practices including Writer/Reviewer, fan-out, plan-first
- code.claude.com/docs/en/cli-usage -- CLI flags and options reference

### Project Files (Working Examples)
- `.claude/commands/draft.md` -- 9-step pipeline in a single command file
- `.claude/commands/review.md` -- Review stage command
- `.claude/commands/research-topic.md` -- Research stage command
- `.claude/skills/book-writer/` -- Writer skill loaded by the draft pipeline
- `.claude/skills/book-editor/` -- Editor skill loaded by the review pipeline
- `.claude/skills/structure-architect/` -- Dependency checker used as a pipeline gate
- `book/book-state.md` -- State file tracking pipeline progress across chapters

### Prior Research in This Project
- `research/synthesized/ch06-skills-research.md` -- Skill mechanics, file format, lifecycle
- `research/synthesized/ch07-hooks-research.md` -- Hook mechanics, exit codes, settings format
- `research/synthesized/ch05-state-files-research.md` -- State file patterns
- `.claude/research/cowork-features.md` -- Cowork feature overview (desktop app, not CLI)
