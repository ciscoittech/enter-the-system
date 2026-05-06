# Chapter 4: Structured Prompts — Your Systems Start Here

You have a napkin sketch of the system you want to build. You know the four concepts, the three patterns, and the six-step design process. You've felt each concept work and watched each one fail under manual execution.

Time to stop sketching and start building.

This chapter is where the book shifts. Act 1 gave you the thinking. Act 2 gives you the tools. And the first tool is the simplest one — a structured prompt, saved as a real file that you can see, edit, and reuse.

---

## Opening the Kitchen

You're about to open a terminal. If you've never done that before, this section takes about five minutes. If you have, skip to the next section.

A terminal is a text-based window where you type commands and see results. That's it. No mystery. The reason this book uses a terminal instead of a graphical interface is the same reason cooking shows use kitchens instead of vending machines — you need to see what you're making. In a graphical tool, your state files are hidden behind menus. Your skill documents are "settings" somewhere. Your hooks are invisible background processes. In the terminal, everything is a file in a folder. You can see it, open it, read it, change it. When you're learning to build systems, that transparency is the whole point.

Here's what to install:

**A terminal.** If you're on a Mac, you already have one (it's called Terminal, in your Applications/Utilities folder). But I recommend Warp — it's free, open-source, and designed for exactly this kind of work. Download it at warp.dev. On Windows, use Windows Terminal (built in) or Warp. On Linux, you already know what a terminal is.

**An AI CLI tool.** This book shows Claude Code, but the same patterns work in OpenAI's Codex, Kimi CLI, or any AI tool that works in the terminal. Install Claude Code by typing this in your terminal:

```
npm install -g @anthropic-ai/claude-code
```

If that command doesn't work, you'll need Node.js first — download it at nodejs.org, install it, then try again.

**If you prefer a graphical interface** — everything in this book works in Claude's desktop app (Cowork), VS Code with the Claude extension, or Cursor. The files you create are identical. The only difference is whether you see them in a terminal or through a graphical panel. I'll show the terminal because it makes the system visible. Use whatever you're comfortable with.

Now create a folder for your systems and open your AI tool:

```
mkdir my-ai-systems
cd my-ai-systems
claude
```

Three commands. You're in. The AI is waiting for instructions. Let's give it some.

---

## The Four-Part Formula (One More Time)

You've used this before. In Chapter 2, Session 3, you upgraded your study prompt from "quiz me on the key concepts" to a structured version with four parts — and the output jumped from random to targeted. Same AI, dramatically better results.

Here's the formula:

**Context** — Who you are, what you're working on, where you stand. This calibrates the AI's tone and difficulty level.

**Input** — What the AI should read or work with. Files, notes, pasted content, a description of the situation.

**Output** — Exactly what the finished work looks like. Not "give me a summary" but "create a 10-question quiz with 4 options each, correct answers marked, and a 2-sentence explanation per answer."

**Constraints** — What NOT to do. "Don't ask memorization questions — focus on understanding." "Don't invent experience I don't have." "Keep it under 400 words."

We tested this formally. Same AI, same topic — a vague prompt versus the four-part formula. We scored both on relevance, specificity, difficulty calibration, and format compliance. The vague prompt averaged 11 out of 20. The structured prompt scored 20 out of 20. Every run. The biggest gap was format compliance — the vague prompt couldn't even produce the right number of questions consistently. (Full eval with scoring breakdowns is in this book's research repository.)

The formula works. Now you're going to save it as a file — not paste it into a chat and lose it, but write it to a file you keep, reuse, and improve over time. That's the difference between a prompt and a system component.

---

## Build It: Study System v1

**Components Used:** `[Prompt]`
**New this chapter:** `[Prompt]`

You're going to build the first version of the Study System — the same one you've been running manually since Chapter 1, but now as a real project with a real file.

**Step 1: Create the project folder.**

In your terminal (inside the `my-ai-systems` folder), type:

```
mkdir study-system
cd study-system
```

You now have a folder for your Study System. Every file this system needs will live here.

**Step 2: Create the prompt file.**

Create a new file called `study-prompt.md`. You can do this in any text editor, or type it directly. Here's the full prompt — copy it and fill in the brackets with your real topic:

