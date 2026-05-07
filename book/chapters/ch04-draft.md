# Chapter 4: Structured Prompts. Your Systems Start Here

You have a napkin sketch of the system you want to build. You know the four concepts, the three patterns, and the six-step design process. You've felt each concept work and watched each one fail under manual execution.

Time to stop sketching and start building.

This chapter is where the book shifts. Act 1 gave you the thinking. Act 2 gives you the tools. And the first tool isn't what you'd expect. It's not a prompt you type. It's a file you write once that tells the AI who you are, what you're building, and how to work. A file that loads automatically every time you start a session, so you never re-explain yourself again.

---

## Opening the Kitchen

You're about to open a terminal. If you've never done that before, this section takes about five minutes. If you have, skip to the next section.

A terminal is a text-based window where you type commands and see results. That's it. The reason this book uses a terminal instead of a graphical interface is the same reason cooking shows use kitchens instead of vending machines: you need to see what you're making. In a graphical tool, your instruction files are hidden behind menus. Your state files are "settings" somewhere. Your hooks are invisible. In the terminal, everything is a file in a folder you can see, open, and understand.

Here's what to install:

**A terminal.** If you're on a Mac, you already have one (it's called Terminal, in Applications/Utilities). But I recommend Warp. It's free, open-source, and designed for working with AI tools. Download it at warp.dev. On Windows, use Windows Terminal or Warp. On Linux, you already know what a terminal is.

**An AI CLI tool.** This book shows Claude Code, but the patterns work in OpenAI's Codex, Kimi CLI, or any AI tool that runs in the terminal. Install Claude Code by typing:

```
npm install -g @anthropic-ai/claude-code
```

If that doesn't work, you need Node.js first. Download it at nodejs.org, install it, try again.

**If you prefer a graphical interface,** everything in this book works in Claude's desktop app (Cowork), VS Code with the Claude extension, or Cursor. The files you create are identical. Only the interface differs. I'll show the terminal because it makes the system visible. Use whatever you're comfortable with.

Now create a folder for your systems:

```
mkdir my-ai-systems
cd my-ai-systems
```

Before you create any system, take a second to understand what you're about to build.

**Your project folder is your workflow engine.** If you've used Zapier, Make, or n8n, you know the concept: connect steps together, each one processes data and passes it to the next, checks happen between steps, the whole thing runs on autopilot. Your project folder works the same way. Instead of dragging boxes on a canvas, you write small files. Instead of API keys and webhooks, you have a folder structure. Same idea, text instead of GUI.

Right now, you're building the first piece: a trigger (the file that loads automatically when you start a session). Over the next five chapters, you'll add each layer:

- **Chapter 5**: A data store (state files that track what happened)
- **Chapter 6**: Action nodes (skills that shape how the AI works)
- **Chapter 7**: Filter nodes (hooks that check output before you use it)
- **Chapter 8**: External connections (web search, data from other tools)
- **Chapter 9**: The full workflow definition (pipelines that chain it all together)

By Chapter 9, you'll have a complete automation engine built from files in a folder. By Chapter 10, you'll see how someone scaled this exact pattern into a production system with 37 tools and 22,000 data points.

The key difference from Zapier or n8n: those tools connect pre-built apps. Your folder connects AI capabilities YOU define. You're not limited to "when email arrives, add to spreadsheet." You're building "when I start a session, load my expertise, check my work against my actual credentials, and produce output that sounds like me." Custom logic, not pre-packaged integrations.

Now, the most important file in any AI project. It goes right here, in the root folder.

**A quick note on how context works.** Claude Code reads CLAUDE.md files by walking up the directory tree from wherever you're working. If you're in `my-ai-systems/study-system/`, it loads the CLAUDE.md in `study-system/` AND the CLAUDE.md in the parent `my-ai-systems/` folder. They stack: root first, then the subfolder. This means you can put shared rules in the root (your name, your general preferences, "never fabricate data") and system-specific context in each subfolder (your study topic, your career history, your project team). General → specific. Every AI tool with project instructions works this way. It's not a Claude Code quirk, it's how scoped context should work.

