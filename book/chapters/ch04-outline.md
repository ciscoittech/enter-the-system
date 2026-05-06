# Chapter 4: Structured Prompts — Your Systems Start Here

**Title**: Structured Prompts — Your Systems Start Here
**Word target**: 3,500-4,500 words
**Component introduced**: Prompt (4-part formula)
**Primary system**: Study System (deep build)
**Other systems**: Job Hunting, Project Management, Content (v1 prompts, shorter)

---

## Bridge from Act 1

The reader finished Act 1 with:
- 4 concepts (Instruction, Memory, Control, Flow)
- 3 patterns (Loop, Gate, Router)
- 5 manual study sessions (each better, each more work)
- A napkin sketch of the system they want to build
- Motivation: manual doesn't scale

Ch 4 is where they stop reading about systems and start BUILDING one. This is the first time they open a terminal.

---

## Section 1: Why the Terminal (~500 words)

**Narrative beat**: Address the elephant — "you're asking me to open a terminal?" Make it feel welcoming, not intimidating.

**Content**:
- You just spent 3 chapters learning to see systems. Now you need to build one. And to build a system, you need to see its parts — the files, the folders, the state that carries forward.
- GUIs are great for using tools. But you're not using a tool — you're building a system. In a GUI, state files are hidden behind menus. Skill files are "settings" somewhere. Hooks are invisible. In the terminal, everything is a file you can see, edit, and understand.
- "Think of it like cooking. You could use a meal-kit service that pre-measures everything and hides the recipe. Or you could stand in the kitchen with the ingredients visible, the recipe on the counter, and understand what you're making. This book is the kitchen."
- **Setup instructions** (brief, not a tutorial):
  - Install Warp Terminal (warp.dev — free, open-source) or use any terminal
  - Install Claude Code (`npm install -g @anthropic-ai/claude-code`) or equivalent
  - "If you prefer a graphical interface: everything in this book works in Cowork, VS Code with Claude extension, or Cursor. The files you create are the same. Only the way you interact changes."
- Create a project folder for your systems: `mkdir my-ai-systems && cd my-ai-systems`
- Open Claude Code: `claude`
- Give it folder access. You're in.

**Tone**: Encouraging. "If you've never opened a terminal, that's fine. By the end of this section, you'll have typed 3 commands and you'll be building."

---

## Section 2: The Problem — Prompts Without Structure (~300 words)

**Bridge**: You've been here before. Session 1 in Chapter 1 — "Quiz me on the key concepts." It worked, but it was vague. The AI decided what to quiz you on, how hard, what format. Now you're going to fix that — with structure.

