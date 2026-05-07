# From Prompts to Pipelines

### A Systems-Based Approach to Prompt Engineering and Agentic Workflows

You've used AI a hundred times. Sometimes it's magic. Sometimes it's useless. You re-explain your background every session. You manually check every output. You paste the same context into a new chat window and hope for the best.

**The problem isn't the AI. The problem is you're writing prompts when you should be building systems.**

A prompt is one input. A system is the whole loop — instruction, memory, control, and flow. This book teaches you to see the system, then build it. You'll go from one-shot prompts that work once to full pipelines that run reliably, remember what happened, catch their own mistakes, and get better over time.

> *"We tested this. Same AI, same task. Vague prompt: 11 out of 20. Structured prompt: 20 out of 20. Every run."*
> — [Eval notebook with full results](research/evals/notebooks/01-prompt-structure.ipynb)

---

## Read Act 1 (Free)

Act 1 teaches the universal framework — works in ChatGPT, Claude, Gemini, whatever you have. No terminal required.

| Ch | Read | What You Learn |
|----|------|---------------|
| 1 | [You're Already Building Systems](book/chapters/ch01-draft.md) | The four concepts. Why your prompts break. |
| 2 | [Going Deeper](book/chapters/ch02-draft.md) | Push each concept, feel why manual systems collapse |
| 3 | [Design Patterns](book/chapters/ch03-draft.md) | Loop, Gate, Router — design on a napkin |

**[Start reading Chapter 1 →](book/chapters/ch01-draft.md)**

Or read the compiled version: **[Act 1 Beta Draft (~11,000 words) →](book/published/act1-beta-draft.md)**

---

## Act 2: Preview

Act 2 is where you build. One new component per chapter. By the end, your systems have all six components working together.

| Ch | Preview | Component | What You Build |
|----|---------|-----------|---------------|
| 4 | [Structured Prompts](book/chapters/teasers/ch04-teaser.md) | Prompt | CLAUDE.md — persistent project instructions |
| 5 | [State Files](book/chapters/teasers/ch05-teaser.md) | State | Memory that carries forward across sessions |
| 6 | [Skills](book/chapters/teasers/ch06-teaser.md) | Skill | Loaded expertise — your voice, your rules |
| 7 | [Hooks](book/chapters/teasers/ch07-teaser.md) | Hook | Automated checks that catch mistakes |
| 8 | [Connections](book/chapters/teasers/ch08-teaser.md) | Connection | Live data from the outside world |
| 9 | [Pipelines](book/chapters/teasers/ch09-teaser.md) | Pipeline | Multi-stage workflows with quality gates |
| 10 | [A Real System](book/chapters/teasers/ch10-teaser.md) | — | Production case study: MongoDB + AI agents |
| 11 | [The Cost of Intelligence](book/chapters/teasers/ch11-teaser.md) | — | Token economics, spend smart |
| 12 | [When Systems Break](book/chapters/teasers/ch12-teaser.md) | — | Every failure maps to a component |
| 13 | [Composing Systems](book/chapters/teasers/ch13-teaser.md) | — | Wire systems into a personal AI OS |
| 14 | [Designing New Systems](book/chapters/teasers/ch14-teaser.md) | — | Build from scratch for any problem |
| 15 | [What's Next](book/chapters/teasers/ch15-teaser.md) | — | The framework outlasts every tool |

**[Get the full book →](https://frontierengineering.dev/book)**

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

**It's not tied to one tool.** The concepts work in Claude Code, OpenAI Codex, Kimi CLI, Cursor, or whatever ships next year.

---

## The Framework

**4 Universal Concepts** — tool-agnostic:

| Concept | The Failure It Prevents |
|---------|------------------------|
| **Instruction** | "It didn't do what I wanted" |
| **Memory** | "I have to re-explain everything every time" |
| **Control** | "It gave me confident garbage" |
| **Flow** | "It tried to do everything at once" |

**6 Components** — what you build in Act 2:

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

## The Evidence

| Evidence | What It Proves |
|----------|---------------|
| [Prompt Eval: 11/20 → 20/20](research/evals/notebooks/01-prompt-structure.ipynb) | Structured prompts are categorically better |
| [Study System (production)](research/systems/study-system/) | 127 items, quiz scoring, gap detection |
| [Work System (production)](research/systems/work-system/) | 15 agents, 15 skills, 80K+ reference docs |
| [Content System (production)](research/systems/content-system/) | 7-stage pipeline, 26 posts, 24/30 quality gate |
| [PII Redactor (production)](research/systems/pii-redactor/) | Domain-aware redaction with context injection |

---

## Status

**All 15 chapters drafted. ~53,000 words. 32 publication-quality diagrams. PDF compiling.**

| Area | Status |
|------|--------|
| Act 1 (Ch 1-3) | Complete. Free to read. |
| Act 2 (Ch 4-15) | Complete. Previews available, full text in the book. |
| Diagrams | 32 diagrams — consistent design system, print-ready |
| Downloads | [Project starter files](downloads/) for Ch 4-7 |

---

## About

Terrence Hunt. Network engineer. Founder of [Frontier Engineering](https://frontierengineering.dev). Based abroad, building products and raising his daughter.

Before this book, he spent years doing exactly what Chapter 1 describes — re-explaining context every session, catching fabricated output by reading everything twice. The systems in this book are what replaced that. Three personal systems and a production business system run daily. Every chapter comes from that.

[@bmoreopensource](https://twitter.com/bmoreopensource) · [Engineering Abroad](https://engineeringabroad.substack.com) · First book.

**[Start reading →](book/chapters/ch01-draft.md)**
