# Cowork Best Practices — Compiled

**Compiled**: 2026-05-06
**Sources**: Anthropic docs, tested community guides

## The 4-Part Prompt Formula

The most effective Cowork instructions include all four parts:

1. **Context** — Who you are, what this project is, what business process this belongs to
2. **Input format** — The exact structure of data/files you're providing
3. **Output specification** — The exact format, fields, and structure you need back
4. **Exception handling** — What Claude should do with missing, inconsistent, or ambiguous data

[COMMUNITY — widely tested across multiple sources]

## Core Principles

### Describe outcomes, not steps [OFFICIAL + COMMUNITY]
- Wrong: "Open the folder, find the .pptx file, extract colors with python-pptx..."
- Right: "Build a presentation that matches the design of template.pptx in the same folder"
- Claude plans better when you tell it WHERE to go, not HOW to get there

### Test in Chat first [COMMUNITY]
- Write your instruction in regular Chat to refine it
- Use Chat to generate stronger versions of your Cowork instructions
- Once refined, deploy to Cowork for execution

### Let Claude read your files [COMMUNITY]
- Don't summarize your documents for Claude — let it read the originals
- You get better results because Claude works with actual content, not your interpretation
- Point Claude at existing docs, templates, previous work

### Be specific about format [COMMUNITY]
- "A Word document with an executive summary and table of top 5 expenses" > "a report"
- Name the deliverable, its format, its structure, its sections

### Include business context [COMMUNITY]
- Help Claude understand WHY, not just WHAT
- "This is for my quarterly review with the VP of Sales" changes tone and detail level

## Safety Best Practices

### Folder setup [OFFICIAL]
- Create a dedicated working folder for each project
- Don't grant access to your entire home directory
- Keep backups of important files before letting Claude modify them
- Always review output before distributing or using for decisions

### Permission defaults [OFFICIAL + COMMUNITY]
- Default to "do not delete anything" unless you specifically want deletions
- Grant the minimum permissions needed
- Review Claude's plan before approving

### Keep the app open [OFFICIAL]
- Claude Desktop must stay open during execution
- Don't close the laptop lid or put it to sleep during long tasks

## Global Instructions Setup [COMMUNITY — widely recommended]

Create three files for your Global Instructions:

1. **identity.md** — Who you are, your role, what you're working on
2. **voice.md** — How you write and think (critical for writing tasks)
3. **anti-ai.md** — Words, structures, and tones Claude should never use when writing as you

This setup produces larger quality improvements than any single prompt technique.

## Common Mistakes

1. **Describing steps instead of outcomes** — Most people over-explain HOW
2. **Summarizing files instead of pointing Claude at them** — Let Claude read the originals
3. **Using Cowork for quick questions** — Chat is better for that (and cheaper)
4. **Not reviewing output** — Claude makes things up sometimes. Always verify facts and numbers.
5. **Granting too-broad folder access** — Use dedicated project folders
6. **Not using Global Instructions** — Repeating context every session wastes time

## What Works Well with Cowork

- Routine administrative tasks (filing, organizing, categorizing)
- Document synthesis across multiple sources
- Data transformation and analysis
- Recurring workflows (monthly reports, expense reviews)
- Work that would otherwise get skipped because it's boring

## What Doesn't Work Well

- Tasks needing real-time interaction
- Complex spreadsheets with merged cells or non-standard layouts
- Regulated workloads requiring audit trails
- Tasks with sensitive credentials (isolate carefully)
- Quick one-off questions (use Chat instead)