```markdown
# Study System — Prompt v1

## Context
I'm studying [YOUR TOPIC — e.g., AWS Solutions Architect certification,
conversational Spanish, music theory, personal investing].

My current level: I understand [WHAT YOU KNOW] but struggle with
[WHAT TRIPS YOU UP].

My goal: [WHAT YOU NEED TO KNOW, AND BY WHEN — e.g., "pass the exam
by August" or "hold a 5-minute conversation by my trip in October"].

## Input
Here's what I've been working on recently:
[PASTE YOUR NOTES, OR DESCRIBE WHAT YOU'VE BEEN STUDYING]

## Output
Generate:
1. A summary of the 3-5 most important concepts from my input
   (in plain language, with one sentence explaining WHY each matters)
2. 10 quiz questions testing my understanding:
   - 4 multiple-choice options per question
   - Mark the correct answer
   - 2-sentence explanation: why the correct answer is right,
     and why the most tempting wrong answer is wrong
3. Connections: for each concept, one sentence linking it to
   something from a previous study session (if I mentioned one)
   or to an everyday analogy

## Constraints
- Focus on conceptual understanding, not memorization of specific
  numbers, dates, or command syntax
- If two answers could seem correct, acknowledge the ambiguity
  in your explanation
- Use plain language — if you use a technical term, define it
  immediately in parentheses
- Don't add study tips, exam strategies, or resource recommendations
  unless I ask
```

Save this file. Read it back. Notice the structure — Context tells the AI who you are, Input gives it material to work with, Output specifies exactly what comes back, Constraints prevent the three problems you discovered in Chapter 2 (memorization questions, unexplained ambiguity, unsolicited extras).

This file is your first system component. It's not a message you paste and lose — it's a document you keep, reference, and improve.

**Step 3: Run it.**

In Claude Code (or your AI tool), reference the prompt:

```
Read study-prompt.md and follow the instructions in it.
Use my notes below as the Input section:

[Paste your actual study notes or describe what you've been working on]
```

Watch what happens. The AI reads your prompt file, follows the four-part structure, and generates output that matches your specifications. You should see:

- A concept summary in plain language (not a textbook dump)
- 10 quiz questions weighted toward your weak areas (if you described them in Context)
- Explanations that address why wrong answers are tempting, not just why right answers are right
- No unsolicited study tips or resource recommendations (your Constraints section working)

Here's an abbreviated sample of what the output looks like (using personal investing as the example):

**Concept Summary:**

*1. Compound interest isn't just "interest on interest" — it's why starting early matters more than starting big. A 22-year-old investing $200/month beats a 32-year-old investing $400/month by retirement, because the early investor has 10 extra years of compounding.*

*2. An index fund isn't a "safe" investment — it's a "diversified" investment. It still goes down. The difference is that it tracks the whole market instead of betting on one company...*

**Quiz (showing 2 of 10):**

*Question 3: Why might a target-date fund be appropriate for a beginning investor?*
- *A) It guarantees a specific return by the target date*
- *B) It automatically adjusts its stock-to-bond ratio as the target date approaches*
- *C) It only invests in government-backed securities*
- *D) It has no management fees*

*Correct: B. Target-date funds shift from growth-oriented (more stocks) to preservation-oriented (more bonds) as you approach retirement. Option A is tempting because the name "target-date" sounds like a guarantee — but the date is when the allocation shifts, not when a return is promised.*

The structured prompt produced better output than anything you got in Chapter 1's sessions. The format is consistent. The difficulty matches your stated level. The constraints held.

**Step 4: Notice what's missing.**

Close your AI tool. Open it again. Ask it about your study topic without referencing the prompt file.

It has no idea you were just here. Your quiz scores? Gone. Your weak areas? Unknown. The concepts you nailed? It'll quiz you on them again. The ten minutes you just spent? Invisible.

This is the same gap you felt in Chapter 1, Session 2. But now you can name it precisely: the system has Instruction (the structured prompt) but no Memory (nothing carries forward between sessions). Your napkin sketch from Chapter 3 shows exactly where the state file goes. Chapter 5 puts it there.

---

## Extend It: Three More v1 Prompts

The four-part formula isn't specific to studying. It works for anything you'd ask AI to help with. Here are three more systems — each one gets a prompt file, and each one has the same gap.

### Job Hunting v1

Create a folder and a prompt file:

```
mkdir ../job-hunting
```

Create `job-hunting/job-prompt.md`:

```markdown
# Job Hunting — Prompt v1

## Context
I'm a [YOUR ROLE — e.g., product manager with 7 years of experience
in B2B SaaS]. I'm targeting [ROLE TYPE — e.g., Senior PM roles at
growth-stage startups]. My strongest selling points are [2-3 KEY
ACHIEVEMENTS — quantified if possible].

## Input
Here's the job posting I'm applying to:
[PASTE THE FULL JOB POSTING]

## Output
1. 5 resume bullet points tailored to this specific role
   (each starting with an action verb, each quantified)
2. A cover letter draft (under 400 words) that:
   - Names the company and references something specific about them
   - Connects my experience to their stated needs
   - Sounds like a person, not a template
3. 3 potential interview questions specific to this role,
   with suggested talking points from my experience

## Constraints
- Never invent experience, projects, or metrics I didn't provide
- Don't use "passionate about" or "excited to join" — find a
  more specific reason
- Keep the cover letter under 400 words
```