This matters because you're about to build four systems. They'll share some context (who you are, how you like to work) and differ on the rest (what each system does). One root file. Four system-specific files. The AI sees all of them.

---

## The File That Changes Everything

Every modern AI CLI tool (Claude Code, Codex, Kimi, Cursor) has the same foundational concept: a project instructions file. A plain text file that sits in your project folder and gets loaded automatically at the start of every session. You write it once. The AI reads it every time. You never re-explain yourself.

In Claude Code, this file is called `CLAUDE.md`. In Codex and Kimi, it's called `AGENTS.md`. In Cursor, it's `.cursorrules`. Different names, same idea. This book calls it what Claude Code calls it — CLAUDE.md — but the concept transfers to any tool.

Here's why this matters. Think back to Chapter 2. Every session, you typed your topic, your level, your weak areas, your constraints. Manual memory. By Session 4, maintaining that context was becoming a chore. By Session 20, you'd have quit.

CLAUDE.md solves the static part of that problem. Your topic doesn't change between sessions. Your level changes slowly. Your constraints ("focus on understanding, not memorization") are the same every time. All of that goes in CLAUDE.md, and you never type it again.

This is the first system component you're building. Not a prompt you paste into a chat and lose. A persistent file that defines how the AI works in this project, automatically, every session.

---

## Build It: The Root + Study System v1

**Components Used:** `[Prompt (CLAUDE.md)]`
**New this chapter:** The project instructions file — both root and system-specific

**Step 1: Create the root CLAUDE.md.**

This file lives in your `my-ai-systems/` folder, not inside any system. It contains what's true about YOU, regardless of which system you're working in.

Create `my-ai-systems/CLAUDE.md`:

```markdown
# My AI Systems

## Who I Am
[YOUR NAME]. [ONE SENTENCE ABOUT WHAT YOU DO].

## Shared Rules
- Use plain language. Define technical terms when you use them
- Never fabricate data, credentials, or experience
- If you're unsure about something, say so. Don't guess confidently
- Keep output concise. I'll ask for more detail if I need it

## Systems in This Project
- study-system/: learning and quiz system
- job-hunting/: career and application system
- project-mgmt/: task and status tracking
- content/: writing and publishing
```

That's your root context. Every system inherits this. You never type "don't fabricate data" in four different places. It lives once, at the root, and applies everywhere.

**Step 2: Create the study-system folder and its CLAUDE.md.**

```
mkdir study-system
cd study-system
```

Now create `study-system/CLAUDE.md`. This file has the system-specific context: your topic, level, quiz format. When Claude Code runs here, it reads BOTH files: the root (who you are, shared rules) and this one (what the Study System does). Open it in any text editor (VS Code, TextEdit, Notepad, whatever you have). Or if you're in Warp or another terminal, create it right there.

Here's what goes in it. Replace the brackets with your real information:

```markdown
# Study System

## Who I Am
I'm studying [YOUR TOPIC — e.g., AWS Solutions Architect certification,
conversational Spanish, music theory, personal investing].

My current level: I understand [WHAT YOU KNOW] but struggle with
[WHAT TRIPS YOU UP].

My goal: [WHAT YOU NEED TO KNOW AND BY WHEN].

## How to Quiz Me
When I ask for a quiz or study session:

**Format**: 10 questions, 4 multiple-choice options each. Mark the
correct answer. For each answer, write a 2-sentence explanation:
why the right answer is right, and why the most tempting wrong
answer is wrong.

**Difficulty**: At least 6 of 10 questions should target the areas
I said I struggle with. The other 4 should review areas I'm
stronger in to verify retention.

**Style**: Focus on conceptual understanding, not memorizing specific
numbers, dates, or syntax. If two answers could seem correct,
acknowledge the ambiguity. Use plain language, defining technical
terms in parentheses on first use.

## What NOT to Do
- Don't add study tips or exam strategies unless I ask
- Don't recommend courses, books, or resources unless I ask
- Don't include questions that require memorizing a specific
  number or date to answer
- Don't hedge. If you're unsure about an answer, flag it
  rather than guessing confidently
```

