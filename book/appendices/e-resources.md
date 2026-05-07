# Appendix E: Resources

## CLI Tools

| Tool | What It Is | URL |
|------|-----------|-----|
| **Warp Terminal** | Free, open-source terminal. Supports all AI CLI tools. Recommended in this book. | warp.dev |
| **Claude Code** | Anthropic's AI CLI tool. Primary tool in this book's examples. | code.claude.com |
| **OpenAI Codex** | OpenAI's CLI agent. Same patterns as Claude Code. | developers.openai.com/codex |
| **Kimi CLI** | Moonshot AI's open-source CLI. Apache 2.0 license. | moonshotai.github.io/kimi-cli |
| **Deep Agents CLI** | LangChain's open-source agent CLI. Model-agnostic (works with DeepSeek, Claude, OpenAI, local models). Full open-source stack. See Appendix F for setup. | docs.langchain.com/oss/python/deepagents/cli/overview |
| **DeepSeek** | Fast, cheap AI models. V4 Flash at $0.14/M input tokens. | platform.deepseek.com |

## GUI Alternatives

| Tool | What It Is | When to Use |
|------|-----------|-------------|
| **Claude Cowork** | Claude's desktop app with plan-approve-execute flow | If you prefer graphical interfaces |
| **Claude Code VS Code Extension** | Claude Code inside VS Code with graphical panel | If you already use VS Code |
| **Cursor** | VS Code fork with deep AI integration | If you want an AI-first IDE |

## Official Documentation

| Resource | What It Covers |
|----------|---------------|
| Claude Code docs (code.claude.com/docs) | CLAUDE.md, skills, hooks, commands, settings |
| Anthropic cookbook (github.com/anthropics) | Example projects and patterns |
| OpenAI Codex docs | Codex CLI setup, usage, capabilities |

## Agentic Workflows and Agent Patterns

| Resource | What It Covers |
|----------|---------------|
| Anthropic — Building Effective Agents (docs.anthropic.com/en/docs/build-with-claude/agentic-patterns) | Orchestrator-worker, routing, evaluation patterns. The production architecture behind Chapter 10. |
| Claude Code documentation (docs.anthropic.com/en/docs/claude-code) | Agent tool, subagents, practical usage for building multi-stage workflows. |
| n8n AI Workflows (n8n.io/ai) | Visual workflow builder with AI agent nodes. Good for seeing the same patterns from this book in a drag-and-drop interface. |

## Systems Thinking

| Resource | Why It Matters |
|----------|---------------|
| Donella Meadows — *Thinking in Systems* | The foundational text on systems thinking. Stocks, flows, feedback loops, leverage points. This book translates these concepts for AI systems. |
| Eliyahu Goldratt — *The Goal* | Theory of Constraints. Your system is only as fast as its weakest stage. The pipeline bottleneck concept in Ch 11 comes from here. |

## This Book's Research

| Resource | What It Contains |
|----------|-----------------|
| GitHub: ciscoittech/prompt-to-pipeline | Full book source, research, eval notebooks, production system evidence |
| research/METHODOLOGY.md | How we evaluate prompts and systems |
| research/evals/notebooks/ | Jupyter notebooks — run them yourself |
| research/systems/ | 3 production systems genericized as evidence |

## Community

*AI tools evolve fast. Rather than listing URLs that may change, here's what to search for:*

- "Claude Code examples" — community projects and workflows
- "AI CLI tools comparison 2026" — current landscape
- "MCP servers directory" — available plugins for connecting tools
- "Warp terminal agents" — how Warp integrates with AI CLI tools

*Note: Community resources change frequently. Search by name for the most current version rather than relying on saved links.*