Run it with a real job posting. The output should be noticeably tailored — not a generic cover letter with the company name swapped in, but one that references specific details from the posting. But close the session and try another job posting tomorrow — you'll re-explain your entire career from scratch. No tracking of what you've applied to, which resume version you used where, or what's gotten callbacks.

### Project Management v1

Create `project-mgmt/pm-prompt.md`:

```markdown
# Project Management — Prompt v1

## Context
I'm [YOUR ROLE] managing [PROJECT NAME]. The team includes
[WHO'S INVOLVED]. The deadline is [DATE].

## Input
Here's the current status:
[DESCRIBE WHAT'S DONE, WHAT'S IN PROGRESS, AND WHAT'S BLOCKED]

## Output
1. Task breakdown: each task with owner, dependency, estimated
   duration, and status (not started / in progress / done / blocked)
2. Critical path: which tasks must finish before others can start
3. Risk flag: anything that could delay the deadline, with a
   one-sentence mitigation

## Constraints
- Don't assume resources I haven't mentioned
- Flag any task that depends on something outside the team's control
- If a deadline looks impossible given the dependencies, say so
```

Run it. Solid task breakdown. Come back next week — the AI has no idea what's been completed, what slipped, or that the deadline moved to Friday.

### Content v1

Create `content/content-prompt.md`:

```markdown
# Content — Prompt v1

## Context
I write [WHAT — blog posts, newsletters, social media] for
[AUDIENCE]. My tone is [DESCRIBE — e.g., conversational but
informed, like explaining something to a smart friend].

## Input
Topic: [WHAT TO WRITE ABOUT]
Angle: [WHAT MAKES YOUR TAKE DIFFERENT]

## Output
An 800-word blog post with:
- A hook in the first sentence (not "In today's world...")
- A clear argument that builds (not a listicle)
- One specific example or story
- A close that gives the reader something to do or think about

## Constraints
- Never use: "leverage," "utilize," "delve," "ecosystem,"
  "game-changing," "in today's rapidly evolving landscape"
- Don't hedge with "it might" or "could potentially" — take a position
- No numbered lists as the main structure
```

Run it. Readable draft. But it doesn't know your voice — it's writing in its voice, calibrated slightly by your description. Post #2 will sound different from post #1 because there's no loaded knowledge of how you actually write. That's what skills fix in Chapter 7.

---

## The Pattern

Four systems. Four domains. Same four-part formula. Each one produces better output than a vague prompt — dramatically better. And each one breaks the same way: close the session, and everything starts from zero.

You now have four folders in `my-ai-systems/`:

```
my-ai-systems/
├── study-system/
│   └── study-prompt.md
├── job-hunting/
│   └── job-prompt.md
├── project-mgmt/
│   └── pm-prompt.md
└── content/
    └── content-prompt.md
```

Four prompt files. Four system components. Four v1 systems that work for a single session and forget everything.

Here's what your system looks like right now:

```
[Your input] → [Structured Prompt file] → [AI] → [Output]
```

No feedback arrow. No loop. No memory. The output goes to you, and that's where it ends. Next session, the AI starts fresh.

You already know what's missing — you drew it on a napkin in Chapter 3. The feedback loop. A file that carries forward what happened this session so the next session can pick up where this one left off.

That file is called state. Chapter 5 builds it.

---

## How to Know It's Clicking

Five checks:

**Folder check.** You have four folders in `my-ai-systems/`, each with a prompt file. They're real files you can open, read, and edit — not messages lost in a chat history.

**Format check.** Run any of the four prompts. The output follows your requested format — 4-option quiz questions, quantified resume bullets, task breakdown with owners, blog post with a hook (not "In today's world..."). If the format is wrong, your Output section isn't specific enough.

**Quality check.** Compare the Study System output to what you got in Chapter 1, Session 1. The structured version should be noticeably better — more targeted, better explained, fewer random tangents.

**Break it on purpose.** Close your AI tool. Open it fresh. Run the Study System prompt again without changing anything. Verify: the AI doesn't mention yesterday's quiz scores, doesn't know your weak areas, covers topics you already mastered. That's the gap. You can name it now: "No state. No memory. No feedback loop."

**Explain it.** You can tell someone, in your own words, why a structured prompt is better than a vague one — AND why it's still not a system. The prompt is one component. The system needs at least two more before the loop closes.