Save it. That's it. That's your first system component.

**Step 2: Launch the AI and see what happens.**

In your terminal, from the `study-system/` folder:

```
claude
```

Claude Code starts, sees your folder, and automatically reads CLAUDE.md. This is the important part. You don't paste anything. You don't reference the file. It just loads. Every session, every time, without you doing anything.

Now type:

```
Quiz me. I've been studying [paste a brief summary of what you
worked on recently, or describe your understanding so far].
```

That's a short prompt. But watch what the AI does with it. It already knows your topic, your level, your weak areas, your quiz format, your constraints, because it read CLAUDE.md before you typed a word. The output should be:

- 10 questions weighted toward your weak areas (not random coverage)
- 4 options per question, correct answer marked
- 2-sentence explanations addressing why wrong answers are tempting
- Conceptual questions, not memorization (your constraint working)
- No unsolicited study tips (your "What NOT to Do" working)

Compare this to Session 1 in Chapter 1, where you typed everything into a single prompt. Same AI. But now the context is persistent — you wrote it once, and it applies every time you open this folder.

**Step 3: Close and reopen.**

Close Claude Code. Open it again in the same folder.

```
claude
```

Type: "Quiz me on what we covered last time."

The AI reads CLAUDE.md again. Your topic, level, constraints are all there. But here's what it CAN'T do: it doesn't know what "last time" was. It doesn't know your score. It doesn't know which questions you got wrong.

CLAUDE.md handles static context: who you are, how you want to work. It doesn't handle dynamic data: what happened in each session. That's what state files do. That's Chapter 5.

But notice how much better this already is. You didn't re-explain your topic. You didn't re-type your format preferences. You didn't remind the AI about your constraints. The CLAUDE.md file handled all of that automatically. The manual overhead from Chapter 2's sessions just dropped dramatically.

---

## Extend It: Three More Systems

The project instructions pattern works for any system. Same concept, different folder, different CLAUDE.md.

### Job Hunting System

```
mkdir ../../job-hunting
cd ../../job-hunting
```

Create `CLAUDE.md`:

```markdown
# Job Hunting System

## Who I Am
I'm a [YOUR ROLE — e.g., product manager with 7 years in B2B SaaS].
My strongest achievements:
- [ACHIEVEMENT 1 — quantified]
- [ACHIEVEMENT 2 — quantified]
- [ACHIEVEMENT 3 — quantified]

I'm targeting [ROLE TYPE — e.g., Senior PM at growth-stage startups].

## When I Paste a Job Posting
Produce:
1. 5 tailored resume bullet points (action verb + quantified result)
2. A cover letter (under 400 words) that names the company, references
   something specific about them, and connects my experience to their needs
3. 3 likely interview questions with talking points from my experience

## What NOT to Do
- Never invent experience, projects, or metrics I didn't provide
- Don't use "passionate about" or "excited to join." Find specific reasons
- Don't write generic cover letters that could apply to any company
- If the role requires skills I haven't listed, flag it. Don't fabricate
```

Run Claude Code in this folder, paste a real job posting, and watch. The AI already knows your career, your achievements, your constraints. You typed a job URL. It produced tailored output. But close the session. It won't remember which jobs you've applied to, which resume version you sent where, or what got callbacks.

### Project Management System

Create `project-mgmt/CLAUDE.md`:

```markdown
# Project Management System

## Who I Am
I'm [YOUR ROLE] managing [PROJECT NAME].
Team: [WHO'S INVOLVED].
Deadline: [DATE].

## When I Give a Status Update
Produce:
1. Task breakdown: each task with owner, dependency, estimated
   duration, and status
2. Critical path: which tasks must finish before others can start
3. Risk flags: anything that could delay the deadline, with a
   one-sentence mitigation

## What NOT to Do
- Don't assume resources or team members I haven't mentioned
- Don't create optimistic timelines. If dependencies make a
  deadline impossible, say so
- Flag anything that depends on people or systems outside our control
```

