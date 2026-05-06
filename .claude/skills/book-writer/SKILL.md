---
name: book-writer
description: Voice rules, chapter structure, systems-thinking framework, and scoring rubric for "Enter the System." Use when drafting chapters. Loaded by /draft command.
---

# Book Writer Skill

## 1. Identity

You are writing a systems-thinking book that happens to use Claude Cowork as the vehicle. The reader doesn't just learn to use AI — they learn to THINK in systems and BUILD systems that make AI work reliably.

**Core stance**: "The difference between AI that sometimes helps and AI that reliably works is systems thinking. Prompts are one component. This book teaches all six."

**What this book is NOT**: A guide to Cowork. A prompt collection. A tutorial on one tool. "50 things you can do with AI."

**What this book IS**: A systems-thinking workbook. Each chapter teaches a concept (how systems work), introduces a component (a building block), and includes a project (the reader builds something real). Components accumulate — by the end, the reader has built a full personal AI operating system.

**The six components** (introduced progressively):
1. **Prompt** — What you tell Claude (Ch 2)
2. **State** — A file that remembers what happened (Ch 4)
3. **Skill** — A reusable knowledge doc Claude loads (Ch 7)
4. **Hook** — An automated check that prevents mistakes (Ch 8)
5. **Connection** — Pulling live data from outside tools (Ch 10)
6. **Pipeline** — Multi-stage flow with quality gates (Ch 11)

## 2. Chapter Templates

There are THREE chapter types. Pick the right one for the chapter you're drafting.

| Type | Chapters | Purpose |
|------|----------|---------|
| **A — Project/Component** | 2, 4, 5, 7, 8, 10, 11 | Reader builds a working system. Most introduce a new component; some deepen one already introduced. |
| **B — Concept-Only** | 0, 1, 3, 6, 12, 14 | Teach a systems-thinking concept. No build — a mental model and a small thinking exercise. |
| **C — Integration/Capstone** | 9, 13 | Combine prior components into a bigger system. Already-introduced components only. |

### Type A: Project/Component Chapter

**The Problem** — 2-3 paragraphs
What fails WITHOUT this component. Use a specific scenario. "You ran the file organizer from Chapter 2 again next week. It didn't remember anything. It re-sorted files you'd already sorted. That's an open-loop system."

**See the System** — 1-2 paragraphs + system diagram
Show the current system (components from prior chapters) and point at the gap. "Here's what you have. Here's what's missing. This chapter fills that gap."

**The New Component** — 2-3 paragraphs
What this component IS, in plain language. **Name the failure it prevents** in one specific sentence. When you need it vs when you don't.

**Build It (Project)** — The bulk of the chapter
Step-by-step: build a working system using this component + all prior components.
- Show the "Components Used" checklist at the top (e.g., `[Prompt] + [State] + [Skill]`)
- Walk through building each piece
- Show what Claude does at each step
- Include every file the reader creates (state files, skill docs, hook scripts) in full

**System Diagram** — Visual showing all components and connections
The reader can SEE their system growing chapter by chapter. Use simple text diagrams:
```
[Inputs] → [Prompt + Skill loaded + State read] → [Claude] → [Hook checks] → [Output + State updated]
```

**You Got It Right When...** — 3-5 concrete checks
At least one check MUST be a **"break it on purpose"** step: feed the system bad input that the new component is supposed to catch. If the new component doesn't catch it, the chapter doesn't pass.

### Type B: Concept-Only Chapter

**The Insight** — The systems-thinking concept this chapter teaches (open vs closed loops, constraints, stocks/flows, etc.)
**The Framework** — A mental model the reader can apply, not a project. Show it with examples from work the reader already does.
**Mini Exercise** — A thinking exercise, not a build. "Map your weekly status meeting as a system. Name its inputs, process, outputs, and feedback loop."
**Quality Gate** — The reader can explain or apply the concept without the book open.

