# Appendix F: Running This Book with Deep Agents CLI + DeepSeek

Everything in this book works without Claude Code. The concepts are universal. The file structures are nearly identical across tools. This appendix gives you a complete open-source path using Deep Agents CLI (built by LangChain, open source) and DeepSeek V4 Flash (fast, cheap, capable). You own the entire stack. No Anthropic account required.

---

## Setup

### Install Deep Agents CLI

```bash
uv tool install deepagents-cli
```

If you don't have `uv`, install it first: `curl -LsSf https://astral.sh/uv/install.sh | sh`

### Configure DeepSeek V4 Flash

Create `~/.deepagents/config.toml`:

```toml
[models]
default = "deepseek:deepseek-v4-flash"

[models.providers.deepseek]
models = ["deepseek-v4-flash", "deepseek-chat"]
base_url = "https://api.deepseek.com/v1"
api_key_env = "DEEPSEEK_API_KEY"
```

Add your API key to `~/.deepagents/.env`:

```
DEEPSEEK_API_KEY=sk-your-key-here
```

Get a DeepSeek API key at platform.deepseek.com. As of mid-2026, DeepSeek V4 Flash costs roughly $0.14 per million input tokens. That's 36x cheaper than Claude Opus. For the systems you build in this book, expect to spend pennies per session.

### Verify It Works

```bash
deepagents
```

Type: "What model are you running?" It should confirm DeepSeek V4 Flash. If it does, you're set.

---

## The Translation Table

Every concept in this book maps directly. Here's what changes:

| Book Component | Claude Code | Deep Agents CLI |
|---|---|---|
| **Project instructions** | `CLAUDE.md` | `AGENTS.md` |
| **Skills folder** | `.claude/skills/name/SKILL.md` | `.deepagents/skills/name/SKILL.md` |
| **Hooks folder** | `.claude/hooks/*.sh` | `~/.deepagents/hooks.json` |
| **Hook registration** | `.claude/settings.json` (PreToolUse) | `hooks.json` (lifecycle events) |
| **Commands (pipelines)** | `.claude/commands/name.md` | `.deepagents/skills/name/SKILL.md` |
| **Permissions** | `settings.json` allow list | `-y` flag or `Shift+Tab` toggle |
| **MCP connections** | `.claude/settings.json` mcpServers | `.mcp.json` at project root |
| **State files** | Manual markdown files | Manual markdown files (same) |
| **Subagents** | Agent tool in commands | `task` tool + subagent folders |
| **Config** | `.claude/settings.json` | `~/.deepagents/config.toml` |
| **Install tool** | `npm install -g @anthropic-ai/claude-code` | `uv tool install deepagents-cli` |
| **Launch** | `claude` | `deepagents` |
| **Load skill** | `/skill-name` | `/skill skill-name` |

**What stays identical:** State files, skill file content (markdown with YAML frontmatter), MCP server definitions (`.mcp.json`), and your project folder structure. The systems you build are the same. The wiring is slightly different.

---

## Chapter-by-Chapter Notes

### Chapter 4: Structured Prompts

Rename `CLAUDE.md` to `AGENTS.md`. Same format, same content. Deep Agents CLI reads `AGENTS.md` from the project root and loads it every session, exactly like Claude Code reads `CLAUDE.md`.

```bash
# Book says:
touch my-ai-systems/CLAUDE.md

# You do:
touch my-ai-systems/AGENTS.md
```

Everything you write inside the file is identical.

### Chapter 5: State Files

No changes. State files are plain markdown. Both tools read and write them the same way.

One bonus: Deep Agents CLI has automatic memory. It saves things it learns to `~/.deepagents/agent/memories/` without you asking. Your manual state files still work, and the auto-memory is an extra layer on top. If you prefer full control (recommended while learning), tell the agent in your `AGENTS.md`: "Use state files for session tracking. Do not rely on automatic memory for critical data."

### Chapter 6: Skills

Same folder structure, same SKILL.md format.

```bash
# Book says:
mkdir -p .claude/skills/editorial-voice

# You do:
mkdir -p .deepagents/skills/editorial-voice
```

The SKILL.md format is identical: YAML frontmatter (`name`, `description`) followed by markdown instructions.

```yaml
---
name: editorial-voice
description: "Voice and style guide for content writing. Use when drafting blog posts, articles, or any published content."
---

# Editorial Voice

[Same content as the book's example]
```

One difference: Deep Agents CLI only loads the YAML frontmatter at startup (not the full body). The full skill loads on demand when you invoke it. This is actually better for context management.

### Chapter 7: Hooks — The Biggest Difference

This is where the two tools diverge most.

**Claude Code** hooks fire per-tool: "Before Claude saves a file, run this script." You control WHICH files trigger the check and WHAT the check does.

**Deep Agents CLI** hooks fire per-lifecycle-event: "When a session starts" or "When a task completes." Less granular. You can't say "check this specific file before saving."

**The workaround:** Put your validation logic in the skill instructions instead of a hook script. In your `AGENTS.md` or a skill, add:

```markdown
## Validation Rules

Before saving any cover letter:
- Verify every company name and role title against the career-profile skill
- Check for placeholder text: "your company", "[company]", "Dear Hiring Manager"
- Verify word count is under 400 words
- If any check fails, report the failure and fix before saving
```

This isn't as bulletproof as a shell script (the AI might skip it), but with DeepSeek V4 Flash's instruction-following capability, it works for most cases. For critical checks, create a validation skill that runs as a separate step in your pipeline.