### Content System

Create `content/CLAUDE.md`:

```markdown
# Content System

## Who I Am
I write [WHAT, e.g. blog posts, newsletters] for [AUDIENCE].
My tone is [DESCRIBE, e.g. conversational but informed, like
explaining something to a smart friend over coffee].

## When I Give a Topic
Produce an 800-word blog post with:
- A hook in the first sentence (not "In today's world...")
- A clear argument that builds (not a listicle)
- One specific example or story
- A close that gives the reader something to do or think about

## What NOT to Do
- Never use: "leverage," "utilize," "delve," "ecosystem,"
  "game-changing," "in today's rapidly evolving landscape"
- Don't hedge with "it might" or "could potentially"
- No numbered lists as the main structure
- Don't write in your voice. Write in mine (see my tone above)
```

---

## What You Built

One root file. Four system files. Five CLAUDE.md files total, and the AI reads the right combination automatically based on where you're working.

```
my-ai-systems/
├── CLAUDE.md              ← YOUR shared rules (applies everywhere)
├── study-system/
│   └── CLAUDE.md          ← study-specific: topic, level, quiz format
├── job-hunting/
│   └── CLAUDE.md          ← job-specific: career, achievements, constraints
├── project-mgmt/
│   └── CLAUDE.md          ← pm-specific: project, team, deadline
└── content/
    └── CLAUDE.md          ← content-specific: audience, tone, banned words
```

When you work in `study-system/`, the AI loads root CLAUDE.md (who you are, shared rules) PLUS `study-system/CLAUDE.md` (your topic, quiz format). When you switch to `job-hunting/`, it loads root PLUS `job-hunting/CLAUDE.md`. Same shared foundation, different system context. You wrote your name and shared rules once. They apply everywhere.

This is how scoped context works: general rules at the root, specific rules in the subfolder. It's the same pattern in every tool. Claude Code reads CLAUDE.md files up the directory tree, Codex does the same with AGENTS.md, Cursor with .cursorrules. Learn it once, use it anywhere.

![System v1: Structured prompts with auto-loaded context](../diagrams/png/ch04-system-v1.png)

*Your system after Chapter 4 — structured prompts load automatically, but there's no feedback arrow yet.*

Here's what your system looks like:

```
[Your short prompt] + [Root CLAUDE.md + System CLAUDE.md auto-loaded] → [AI] → [Output]
```

Better than Act 1. The static context is handled at two levels. But there's still no feedback arrow. No memory of what happened last session. No state. The AI knows who you are and how each system should work, but not what you've done.

Chapter 5 adds the feedback loop.

---

## How to Know It's Clicking

Five checks:

**Folder check.** You have four folders in `my-ai-systems/`, each with a CLAUDE.md file. They're real files you can open, read, and edit.

**Auto-load check.** Open Claude Code in your Study System folder. Type a short prompt, "quiz me on [topic]." Verify: the AI follows your format (10 questions, 4 options, explanations) and constraints (no memorization questions, no unsolicited tips) WITHOUT you specifying them in the prompt. CLAUDE.md is doing its job.

**Portability check.** If you use a different AI tool, create the equivalent file (AGENTS.md for Codex/Kimi, .cursorrules for Cursor) with the same content. Same result, different filename.

**Break it on purpose.** Open Claude Code in a DIFFERENT folder, one without a CLAUDE.md. Ask for a study quiz. Watch the output: generic topic coverage, random format, no constraints. That's what "no project instructions" looks like. Now go back to your study-system folder and run the same prompt. The difference is the CLAUDE.md.

**Name the gap.** CLAUDE.md handles static context: who you are, how you work. What it can't handle: what happened last session, your quiz scores, your weak areas over time. You can explain why to someone: "The instructions file is like a job description. The state file, which we'll build next, is like the work log."
