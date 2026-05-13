# Chapter 4: Structured Prompts. Your Systems Start Here

Remember that career decision from Chapter 1? The one where four conversations produced zero accumulation — your manager, your friend, the recruiter, and the ceiling at 1am all operating in isolation? You diagnosed exactly what was missing: no memory carrying forward, no quality checks, no staged process. You could see the broken system.

Then in Chapter 2, you felt it break in real time. Five study sessions, each one better than the last, each one requiring more manual work from you. By Session 5 you were the memory, the quality control, and the workflow manager. The AI's contribution was shrinking while yours was growing. In Chapter 3 you learned the shapes — Loop, Gate, Router — and sketched the system on paper.

You have the thinking. Now you need the machinery.

This is where the book shifts, and it's going to feel like a big jump. Act 1 was universal. Any AI tool, any situation, pen and paper if you wanted. Act 2 is specific. You're going to open a terminal, create files, and build real systems that run without you managing every piece by hand. The concepts are the same four you already know. The difference is that the computer handles them instead of you.

We're starting with the Study System because it's the simplest to wire up — one topic, one user, clear right-and-wrong answers. Your job search, your project management, your content pipeline: those get their builds in the chapters ahead, and they'll go faster because you'll already know how the pieces connect. The first tool isn't what you'd expect. It's not a prompt you type. It's a file you write once that tells the AI who you are, what you're building, and how to work. A file that loads automatically every time you start a session, so you never re-explain yourself again.

---

## Opening the Kitchen

You're about to open a terminal. If you've never done that before, this section takes about five minutes. If you have, skip to the next section.

A terminal is a text-based window where you type commands and see results. That's it. The reason this book uses a terminal instead of a graphical interface is the same reason cooking shows use kitchens instead of vending machines: you need to see what you're making. In a graphical tool, your instruction files are hidden behind menus. Your state files are "settings" somewhere. Your hooks are invisible. In the terminal, everything is a file in a folder you can see, open, and understand.

Here's what to install:

**A terminal.** If you're on a Mac, you already have one (it's called Terminal, in Applications/Utilities). But I recommend Warp. It's free, open-source, and designed for working with AI tools. Download it at warp.dev. On Windows, use Windows Terminal or Warp. On Linux, you already know what a terminal is.

**An AI CLI tool.** This book shows Claude Code, but the patterns work in OpenAI's Codex, Kimi CLI, or any AI tool that runs in the terminal. Anthropic even publishes pre-built plugins (collections of skills, commands, and connections bundled for specific roles like sales or marketing) — but those are opinionated kits for one ecosystem. This book teaches you the skills to build your own, for any tool. Install Claude Code by typing:

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

Now, the most important file in any AI project. It goes right here, in the root folder.

**A quick note on how context works.** Claude Code reads CLAUDE.md files by walking up the directory tree from wherever you're working. If you're in `my-ai-systems/study-system/`, it loads the CLAUDE.md in `study-system/` AND the CLAUDE.md in the parent `my-ai-systems/` folder. They stack: root first, then the subfolder.

What does that mean in practice? Put shared rules in the root — your name, your general preferences, "never fabricate data." Put system-specific context in each subfolder — your study topic, your career history, your project team. General rules at the top, specific rules deeper down.

This isn't a Claude Code quirk. Every AI tool with project instructions works this way. And it matters here because you're about to build four systems. They'll share some context (who you are, how you like to work) and differ on the rest (what each system does). One root file. Four system-specific files. The AI sees all of them.

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

Your systems will share some things — your name, your preferences, "never make things up." That shared context lives in one file at the root, so you write it once instead of four times.

Create a new file called `CLAUDE.md` in your `my-ai-systems/` folder (any text editor works — VS Code, Notepad, TextEdit):

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

Now for the file that makes this folder a system instead of an empty directory. Create `study-system/CLAUDE.md` — this is where you put everything specific to studying: your topic, your level, your quiz preferences. When you work here, the AI reads BOTH files: the shared root (who you are) and this one (what you're studying). Two layers of context, loaded automatically.

Replace the brackets with your real information:

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

Save it. That's your first system component — a file that exists on disk, not a prompt that disappears when you close the window.

**Step 3: Launch the AI and see what happens.**

In your terminal, from the `study-system/` folder:

```
claude
```

Here's the moment that changes everything. You didn't paste anything. You didn't reference the file. Claude Code found your folder, read both CLAUDE.md files (root + study-system), and loaded all of that context before you typed a word. Every session, automatically.

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

**Step 4: Close and reopen.**

Close Claude Code. Open it again in the same folder. Type: "Quiz me on what we covered last time."

The AI reads CLAUDE.md again — topic, level, constraints, all there. But here's the wall: it doesn't know what "last time" was. It doesn't know your score. It doesn't know which questions you got wrong. That's the same amnesia from Chapter 1, just smaller. CLAUDE.md handles who you are. It can't handle what happened.

Still — notice how much less work you did. No re-explaining your topic. No re-typing your format preferences. No reminding the AI about your constraints. All of that loaded automatically. The manual overhead from Chapter 2's sessions just collapsed. What's left is the dynamic part: session history, scores, weak areas. That's what state files handle. That's Chapter 5.

---

## Extend It: Three More Systems

The project instructions pattern works for any system. Same concept, different folder, different CLAUDE.md. Create each folder (`mkdir job-hunting`, etc.) and add a CLAUDE.md inside it, the same way you did for the Study System.

Here's what changes in each:

| System | Folder | What the CLAUDE.md defines | Key constraint |
|--------|--------|---------------------------|----------------|
| **Job Hunting** | `job-hunting/` | Your role, quantified achievements, target positions. When you paste a job posting, it produces tailored bullets, a cover letter, and interview prep | Never invent experience or metrics you didn't provide |
| **Project Mgmt** | `project-mgmt/` | Your project, team, deadline. When you give a status update, it produces task breakdowns, critical path, and risk flags | Don't create optimistic timelines — if dependencies make a deadline impossible, say so |
| **Content** | `content/` | Your audience, tone, format. When you give a topic, it produces a post in your voice with your structure rules | Don't write in the AI's voice — write in yours |

Each CLAUDE.md follows the same three-section structure you used for the Study System: **Who I Am** (your context), **When I [do X]** (what the AI should produce), and **What NOT to Do** (your constraints). Fill in your real information. The templates are in Appendix B if you want the full versions to copy from.

The same gap exists in all four systems: close the session and the AI forgets what happened. It knows who you are, but not what you've done.

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
