# Prompt Library

## Organization

```
prompts/
├── tested/              # Verified prompts, ready for the book
│   ├── file-organization/
│   ├── document-synthesis/
│   ├── data-analysis/
│   ├── presentations/
│   ├── research/
│   ├── email-comms/
│   ├── expense-tracking/
│   ├── travel-planning/
│   └── multi-step/
├── community/           # Raw prompts from community sources
│   ├── claudecowork-com/
│   ├── awesome-cowork/
│   ├── github-bruniaux/
│   └── other/
└── templates/           # The 4-part formula templates
```

## Prompt File Format

Every tested prompt follows this format:

```markdown
# [Descriptive Name]

**Use case**: [One sentence]
**Difficulty**: [1-5] | **Effectiveness**: [1-5]
**Source**: [community site / original / adapted from X]
**Tested**: [Yes/No, date]

## The Prompt
[Copy-paste ready text]

## What to Expect
[What Claude produces]

## What Can Go Wrong
[Failure modes + fixes]

## Variations
[How to modify for different situations]
```

## Rating Scales

**Difficulty** (how hard to set up):
1. Copy-paste as-is
2. Fill in 1-2 blanks
3. Some file setup needed
4. Moderate preparation
5. Advanced, multi-step

**Effectiveness** (how good the output):
1. Unreliable
2. Rough draft
3. Good with minor tweaks
4. Ready to use
5. Excellent, consistently

## How Prompts Get Into the Book

1. Curated from community sources → `prompts/community/`
2. Tested against protocol → `prompts/tested/`
3. Included in chapter drafts with explanation → `book/chapters/XX/draft.md`
4. Extracted as standalone files → `book/chapters/XX/prompts/`
5. Collected in appendix → `book/appendices/a-prompt-library.md`
