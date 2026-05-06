# Cowork Features — Compiled Research

**Compiled**: 2026-05-06
**Sources**: Anthropic official docs, community guides, product pages

## What Cowork Is

Claude Cowork is an autonomous AI agent in the Claude desktop app. Unlike Chat (conversational, back-and-forth), Cowork is agentic — you describe a desired outcome, Claude plans the steps, and executes the work on its own. You get back finished deliverables (spreadsheets, presentations, reports, organized folders), not text responses.

**Available on**: All paid Claude plans (Pro, Max, Team, Enterprise) via the Claude desktop app (macOS, Windows). [OFFICIAL]

## How It Works

1. You describe what you want done (in plain language)
2. Claude proposes a plan (breaking work into steps)
3. You review and approve the plan
4. Claude executes autonomously
5. Claude asks you only when it needs a decision or is finished
6. You get a finished deliverable

[OFFICIAL — from support.claude.com]

## Core Capabilities

- **File access**: Read, rename, sort, deduplicate, organize local files [OFFICIAL]
- **Document synthesis**: Combine sources into structured reports, briefings [OFFICIAL]
- **Data transformation**: Clean, transform, analyze datasets [OFFICIAL]
- **Spreadsheet work**: Create Excel files with formulas, conditional formatting, multiple tabs [COMMUNITY]
- **Presentation building**: Generate slide decks from notes or templates [COMMUNITY]
- **Data visualization**: Create charts from data [COMMUNITY]
- **Research synthesis**: Identify relevant info across multiple sources [OFFICIAL]
- **Sub-agent coordination**: Break complex work into parallel workstreams [OFFICIAL]
- **Extended execution**: No timeout for long-running tasks [OFFICIAL]

## Permissions Model

- Click "Work in a Folder" and select a specific local folder [OFFICIAL]
- Claude can only read/write within the selected folder boundary [OFFICIAL]
- Grant explicit permissions: read, edit, delete [OFFICIAL]
- Best practice: always say "do not delete anything" unless you want deletions [COMMUNITY]
- Create dedicated working folders rather than granting broad access [OFFICIAL]

## Global Instructions

- Found in Settings > Cowork > Global Instructions [OFFICIAL]
- Persistent notes Claude reads every session [OFFICIAL]
- Configure: preferred document format, role context, tone preferences [OFFICIAL]
- Community best practice: Create 3 files — identity, voice profile, anti-AI writing rules [COMMUNITY]
- This setup alone produces larger quality improvements than switching models [COMMUNITY]

## Scheduling

- Type `/schedule` in any Cowork session to set up recurring tasks [OFFICIAL]
- Tasks run on your defined cadence [OFFICIAL]

## Computer Use (Chrome Connector)

- Claude can control Chrome browser via connector [OFFICIAL]
- Slower than file-based work due to screenshot round-trips [COMMUNITY]
- Use for web-based tasks that can't be done via files alone [OFFICIAL]

## Chat vs Cowork Comparison

| Aspect | Chat | Cowork |
|--------|------|--------|
| Style | Conversational | Autonomous execution |
| Guidance | You direct each step | You set goal, Claude executes |
| File access | Upload individual items | Direct access to folders |
| Output | Text responses | Finished files (.xlsx, .pptx, .docx) |
| Execution time | Immediate | Extended, no timeout |
| Sub-tasks | Single path | Parallel coordination |
| Best for | Quick answers, brainstorming | Completed work, multi-step tasks |

## Limitations

- Desktop app must stay open during execution [OFFICIAL]
- Complex spreadsheets with merged cells cause parsing issues [COMMUNITY]
- No audit logs — unsuitable for regulated workloads [OFFICIAL]
- Higher token usage than Chat [OFFICIAL]
- Browser use is slow [COMMUNITY]

## Key Sources

- anthropic.com/product/claude-cowork
- support.claude.com/en/articles/13345190-get-started-with-claude-cowork
- support.claude.com/en/articles/13364135-use-claude-cowork-safely
- support.claude.com/en/articles/14128542-let-claude-use-your-computer-in-cowork
- anthropic.skilljar.com/introduction-to-claude-cowork