**What you CAN do with hooks.json:** Run scripts on session start (load environment, check prerequisites) and task complete (log results, update dashboards).

```json
{
  "hooks": [
    {
      "command": ["bash", "-c", "echo Session started at $(date) >> ~/.deepagents/session-log.txt"],
      "events": ["session.start"]
    }
  ]
}
```

### Chapter 8: Connections (MCP)

Nearly identical. Both tools use `.mcp.json` at the project root.

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "your-token"
      }
    }
  }
}
```

Web search works differently: Deep Agents CLI uses Tavily API for search (set `TAVILY_API_KEY` in your `.env`). Claude Code has built-in `WebSearch` and `WebFetch` tools.

For permissions, instead of adding `WebSearch` to `settings.json`, use:

```bash
deepagents -y  # Auto-approve all tool calls
# Or press Shift+Tab in the TUI to toggle auto-approve
```

### Chapter 9: Pipelines / Commands

Claude Code uses `.claude/commands/content-pipeline.md` triggered by `/content-pipeline`.

Deep Agents CLI doesn't have a separate commands folder. Instead, create a **skill** that contains the pipeline workflow:

```bash
mkdir -p .deepagents/skills/content-pipeline
```

Create `.deepagents/skills/content-pipeline/SKILL.md`:

```yaml
---
name: content-pipeline
description: "5-stage content production pipeline. Use when I say 'run the content pipeline' or '/content-pipeline'."
---

# Content Pipeline

[Same pipeline stages, exit criteria, and quality gates from the book]
```

Invoke it by typing `/skill content-pipeline` or just ask "run the content pipeline."

### Chapters 10-15

No tool-specific changes. The concepts (production systems, cost management, debugging, composition, design, what's next) are universal. The `.deepagents/` directory tree from Chapter 13 looks like this instead:

```
my-ai-systems/
├── AGENTS.md                          ← root shared rules
├── system-index.md                    ← cross-system visibility
├── .deepagents/
│   ├── skills/
│   │   ├── editorial-voice/SKILL.md
│   │   ├── content-standards/SKILL.md
│   │   ├── study-method/SKILL.md
│   │   ├── career-profile/SKILL.md
│   │   ├── pm-methodology/SKILL.md
│   │   ├── content-pipeline/SKILL.md  ← pipeline as skill
│   │   ├── study-deep/SKILL.md        ← pipeline as skill
│   │   ├── job-apply/SKILL.md         ← pipeline as skill
│   │   └── status-report/SKILL.md     ← pipeline as skill
│   └── hooks.json                     ← lifecycle hooks
├── .mcp.json                          ← MCP connections
├── study-system/
│   ├── AGENTS.md
│   └── study-state.md
├── job-hunting/
│   ├── AGENTS.md
│   └── job-state.md
├── project-mgmt/
│   ├── AGENTS.md
│   └── project-state.md
└── content/
    ├── AGENTS.md
    └── content-state.md
```

Same architecture. Same number of components. Different filenames.

---

## DeepSeek V4 Flash: What to Expect

**Where it excels:**
- Speed. Responses come fast, which matters when your pipeline has 5 stages.
- Cost. A full content pipeline run costs under $0.05. A study quiz costs fractions of a cent.
- Code generation and structured output. It follows skill instructions and formatting rules well.

**Where to watch out:**
- Complex reasoning tasks (supply chain analysis from Chapter 10) may produce shallower results than Claude Opus. Run those tasks twice and compare, or switch models for the reasoning stage.
- Nuanced writing (editorial voice matching) may drift more. Your editorial-voice skill becomes MORE important, not less. Be specific with examples.
- Fabrication. DeepSeek is no worse than other models at making things up, but it's no better either. Your validation layer (Chapter 7) matters regardless of which model you use.

**Switching models per task:**

```bash
# In the TUI, type:
/model deepseek:deepseek-chat    # Switch to the larger DeepSeek model
/model anthropic:claude-sonnet-4-6  # Switch to Claude for one task
/model deepseek:deepseek-v4-flash   # Switch back
```

The model ladder from Chapter 11 applies directly: use DeepSeek V4 Flash for most tasks, switch to a stronger model when quality demands it.

---

## What's Honestly Different

**Hooks are weaker.** Claude Code's per-tool hooks (check this file before saving) are more precise than Deep Agents' lifecycle hooks. You compensate with stronger validation instructions in your skills and AGENTS.md. This works, but it's not airtight. For high-stakes systems (cover letters, financial data), consider adding a dedicated validation step in your pipeline.

**Auto-memory is a mixed blessing.** Deep Agents saves memories automatically. This means less manual state management, but also less control over what gets remembered. For the systems in this book, keep your manual state files as the source of truth and treat auto-memory as a convenience layer.

**Community is smaller.** Claude Code has more examples, more community prompts, more Stack Overflow answers. Deep Agents is newer. The trade-off: you own the stack completely. No vendor dependency, no API changes breaking your workflow overnight.

**Model quality varies.** DeepSeek V4 Flash is remarkably capable for its cost, but it's not Claude Opus. For 90% of the tasks in this book, you won't notice the difference. For the other 10% (complex reasoning, nuanced writing, multi-step analysis), you'll want to either switch models or add extra quality gates.

---

## The Point

The systems in this book are built from files in folders. The AI model is a component, not the foundation. Swap the model, swap the CLI tool, the system still works. That's the difference between learning prompts (tied to a specific tool) and learning systems (portable across everything).

If you followed this appendix and built working systems with Deep Agents CLI and DeepSeek, you've just proved the book's thesis with a completely different stack.