**The 4-part formula** (quick reminder — they saw this in Ch 2's Session 3):
- **Context**: Who you are, what you're working on, your level
- **Input**: What the AI should read or work with
- **Output**: Exactly what the finished work looks like
- **Constraints**: What NOT to do

**Reference the eval**: "We tested this formally — same AI, same topic, vague prompt versus structured prompt. Vague: 11/20. Structured: 20/20. Every run. (Full eval in the research section.)"

---

## Section 3: Deep Build — Study System v1 (~1,200 words)

**Components Used**: `[Prompt]`
**New this chapter**: `[Prompt]`

**Step by step** (terminal commands + file creation):

1. **Create the project folder**:
   ```
   mkdir study-system && cd study-system
   ```

2. **Create the prompt file** — a real file the reader writes and saves:
   ```
   Create a file called `study-prompt.md`
   ```
   
   Full prompt content shown inline — the 4-part formula applied to studying:
   - Context: topic, current level, goal
   - Input: notes or "my understanding so far is..."
   - Output: (1) key concept summary, (2) 10 quiz questions with 4 options each, (3) explanations for correct answers, (4) connections to prior concepts
   - Constraints: conceptual understanding not memorization, plain language, flag ambiguity

3. **Run it**: Show the reader typing `claude` and pasting/referencing the prompt. Describe what the AI does (reads the prompt, generates output). Show abbreviated sample output (3 of 10 questions, like Ch 1 but better-structured).

4. **What to notice**: The output is better than Session 1. Questions are targeted. Format is consistent. Constraints are followed. This is the structured prompt advantage.

5. **Run it again tomorrow**: New session. The AI doesn't remember today. Same gap as Session 2 in Ch 1 — but now they KNOW why (Memory is missing) and they have a napkin sketch showing where state goes.

**Connect to the eval**: "In our testing, this structured approach scored 20/20 while the vague version scored 11/20. You should see a similar jump."

---

## Section 4: Extend — Three More v1 Systems (~800 words)

Shorter walkthroughs — each gets a prompt file and a brief description of what it produces. NOT full deep builds.

**Job Hunting v1** (~250 words):
- Create `job-hunting/job-prompt.md`
- 4-part formula: Context (career background, target role type), Input (paste a job posting), Output (tailored resume bullet points + cover letter draft), Constraints (never invent experience, keep under 400 words)
- Run it. Decent output. But next application, you re-explain everything.

**Project Management v1** (~250 words):
- Create `project-mgmt/pm-prompt.md`
- 4-part formula: Context (project name, your role, team), Input (project goal + current status), Output (task breakdown with owners, dependencies, timeline), Constraints (don't assume resources, flag risks)
- Run it. Good task list. Next week, it doesn't know what's done.

**Content v1** (~250 words):
- Create `content/content-prompt.md`
- 4-part formula: Context (who you write for, what platform), Input (topic + angle), Output (800-word blog post with hook, body, close), Constraints (no AI-isms — list the banned words from the voice rules)
- Run it. Readable draft. But it doesn't know your voice, and post #2 sounds nothing like post #1.

**The pattern**: Same 4-part formula, four different domains. Structure works everywhere. But four one-shot systems, all missing memory.

---

## Section 5: System Diagram + What's Missing (~200 words)

Show the diagram: `[Input] → [Structured Prompt] → [AI] → [Output]`

No feedback arrow. Point out: "You built four v1 systems. Each works for one session. None of them remember. That's what Chapter 5 fixes — the feedback loop."

Reference the Mermaid diagram: `book/diagrams/png/ch04-prompt-system.png` (to be created).

---

## Section 6: Quality Gate (~200 words)

**3-5 concrete checks**:

1. You have 4 folders in `my-ai-systems/` — one per system, each with a prompt file
2. Running any prompt produces output that follows the requested format (4 options per quiz question, task breakdown with owners, etc.)
3. The structured prompt produces noticeably better output than the vague version you used in Ch 1 Session 1
4. **Break it on purpose**: Run the Study System prompt again in a fresh session without changing it. Verify: the AI doesn't reference yesterday's results, doesn't know your weak areas, re-covers the same topics. This is the gap — and you can name it: "No state. No memory."
5. You can explain to someone why a structured prompt is better than a vague one, AND why it's still not a system

---

## Technical Notes for the Writer

- **First terminal chapter**: Assume zero terminal experience. Show EVERY command, explain what it does.
- **File creation**: Show the full file content inline. The reader creates real `.md` files they'll use in future chapters.
- **Prompt file as a file, not a paste**: This is different from Act 1 where they pasted prompts into a chat. Here, prompts are files they save and reuse. This is a key concept — the prompt is now a system component, not a disposable message.
- **Voice**: Same casual voice as Act 1. Don't switch to "tutorial mode" — the reader is the same person, just with a new tool.
- **CLI alternative note**: One paragraph at the top acknowledging GUI options. Then CLI for the rest. Don't keep apologizing for the terminal.
- **Reference back to Act 1**: "Remember Session 3 where the structured prompt made everything better? Same formula, real files this time."
- **Reference forward (teaser only)**: "Chapter 5 adds the feedback loop — a state file that carries your progress forward."
