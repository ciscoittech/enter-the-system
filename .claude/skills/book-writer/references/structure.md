# Chapter Structure Reference

Three chapter types. Match the structure to the type before you start drafting.

| Type | Chapters | Total Words |
|------|----------|-------------|
| A — Project/Component | 2, 4, 5, 7, 8, 10, 11 | 2,000-3,500 |
| B — Concept-Only | 0, 1, 3, 6, 12, 14 | 1,200-2,000 |
| C — Integration/Capstone | 9, 13 | 2,500-4,000 |

---

## Type A: Project/Component Chapter

| Section | Target Length | Purpose |
|---------|--------------|---------|
| The Problem | 150-300 words | Specific scenario showing what fails without the new component |
| See the System | 100-200 words + diagram | Show current system, point at the gap |
| The New Component | 200-400 words | What it is, what failure it prevents (one specific sentence), when you need it |
| Build It (Project) | 1,000-1,800 words | Step-by-step build using all components-to-date |
| System Diagram | 50-100 words + diagram | Updated diagram showing the new component wired in |
| You Got It Right When | 100-200 words | 3-5 concrete checks, including one "break it on purpose" step |

**Components Used checklist** appears at the top of "Build It." Format:
```
Components Used: [Prompt] + [State] + [Skill]
New this chapter: [Skill]
```

**The Problem rules**:
- Open with a specific scenario, not a general statement
- Good: "It's the first of the month. You open last month's expense report. Claude sorted everything fine — but it sorted *the same transactions* you already sorted three weeks ago."
- Bad: "Memory is important when working with AI."
- The reader should recognize themselves in the first sentence
- No "In this chapter, you'll learn..." — just show the problem

**Build It rules**:
- Use second person, present tense: "Open the folder. Create a new file called `expense-state.md`."
- Show every file the reader creates in full — state files, skill docs, hook scripts
- Include what Claude says or does at each step
- Describe the output specifically (what does the file look like after Claude finishes?)
- Each step starts with a verb: Open, Create, Type, Run, Review, Save

**You Got It Right When rules**:
- Must be observable, not subjective
- Good: "The state file has a `last_processed_date` field that matches today's date"
- Bad: "The system feels like it's working"
- At least ONE check is a "break it on purpose" step (see Authoring Rules in SKILL.md §5)
- Include at least one negative check: "Claude did NOT re-categorize the transactions from last month"

---

## Type B: Concept-Only Chapter

| Section | Target Length | Purpose |
|---------|--------------|---------|
| The Insight | 200-400 words | The systems-thinking concept, framed against a familiar work scenario |
| The Framework | 400-700 words | The mental model, with examples from work the reader already does |
| Mini Exercise | 200-400 words | A thinking exercise (not a build) |
| Quality Gate | 50-150 words | The reader can apply the concept without the book |

**The Insight rules**:
- Open with a contradiction or a moment where the obvious answer is wrong
- "You'd think the slowest part of writing a report is the writing. It's not. It's deciding what's in scope."
- Tie the concept to friction the reader has already felt

**Mini Exercise rules**:
- Pick a task the reader already does weekly (status meeting, weekly review, expense report)
- Have them name the system anatomy: inputs, process, outputs, feedback
- No tools, no Claude, no files — paper or a doc
- Quality gate must be checkable without the book

---

## Type C: Integration/Capstone Chapter

| Section | Target Length | Purpose |
|---------|--------------|---------|
| What You Have | 200-400 words | Full inventory of components built so far |
| How They Connect | 300-500 words + diagram | Data flow between components |
| Build It (Capstone) | 1,200-2,200 words | Combine prior components into a bigger system |
| Design Principles | 300-500 words | Rules for adding/removing components |
| Quality Gate | 150-300 words | End-to-end check + at least one multi-component "break it on purpose" |

**Critical rule**: Integration chapters do NOT introduce a new component. If you find yourself adding one, the chapter is mistyped — it should be Type A.

**Design Principles rules**:
- Keep to 3-5 principles, each one sentence
- Examples: "Start with the smallest system that works." "If removing a component doesn't break anything, remove it." "The best systems are boring — predictable beats impressive."
- Tie each principle to a specific decision the reader just made in the build

---

## System Diagram Format

Use simple text-based flow diagrams. Components in brackets, arrows for flow, feedback loops shown explicitly when they exist.

**Ch 2 (Prompt only, no feedback yet):**
```
[Your files] → [Prompt] → [Claude] → [Organized files]
```

**Ch 4 (Adds State — first feedback loop):**
```
[Meeting notes] → [Prompt + State read] → [Claude] → [Summary + State updated]
                          ↑__________________________________|
```

**Ch 7 (Adds Skill):**
```
[Email request] → [Prompt + Voice skill loaded + State read] → [Claude] → [Draft + State updated]
                                                                              ↑___________|
```

**Ch 8 (Adds Hook):**
```
[Statements] → [Prompt + Skill + State] → [Claude] → [Hook check] → [Report + Alerts + State updated]
                                                          |              ↑________________|
                                                          ↓ fails
                                                       [Block + flag]
```

See `references/diagrams.md` for the full progression Ch 2 → Ch 11 with all components wired in.

---

## Cross-Chapter References

- **Allowed**: "Using the prompt formula from Chapter 2..." — back-reference to material the reader has already built
- **Allowed**: Brief reminder when reusing prior work — "Remember the 4-part formula? Same structure here, with one change..."
- **Not allowed**: "We'll cover this in Chapter 12..." — forward references break progression
- **Not allowed**: Using a component before its introduction chapter (see component schedule in `book/outline.md`)

---

## Prompt Template Presentation (Type A and Type C)

Show the complete prompt in a highlighted block, then explain each part:

```
[Show complete prompt here]
```

**Line-by-line breakdown:**
- **"Context: I'm a..."** — Tells Claude your role so it calibrates tone and detail level
- **"Input: Read all the..."** — Points Claude at your files and explains their structure
- **"Output: Create a..."** — Specifies exactly what the finished work looks like
- **"If anything is unclear..."** — Prevents Claude from guessing on ambiguous data