### Type C: Integration/Capstone Chapter

**What You Have** — Review all components built so far. Show the running "Components Used" inventory.
**How They Connect** — Show how components interact as one system. Diagram the data flow between them.
**Build It (Capstone Project)** — Combine prior components into something bigger. **Do NOT introduce a new component here** — integration chapters use what's already in the toolkit.
**Design Principles** — Rules for when to add vs remove components ("If removing a component doesn't break anything, remove it").
**Quality Gate** — The integrated system works end-to-end. Include a "break it on purpose" check that exercises at least two components together.

## 3. Voice Rules

**Tone**: Casual but competent. Like a smart coworker showing you something useful over coffee. Not a textbook. Not a sales pitch.

**Sentence structure**: Short and varied. Max 4 sentences per paragraph. Single-sentence paragraphs for emphasis. Mix short punches with longer explanations.

**Vocabulary**:
- "Tell Claude" not "prompt the AI"
- "The folder where your files live" not "the working directory"
- "What you want back" not "the desired output specification"
- "Claude will read your files" not "the model will ingest the context"
- "If something goes wrong" not "error handling"
- "Try again with" not "iterate on the prompt"

**Perspective**: Second person ("you"). Present tense for instructions. Past tense for examples.

**Specificity**: Use exact examples. "A 47-row expense report from your accountant" not "a spreadsheet." "$340 in forgotten subscriptions" not "unnecessary costs."

See `references/voice.md` for AI tells to eliminate and voice markers to inject.
See `references/anti-jargon.md` for the complete translation table.

## 4. Prompt Template Format

When presenting prompts inline, use this format:

```
[PROMPT START]
Context: I'm a [role] working on [project]. This folder contains [description of files].

Input: Read all the [file type] files in this folder. They are [format description].

Output: Create a [deliverable] that includes:
- [Specific element 1]
- [Specific element 2]
- [Specific element 3]
Save it as [filename] in the same folder.

If anything is unclear: [What Claude should do with ambiguous data]
[PROMPT END]
```

After each prompt, explain:
- **Context** tells Claude who you are so it calibrates tone and detail level
- **Input** tells Claude what to read and how it's structured
- **Output** tells Claude exactly what the finished work looks like
- **If anything is unclear** prevents Claude from guessing when it shouldn't

## 5. Authoring Rules (Apply Every Chapter)

These two rules cut more weak drafts than any other check.

**Name the failure.** When you introduce a new component, write one specific sentence that names the failure mode it prevents. Not "state helps Claude remember" — "without state, Claude re-categorizes the same expenses every month and you can't tell what changed." If you can't name the failure, the reader can't either, and the component feels arbitrary.

**Break it on purpose.** Every Type A and Type C chapter must include a step where the reader feeds bad input that the new component is supposed to catch. Over-budget transaction → Budget Guardian flags it. Source-less claim → research hook rejects it. Missing field → pipeline gate stops at REVIEW. Without this step, the reader has no proof the component does anything; with it, they've seen the system work AND the system fail safely. This is what separates "I built it" from "I trust it."

## 6. Quality Gates

Score each draft against the 6-dimension rubric (see `references/scoring.md`):

| Dimension | Minimum |
|-----------|---------|
| Clarity | 3 (auto-flag rewrite if < 3) |
| Systems Thinking | 3 |
| Voice | 3 |
| Build Quality | 3 |
| Progression | 3 |
| Quality Gate | 3 |
| **Total** | **20/30** |

## 7. References

| File | Contents |
|------|----------|
| `references/voice.md` | AI tells to eliminate, voice markers to inject |
| `references/scoring.md` | 6-dimension rubric with examples |
| `references/structure.md` | Section lengths and templates for the 3 chapter types |
| `references/anti-jargon.md` | Jargon-to-plain-language translation table |
| `references/diagrams.md` | Progressive system diagram examples (Ch 2 → Ch 11) |
