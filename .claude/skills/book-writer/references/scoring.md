# Scoring Rubric — Chapter Quality

## 6 Dimensions (1-5 each, minimum 20/30 to publish)

### 1. Clarity (Can a non-technical reader follow every sentence?)

| Score | Meaning |
|-------|---------|
| 1 | Technical jargon throughout, assumes AI knowledge |
| 2 | Some jargon translated, but still assumes familiarity |
| 3 | Readable by non-technical audience with occasional stumbles |
| 4 | Clear throughout, all technical terms translated in-context |
| 5 | A non-technical friend could read this aloud and explain it to someone else |

**Auto-flag**: Score < 3 requires full rewrite.

### 2. Systems Thinking (Does the chapter teach a systems concept, not just a task?)

| Score | Meaning |
|-------|---------|
| 1 | Teaches a task or a prompt — no systems framing at all |
| 2 | Mentions "system" but the chapter is really just a how-to |
| 3 | Names the system anatomy (inputs, process, outputs, feedback) but loosely |
| 4 | Teaches a clear systems concept (state, feedback loop, constraint, guard rail) and the project demonstrates it |
| 5 | Reader walks away with a transferable mental model — they could apply the concept to a task the book never mentioned |

**What to look for**:
- Does the chapter name the failure mode the new component prevents?
- Does the system diagram show all components and how they connect?
- Does the reader understand WHY this component exists, not just HOW to build it?

### 3. Voice (Conversational? Free of AI tells?)

| Score | Meaning |
|-------|---------|
| 1 | Reads like AI-generated content (numbered lists, hedging, corporate tone) |
| 2 | Mostly conversational but AI tells slip through |
| 3 | Conversational tone maintained, rare AI tells |
| 4 | Distinctive voice, engaging, no AI tells detected |
| 5 | You'd swear a specific human wrote this — personality in every paragraph |

### 4. Build Quality (Does the project produce a working system the reader can verify?)

| Score | Meaning |
|-------|---------|
| 1 | No project, or project is too vague to actually build |
| 2 | Project exists but is incomplete (missing files, missing steps, no verification) |
| 3 | Project produces a working system but verification is weak |
| 4 | Project produces a working system with clear "break it on purpose" verification step |
| 5 | Project is fully reproducible — files, prompts, expected output, and a failure-mode test the reader can run |

**What to look for**:
- Are all the files the reader needs to create shown explicitly (state files, skill docs, hook scripts)?
- Does the chapter include a "break it on purpose" step that proves the new component is catching what it's supposed to catch?
- Can a reader copy what's in the chapter and end up with a working system?

### 5. Progression (Adds exactly one new component? Builds on prior chapters?)

| Score | Meaning |
|-------|---------|
| 1 | References concepts from later chapters or assumes skipped material |
| 2 | Adds multiple components at once, or skips a dependency |
| 3 | Properly sequenced, minimal forward references |
| 4 | Adds exactly one new component, explicitly connects to what reader already built |
| 5 | Perfect sequencing — the reader's "Components Used" checklist grows by exactly one and the chapter shows the prior system as the foundation |

### 6. Quality Gate (Is "you got it right when..." concrete and verifiable?)

| Score | Meaning |
|-------|---------|
| 1 | No quality gate or feelings-based ("you feel more confident") |
| 2 | Vague checks ("your files are organized") |
| 3 | Specific checks but some are hard to verify |
| 4 | All checks are concrete and observable |
| 5 | Checks include a "break it on purpose" test — the reader intentionally feeds bad input and the new component catches it |

## Score Card Template

```
Chapter: [XX-name]
Date: [YYYY-MM-DD]
Reviewer: [agent/human]

Clarity:           _/5
Systems Thinking:  _/5
Voice:             _/5
Build Quality:     _/5
Progression:       _/5
Quality Gate:      _/5
─────────────────
TOTAL:             _/30

PASS: [ ] (>= 20/30, no dimension < 3)

Notes:
-
```
