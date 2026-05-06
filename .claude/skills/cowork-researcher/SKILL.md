---
name: cowork-researcher
description: Research Cowork features, capabilities, and best practices from Anthropic docs and community sources. Use when investigating a specific capability. Loaded by /research-topic command.
---

# Cowork Researcher Skill

## Purpose

Research specific Cowork capabilities from official Anthropic documentation and community sources. Produce synthesized notes that the writer can use to draft chapters.

## Research Protocol

### Source Priority
1. **Anthropic official docs** (support.claude.com, anthropic.com) — always check first
2. **Anthropic training** (anthropic.skilljar.com) — structured learning materials
3. **Community guides with tested examples** (GitHub repos, DataCamp, Jeff Su, Chris Bailey)
4. **Community prompt collections** (ClaudeCowork.com, Awesome Cowork)
5. **Blog posts and reviews** — lowest priority, verify claims

### Research Steps

1. **Define the question** — What specific capability or feature are we researching?
2. **Check official docs first** — Use WebSearch for `site:support.claude.com [topic]` and `site:anthropic.com [topic]`
3. **Check community sources** — Search for tested examples and real-world usage
4. **Cross-reference** — If community says X works, verify against official docs
5. **Synthesize** — Write structured notes in `research/synthesized/`
6. **Date everything** — Cowork changes fast; every claim gets a source date

### Output Format

Write synthesized research to `research/synthesized/{topic}.md`:

```markdown
# [Topic Name]

**Researched**: [YYYY-MM-DD]
**Sources**: [list of URLs checked]

## What It Is
[Plain-language explanation — as if telling the book's reader]

## How It Works
[Step-by-step, what the user sees and does]

## Best Practices
[What works well, from tested examples]

## Limitations
[What doesn't work, common failures]

## Prompts Found
[Any relevant prompts from community sources — raw, to be tested by prompt-curator]

## Open Questions
[Anything unclear or conflicting between sources]
```

### What to Track

- **Confirmed** (in official docs): Mark with [OFFICIAL]
- **Community-reported** (tested but not in docs): Mark with [COMMUNITY]
- **Unverified** (mentioned but not tested): Mark with [UNVERIFIED]

### Date Sensitivity

Cowork features change frequently. Always note:
- When the source was published
- Whether the feature might have changed since
- If the UI described matches current Cowork UI

## References

| File | Contents |
|------|----------|
| `references/anthropic-docs.md` | Key Anthropic documentation links |
| `references/community.md` | Community resources inventory |
