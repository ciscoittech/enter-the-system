# From Prompts to Pipelines

### A Systems-Based Approach to Prompt Engineering and Agentic Workflows

You've used AI a hundred times. Sometimes it's magic. Sometimes it's useless. You re-explain your background every session. You manually check every output. You paste the same context into a new chat window and hope for the best.

**The problem isn't the AI. The problem is you're writing prompts when you should be building systems.**

A prompt is one input. A system is the whole loop — instruction, memory, control, and flow. This book teaches you to see the system, then build it. You'll go from one-shot prompts that work once to full pipelines that run reliably, remember what happened, catch their own mistakes, and get better over time.

> *"We tested this. Same AI, same task. Vague prompt: 11 out of 20. Structured prompt: 20 out of 20. Every run."*
> — [Eval notebook with full results](research/evals/notebooks/01-prompt-structure.ipynb)

---

## Read the Book

| | Link | What's Inside |
|---|------|-------------|
| **Act 1** (Free) | **[Read Act 1 →](book/published/act1-beta-draft.md)** | 3 chapters, ~11,000 words. Universal concepts. Works in any AI tool. |
| **Act 2** (Full Draft) | **[Read Act 2 →](book/published/act2-beta-draft.md)** | 12 chapters, ~40,000 words. Build real systems. Production case study. |

Or read individual chapters:

**Act 1: The System** — tool-agnostic, works in ChatGPT/Claude/Gemini

