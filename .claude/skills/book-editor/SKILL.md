---
name: book-editor
description: Review chapters for voice consistency, AI tells, jargon, and accessibility for non-technical readers. Use when reviewing drafts. Loaded by /review command.
---

# Book Editor Skill

## Purpose

Review chapter drafts to ensure they meet quality standards for a non-technical audience. Score against the 6-dimension rubric and provide specific revision notes.

## Review Process

1. Read the draft end-to-end
2. Run each check in `references/checklist.md`
3. Score against the 6-dimension rubric (see `book-writer/references/scoring.md`)
4. Write specific revision notes — not "improve clarity" but "paragraph 3 uses 'context window' without translation"
5. Flag any dimension scoring < 3 for rewrite

## What to Check

### Voice Scan
- [ ] No AI tells (see `book-writer/references/voice.md` for the full list)
- [ ] Conversational tone throughout — reads like a person, not a manual
- [ ] Varied sentence length (not all 15-20 word sentences)
- [ ] Varied paragraph length (mix of 1-sentence and 3-4 sentence paragraphs)
- [ ] No hedging ("it might be possible to perhaps..." → "do this")
- [ ] No corporate speak ("provides value across use cases" → cut it)

### Jargon Scan
- [ ] Every technical term has a plain-language equivalent (see `book-writer/references/anti-jargon.md`)
- [ ] UI terms used as-is with translation on first use
- [ ] No unexplained acronyms
- [ ] No assumed knowledge (don't say "open your terminal" — the reader may not know what that is)

### Accessibility Check
- [ ] Steps start with verbs ("Open", "Click", "Type")
- [ ] What Claude does at each step is described (reader knows what to expect)
- [ ] Error states are covered ("If Claude asks for permission, click Allow")
- [ ] No assumed familiarity with other AI tools

### System Completeness
- [ ] Chapter follows the template: Hook → System → Walk-Through → Prompts → Quality Gate → Prompt Pack
- [ ] The system is a repeatable workflow, not a one-time explanation
- [ ] Quality gate checks are concrete and verifiable
- [ ] Prompts follow the 4-part formula

### Progression Check
- [ ] No forward references to later chapters
- [ ] Prior concepts referenced with brief reminders
- [ ] Difficulty level matches chapter position (early = simpler)

## Output Format

```markdown
## Review: Chapter [XX] — [Name]

**Date**: [YYYY-MM-DD]

### Score Card

| Dimension | Score | Notes |
|-----------|-------|-------|
| Clarity | _/5 | |
| System | _/5 | |
| Voice | _/5 | |
| Prompts | _/5 | |
| Progression | _/5 | |
| Quality Gate | _/5 | |
| **TOTAL** | **_/30** | |

### PASS: [Yes/No]

### Revision Notes

1. [Specific issue + location + suggested fix]
2. [Specific issue + location + suggested fix]
...

### AI Tells Found
- [List any detected AI tells with location]

### Jargon Found (untranslated)
- [List any jargon without plain-language equivalent]
```

## References

| File | Contents |
|------|----------|
| `references/checklist.md` | Per-chapter review checklist |
| `references/accessibility.md` | Non-technical audience rules |
