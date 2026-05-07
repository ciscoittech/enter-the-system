# Appendix D: Glossary

Plain-language definitions. One sentence each. No jargon in the definitions.

*Populated as terms are introduced in chapters.*

---

## Universal Concepts (Act 1)

**Instruction** — What you tell the AI to do, and how precisely you tell it.

**Memory** — Anything that persists between sessions — files, logs, trackers that carry context forward.

**Control** — Checks, rules, and constraints that catch mistakes before they reach you.

**Flow** — Multi-step sequences where each stage's output feeds the next.

## Design Patterns (Ch 3)

**Loop** — A pattern where the system processes, checks, improves, and repeats until the output is good enough.

**Gate** — A checkpoint between stages that decides "continue" or "go back and fix it."

**Router** — A decision point where the system chooses a different process based on what it sees in the input.

**Napkin Test** — If you can't sketch your system on a napkin, it's too complicated.

## Implementation Components (Act 2)

**Prompt** — A structured request with four parts: Context, Input, Output, Constraints. Saved as a file, not pasted into a chat.

**State** — A file the system reads at the start of every session and writes to at the end. Carries forward what happened — scores, decisions, progress, what's next.

**Skill** — A reusable knowledge document loaded before the AI works. Contains rules, examples, and expertise for a specific domain.

**Hook** — An automated check that runs before or after the AI acts. Catches errors, enforces rules, refuses to let bad output through.

**Connection** — A way for the AI to reach outside your local files — web search, plugins for other tools, APIs.

**Pipeline** — A multi-stage workflow where each stage has entry criteria, exit criteria, and a quality gate between stages.

## Tools (Act 2)

**Terminal** — A text-based window where you type commands and see results. Where you build and run your systems.

**Warp** — A free, open-source terminal recommended in this book. Supports Claude Code, Codex, Kimi CLI, and other AI tools.

**Claude Code** — Anthropic's AI tool that runs in the terminal. The primary tool used in this book's examples.

**CLI** — Command Line Interface. Working in the terminal by typing commands instead of clicking buttons.

**MCP Server** — A plugin that gives your AI tool access to another service (Google Drive, Notion, databases, etc.).

## Architecture (Act 2)

**Validation Layer** — The collection of hooks that sit between the AI's output and your use of it. Each hook checks one thing. The layer checks everything.

**Workflow Engine** — Your project folder, functioning as an automation system. Skills provide knowledge, hooks provide checks, commands define workflows, state files track progress. Same concept as n8n or Zapier, built from files instead of a GUI.

**Agent** — An AI that follows a plan, uses tools, checks its own work, and produces results across multiple steps without you guiding each one. Your pipeline commands turn Claude into an agent.

**Subagent** — A separate, focused AI session that handles one stage of a pipeline. Loads only the context it needs, does its job, saves the result, and exits. Like n8n's "Execute Sub-Workflow" node.

**Orchestrator** — The main session that manages a pipeline's overall flow, delegating individual stages to subagents when needed.

**.claude/ directory** — The engine room of your system. Contains three folders (skills, hooks, commands) and one config file (settings.json). Together they make a chat into a workflow engine.

**settings.json** — The control plane of your workflow engine. Registers hooks, sets permissions, configures connections. Lives at `.claude/settings.json`.

## Other Terms

**Deep Agents CLI** — LangChain's open-source terminal agent. Model-agnostic alternative to Claude Code. Uses `AGENTS.md` instead of `CLAUDE.md`, `.deepagents/` instead of `.claude/`. See Appendix F.

**DeepSeek V4 Flash** — A fast, cheap AI model ($0.14/M input tokens). Works with Deep Agents CLI for a fully open-source, low-cost stack. Handles most tasks in this book well; switch to a stronger model for complex reasoning.

**CLAUDE.md** — A project instructions file that loads automatically every session. The persistent context that tells the AI who you are, what you're building, and how to work. Called AGENTS.md in Codex/Kimi, .cursorrules in Cursor.

**Frontmatter** — The YAML metadata at the top of a skill file (between `---` markers). Contains the name and description the AI uses to decide when to load the skill.

**Exit Criteria** — The conditions that must be true for a pipeline stage to be done. What makes a pipeline different from a to-do list.

**Quality Gate** — A check between pipeline stages that decides "continue" or "rework." The Gate pattern from Chapter 3, implemented as part of a pipeline.