| Ch | Read | What You Learn |
|----|------|---------------|
| 1 | [You're Already Building Systems](book/chapters/ch01-draft.md) | The four concepts. Why your prompts break. |
| 2 | [Going Deeper](book/chapters/ch02-draft.md) | Push each concept, feel why manual systems collapse |
| 3 | [Design Patterns](book/chapters/ch03-draft.md) | Loop, Gate, Router — design on a napkin |

**Act 2: The Build** — hands-on, one new component per chapter

| Ch | Read | Component | What You Build |
|----|------|-----------|---------------|
| 4 | [Structured Prompts](book/chapters/ch04-draft.md) | Prompt | CLAUDE.md — persistent project instructions |
| 5 | [State Files](book/chapters/ch05-draft.md) | State | Memory that carries forward across sessions |
| 6 | [Skills](book/chapters/ch06-draft.md) | Skill | Loaded expertise — your voice, your rules |
| 7 | [Hooks](book/chapters/ch07-draft.md) | Hook | Automated checks that catch mistakes |
| 8 | [Connections](book/chapters/ch08-draft.md) | Connection | Live data from the outside world |
| 9 | [Pipelines](book/chapters/ch09-draft.md) | Pipeline | Multi-stage workflows with quality gates |

**Act 2: Production & Mastery** — real-world systems, cost, debugging, composition

| Ch | Read | What You Learn |
|----|------|---------------|
| 10 | [A Real System](book/chapters/ch10-draft.md) | Production case study — MongoDB pipelines + AI agents |
| 11 | [The Cost of Intelligence](book/chapters/ch11-draft.md) | Token economics, model selection, spend smart |
| 12 | [When Systems Break](book/chapters/ch12-draft.md) | Every failure maps to a component — diagnose and fix |
| 13 | [Composing Systems](book/chapters/ch13-draft.md) | Wire systems into a personal AI operating system |
| 14 | [Designing New Systems](book/chapters/ch14-draft.md) | Build from scratch for any problem |
| 15 | [What's Next](book/chapters/ch15-draft.md) | The framework outlasts every tool |

---

## What Makes This Different

**Every other AI book teaches prompts. This one teaches systems.**

Most books stop at "write better prompts." That's one component. This book teaches six:

```
PROMPT → STATE → SKILL → HOOK → CONNECTION → PIPELINE
(what you    (what it    (loaded     (automated   (live external   (multi-stage
 tell it)    remembers)   expertise)   checks)      data)            workflows)
```

Each chapter adds one component. By the end, your systems have all six working together.

**Then it goes further.** Chapter 10 shows a production system that uses these same patterns at business scale — MongoDB aggregation pipelines discovering hidden supply chain relationships, an AI agent with 37 specialized tools reasoning across 22,000+ data points, and forensic matching that finds what no human could track manually.

**It's not tied to one tool.** The concepts work in Claude Code, OpenAI Codex, Kimi CLI, Cursor, or whatever ships next year. Chapter 6 explicitly covers how skills transfer across platforms.

---

## Highlights

### PII Redaction as a System Design Pattern (Ch 7)

The book teaches hooks through a cover letter fabrication detector — a script that catches AI-invented credentials before you submit them. But it also shows where hooks go at scale: a production PII redactor that strips sensitive data before the AI sees it, maps private information to safe aliases, and — the key insight — **injects context telling the AI how to interpret the sanitized data**. That last part is systems thinking: the redaction alone is regex, but the context injection is what makes it a *system*.

[See the production PII redactor evidence →](research/systems/pii-redactor/)

### Production Aggregation Pipeline (Ch 10)

Chapter 10 isn't a toy example. It's an abstracted version of a real business system:

- **Supply chain forensics** — price correlation algorithms that discover who supplies whom by comparing pricing across 22,000+ quotes. If Supplier A is consistently 30%+ cheaper than Supplier B across 3+ overlapping products, A supplies B. Confidence scoring at three tiers.
- **Multi-dimensional profiling** — six analyses running in parallel against the same dataset. One query, six answers. Competitor battlecards assembled in under a second.
- **37-tool AI agent** — three thinking modes (factual lookup, analytical reasoning, strategic sparring) with automatic mode detection. Ask "What should I buy with $5,000?" and get a sourced, evidence-backed purchasing recommendation.
- **Multi-signal demand scoring** — weighted across demand (35%), margin (30%), supply reliability (20%), and data confidence (15%). Every recommendation traces back to specific data points.

Every component maps back to what the reader built in Chapters 4-9. Same patterns, different scale.

[Read the full production case study →](book/chapters/ch10-draft.md) · [See the diagrams →](book/chapters/ch10-showcase.md)

---

## Download the Project Files

Every Act 2 build chapter has downloadable starter and finished files — the actual CLAUDE.md files, state files, skill documents, and hook scripts.

**[Browse all downloads →](downloads/)**

| Folder | Chapter | What's Inside |
|--------|---------|---------------|
| [`before/`](downloads/before/) | Act 1 | The vague one-liner prompts most people start with |
| [`ch04-prompt/`](downloads/ch04-prompt/) | Ch 4 | Root CLAUDE.md + 4 system CLAUDE.md files |
| [`ch05-state/`](downloads/ch05-state/) | Ch 5 | + 4 state files with @import wiring |
| [`ch06-skill/`](downloads/ch06-skill/) | Ch 6 | + 5 skill files in .claude/skills/ |
| [`ch07-hook/`](downloads/ch07-hook/) | Ch 7 | + 7 hook scripts + settings.json (correct stdin JSON API) |

Each folder is self-contained — every file your system needs after that chapter. Replace `[BRACKETED PLACEHOLDERS]` with your info.

---

## The Evidence

| Evidence | What It Proves |
|----------|---------------|
| [Prompt Eval: 11/20 → 20/20](research/evals/notebooks/01-prompt-structure.ipynb) | Structured prompts are categorically better |
| [Study System (production)](research/systems/study-system/) | 127 items, quiz scoring, gap detection |
| [Work System (production)](research/systems/work-system/) | 15 agents, 15 skills, 80K+ reference docs |
| [Content System (production)](research/systems/content-system/) | 7-stage pipeline, 26 posts, 24/30 quality gate |
| [PII Redactor (production)](research/systems/pii-redactor/) | Domain-aware redaction with context injection |
| [Production Case Study](book/chapters/ch10-showcase.md) | MongoDB pipelines, 37-tool AI agent, forensic matching |

---

## The Framework

**4 Universal Concepts** — tool-agnostic:

| Concept | The Failure It Prevents |
|---------|------------------------|
| **Instruction** | "It didn't do what I wanted" |
| **Memory** | "I have to re-explain everything every time" |
| **Control** | "It gave me confident garbage" |
| **Flow** | "It tried to do everything at once" |

**6 Components** — what you build:

| Component | Chapter | What It Does |
|-----------|---------|-------------|
| Prompt | Ch 4 | Persistent project instructions (CLAUDE.md) |
| State | Ch 5 | Files that track what happened across sessions |
| Skill | Ch 6 | Reusable expertise docs loaded on demand |
| Hook | Ch 7 | Automated checks that catch mistakes |
| Connection | Ch 8 | Live data from external tools and APIs |
| Pipeline | Ch 9 | Multi-stage workflows with quality gates |

**3 Design Patterns**: Loop (improve iteratively), Gate (check before shipping), Router (different inputs, different handling)

---

## Status

**All 15 chapters drafted. ~50,000 words. Scored, reviewed, and second-pass edited.**

| Area | Status |
|------|--------|
| Act 1 (Ch 1-3) | Drafted, reviewed, 28-30/30 |
| Act 2 Build (Ch 4-9) | Drafted, reviewed, 23-27/30 |
| Act 2 Mastery (Ch 10-15) | Drafted, reviewed, 22-30/30 |
| Downloads | 54 project files (Ch 4-7) |
| Research | 8 docs with verified CLI behavior |
| Diagrams | 19 embedded across Ch 1-10, 10 placeholders in Ch 11-15 |
| Production Evidence | 3 systems + PII redactor + case study |

Average score: **25.9/30**. All pass. One perfect score (Ch 14: Designing New Systems).

---

## Get Involved

**Read it and tell us what you think.** [GitHub Issues](../../issues) — what clicked, what confused you, what's missing.

**Run the evals yourself.** The [notebooks](research/evals/) work with any AI API.

---

## About

Written by a network engineer who builds AI systems in production — not a researcher writing about theory. Three personal systems plus a production business system (MongoDB aggregation pipelines, AI agents, forensic matching) run daily and inform every chapter.

CLI-demonstrated and interface-agnostic. Same patterns work in Claude Code, Codex, Kimi CLI, Cursor, or whatever ships next.

**[Start reading →](book/published/act1-beta-draft.md)**
