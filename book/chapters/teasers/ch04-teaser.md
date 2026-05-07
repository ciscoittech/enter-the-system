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

---

*This is a preview. The full chapter continues with building your first CLAUDE.md file, creating system-specific instruction files for the Study System, and running your first AI session where the system remembers who you are without you typing a word.*

**[Read the full book →](https://frontierengineering.dev/book)**

---

**What you'll build in this chapter:**
- A root instruction file that loads automatically every session, so you never re-explain yourself again
- A Study System v1 with structured prompts that produce consistent, focused output
- Your first working AI system — files in a folder, not prompts in a chat window

**Free preview:** [Act 1 (Chapters 1-3)](../ch01-draft.md) is free — start there.
