# Ch 8: Connections Research — MCP Servers in Claude Code

**Researched**: 2026-05-06
**Sources**: Anthropic official docs (code.claude.com/docs/en/mcp, /tools, /settings, /debug-your-config, /troubleshooting, /env-vars), MCP spec site (modelcontextprotocol.io), MCP servers registry (GitHub + Anthropic API registry)

---

## How It Actually Works

MCP (Model Context Protocol) is an open standard for connecting AI tools to external systems. Anthropic's own analogy: "USB-C for AI applications." One standardized plug, many different devices.

**The architecture is client-server:**
- Claude Code is the **host** (the AI application)
- For each configured MCP server, Claude Code creates a **client** that maintains a dedicated connection
- Each **server** exposes tools, resources, and/or prompts that Claude can use

**Two transport mechanisms:**
1. **stdio** — Server runs as a local process on your machine. Claude Code launches it, talks to it via stdin/stdout. No network. Best for tools that need local file access or custom scripts.
2. **Streamable HTTP** (also called "http") — Server runs remotely. Claude Code connects over HTTPS. Best for cloud services (Notion, Sentry, GitHub, Stripe, etc.). Supports OAuth authentication.
3. **SSE** (Server-Sent Events) — Deprecated. Still works but docs say "use HTTP instead."

**What MCP servers provide (three primitives):**
- **Tools**: Actions Claude can take (query a database, create a Jira issue, fetch weather)
- **Resources**: Data Claude can read (file contents, database schemas, API responses) — referenced with `@server:protocol://path` syntax
- **Prompts**: Reusable templates exposed as `/mcp__servername__promptname` commands

**Key insight for the chapter**: Claude Code already has built-in WebSearch and WebFetch tools that work without any MCP configuration. MCP is for connecting to *specific* external systems the reader already uses (their project tracker, their database, their design tool, their CRM).

---

## Built-in vs. External Connections

### Built-in (no setup required)

| Tool | What It Does | Permission Required |
|------|-------------|-------------------|
| `WebSearch` | Performs web searches | Yes (auto-approved or ask) |
| `WebFetch` | Fetches content from a URL, converts HTML to markdown | Yes |
| `Read` | Reads local files | No |
| `Glob` | Finds files by pattern | No |
| `Grep` | Searches file contents | No |
| `Bash` | Runs shell commands (can curl APIs, run scripts, etc.) | Yes |

These are NOT MCP servers. They're built-in tools that ship with Claude Code. The reader does not need to install anything for basic web search or file access.

### External (MCP servers — requires setup)

Two categories:

**Remote HTTP servers (easiest setup — one command):**
- Notion, Sentry, Stripe, PayPal, GitHub, Figma, Supabase, Slack, Linear, Vercel, Cloudflare, monday.com, Atlassian (Jira/Confluence), Amplitude, HubSpot, Wix, and many more
- Most use OAuth — you run `/mcp` in Claude Code, authenticate in your browser, done
- No Node.js or Docker required

**Local stdio servers (need Node.js or Python):**
- Filesystem (official), Git (official), Memory (knowledge graph), Sequential Thinking, Fetch, Time
- PostgreSQL via @bytebase/dbhub
- Airtable, Playwright (browser testing)
- Custom servers you build yourself
- Require `npx` (Node.js) or `uvx`/`pip` (Python) to run

---

## settings.json Format — The Exact Configuration

### Method 1: CLI command (recommended for readers)

```bash
# Remote HTTP server (most common)
claude mcp add --transport http notion https://mcp.notion.com/mcp

# Remote HTTP with auth header
claude mcp add --transport http github https://api.githubcopilot.com/mcp/ \
  --header "Authorization: Bearer YOUR_GITHUB_PAT"

# Local stdio server
claude mcp add --transport stdio airtable \
  --env AIRTABLE_API_KEY=YOUR_KEY \
  -- npx -y airtable-mcp-server

# List all configured servers
claude mcp list

# Check status inside Claude Code
/mcp

# Remove a server
claude mcp remove notion
```

**Important option ordering**: All flags (`--transport`, `--env`, `--scope`, `--header`) must come BEFORE the server name. The `--` separates the name from the command/args.

### Method 2: JSON config (for sharing with team)

```bash
claude mcp add-json weather-api '{"type":"http","url":"https://api.weather.com/mcp","headers":{"Authorization":"Bearer token"}}'

claude mcp add-json local-db '{"type":"stdio","command":"/path/to/server","args":["--port","8080"],"env":{"DB_URL":"postgresql://..."}}'
```

### Where configurations are stored

| Scope | Stored In | Who Sees It | Use Case |
|-------|-----------|-------------|----------|
| **Local** (default) | `~/.claude.json` under project path | Just you, this project only | Personal dev servers, experiments |
| **Project** | `.mcp.json` in project root | Everyone on the team (committed to git) | Shared team tools |
| **User** | `~/.claude.json` (global section) | Just you, all projects | Personal utilities across projects |

**Local scope JSON example** (what `~/.claude.json` looks like after adding a server):

```json
{
  "projects": {
    "/path/to/your/project": {
      "mcpServers": {
        "stripe": {
          "type": "http",
          "url": "https://mcp.stripe.com"
        }
      }
    }
  }
}
```

**Project scope JSON example** (`.mcp.json` at project root, committed to git):

```json
{
  "mcpServers": {
    "shared-server": {
      "command": "/path/to/server",
      "args": [],
      "env": {}
    }
  }
}
```

**Environment variable expansion in `.mcp.json`** (keeps secrets out of git):

```json
{
  "mcpServers": {
    "api-server": {
      "type": "http",
      "url": "${API_BASE_URL:-https://api.example.com}/mcp",
      "headers": {
        "Authorization": "Bearer ${API_KEY}"
      }
    }
  }
}
```

---

## Setup Walkthrough — First Connection for a Non-Technical Reader

### Simplest path: Remote HTTP server (no installs needed)

**Example: Connect to Notion**

1. Open your terminal
2. Run: `claude mcp add --transport http notion https://mcp.notion.com/mcp`
3. Start Claude Code: `claude`
4. Type `/mcp` — you'll see Notion listed, possibly needing authentication
5. Follow the browser login flow (OAuth — Claude opens your browser, you log in to Notion, done)
6. Now ask Claude: "What's in my Notion workspace?" or "Find the meeting notes from last Tuesday"

**That's it.** One command to add, one command to authenticate. No Node.js, no Docker, no config files to edit.

### Second simplest: Local stdio server (needs Node.js)

**Example: Connect to a PostgreSQL database**

1. Prerequisite: Node.js installed (`node --version` to check)
2. Run: `claude mcp add --transport stdio db -- npx -y @bytebase/dbhub --dsn "postgresql://user:pass@host:5432/mydb"`
3. Start Claude Code
4. Ask Claude: "Show me the schema for the orders table" or "What's our total revenue this month?"

**The `npx -y` pattern**: `npx` downloads and runs an npm package without installing it globally. The `-y` flag auto-confirms. This is how most local MCP servers are launched.

### What the reader needs installed

| Transport | Prerequisites |
|-----------|--------------|
| HTTP (remote) | Nothing extra. Just Claude Code. |
| stdio (npm servers) | Node.js (includes `npx`) |
| stdio (Python servers) | Python 3.10+ with `uvx` or `pip` |

---

## Authentication Patterns

### OAuth (most remote servers)

1. Add the server: `claude mcp add --transport http sentry https://mcp.sentry.dev/mcp`
2. In Claude Code, run `/mcp`
3. Browser opens, you log in to the service
4. Tokens stored securely, refreshed automatically
5. To revoke: use "Clear authentication" in `/mcp` menu

### API Key / Bearer Token

```bash
claude mcp add --transport http github https://api.githubcopilot.com/mcp/ \
  --header "Authorization: Bearer YOUR_GITHUB_PAT"
```

### Environment Variables (for stdio servers)

```bash
claude mcp add --transport stdio airtable \
  --env AIRTABLE_API_KEY=your_key_here \
  -- npx -y airtable-mcp-server
```

### Claude.ai Connectors (auto-sync)

If you've configured MCP servers in Claude.ai (the web app), they automatically appear in Claude Code too. No extra setup.

---

## What Works Well

1. **Remote HTTP servers are genuinely easy.** One `claude mcp add` command, browser OAuth flow, done. No package managers, no config files.

2. **Tool Search is smart about context.** MCP tools are deferred by default (only tool names loaded at startup). Claude searches for relevant tools when needed. This means adding 10 MCP servers doesn't bloat your context window.

3. **Auto-reconnection for remote servers.** If an HTTP/SSE server disconnects, Claude Code retries with exponential backoff (up to 5 attempts, 1s -> 2s -> 4s -> 8s -> 16s). The server shows as "pending" in `/mcp` during reconnection.

4. **`/mcp` panel is the diagnostic hub.** Shows tool count per server, flags servers with zero tools, allows reconnection, authentication, and removal.

5. **`/doctor` catches config problems.** Automated check of installation, settings, MCP servers, and context usage.

6. **Import from Claude Desktop.** If you already configured MCP servers in Claude Desktop: `claude mcp add-from-claude-desktop` imports them.

7. **Dynamic tool updates.** MCP servers can add/remove tools at runtime via `list_changed` notifications. Claude Code picks up changes without reconnecting.

8. **Resources via @ mentions.** Type `@` to see available MCP resources alongside files. Reference them naturally: `@github:issue://123` or `@postgres:schema://users`.

---

## What Breaks / Gotchas

### Configuration gotchas

1. **`.mcp.json` goes at project ROOT, not inside `.claude/`.** Common mistake. It won't load from `.claude/.mcp.json`.

2. **Project-scoped servers require one-time approval.** If the reader dismisses the approval prompt, the server stays disabled. Fix: run `/mcp` and approve manually.

3. **Relative paths in `command` or `args` break.** They resolve against the directory you launched Claude Code from, not the `.mcp.json` location. Use absolute paths for local scripts. `npx` and `uvx` on PATH work fine.

4. **Environment variables in `settings.json` `env` do NOT propagate to MCP child processes.** Set per-server `env` inside `.mcp.json` instead.

5. **Option ordering matters.** All flags must come before the server name:
   - Correct: `claude mcp add --transport stdio --env KEY=val myserver -- npx server`
   - Wrong: `claude mcp add myserver --transport stdio -- npx server`

6. **The server name `workspace` is reserved.** Claude Code skips it and shows a warning.

7. **If a required environment variable is missing and has no default, `.mcp.json` fails to parse.** The reader won't see a helpful error — just that the server didn't load.

### Connection failures

1. **stdio servers don't auto-reconnect.** They're local processes. If they crash, you need to restart Claude Code or reconnect from `/mcp`.

2. **HTTP servers retry on 5xx/timeout/connection-refused (up to 3 attempts on initial connect, 5 on mid-session disconnect).** But auth errors (401, 403) and not-found (404) are NOT retried — they need a config change.

3. **If browser redirect fails during OAuth**, paste the full callback URL from your browser's address bar into the URL prompt that appears in Claude Code.

4. **MCP_TIMEOUT controls startup timeout.** Default is unspecified in docs. Set `MCP_TIMEOUT=10000` (10 seconds) for slow-starting servers.

### Output limits

1. **Warning at 10,000 tokens output.** Configurable via `MAX_MCP_OUTPUT_TOKENS` env var.
2. **Default max is 25,000 tokens.** Large database queries or log files will be truncated or persisted to disk.
3. **Hard ceiling of 500,000 characters** for servers that declare `anthropic/maxResultSizeChars`.

### Security considerations

1. **Third-party MCP servers are NOT verified by Anthropic.** The docs explicitly warn: "Use third party MCP servers at your own risk."
2. **MCP servers that fetch untrusted content expose prompt injection risk.** The docs call this out specifically.
3. **`CLAUDE_CODE_MCP_ALLOWLIST_ENV=1`** spawns stdio servers with only a safe baseline environment (instead of inheriting your entire shell env). Good security hygiene.
4. **`headersHelper` executes arbitrary shell commands.** When defined at project scope, it only runs after you accept the workspace trust dialog.

---

## Community Patterns — What People Actually Use

### Most popular MCP server categories (from Anthropic's registry)

**Developer tools:** GitHub, Linear, Jira/Confluence (Atlassian Rovo), Sentry, Vercel, Supabase, Cloudflare
**Productivity:** Notion, Slack, Google Drive, Gmail, Google Calendar, monday.com
**Design:** Figma
**Business:** Stripe, PayPal, HubSpot, Close (CRM), Amplitude
**Data:** PostgreSQL (via dbhub), Airtable, Coupler.io
**AI/ML:** Hugging Face

### The "connection stack" pattern

Power users tend to configure:
1. One project management tool (Linear, Jira, or Notion)
2. One communication tool (Slack)
3. One code platform (GitHub)
4. One monitoring tool (Sentry)
5. Database access if applicable

### Scope strategy

- **User scope** for personal tools you use everywhere (Notion, Slack, GitHub)
- **Project scope** (`.mcp.json`) for team-shared tools (project database, project-specific APIs)
- **Local scope** for experiments and servers with personal credentials

---

## MCP Environment Variables Reference

| Variable | Purpose | Default |
|----------|---------|---------|
| `MCP_TIMEOUT` | Startup timeout for MCP servers (ms) | Unspecified (appears to be ~5s) |
| `MAX_MCP_OUTPUT_TOKENS` | Maximum tokens for MCP tool output | 25,000 |
| `ENABLE_TOOL_SEARCH` | Control tool search behavior: `true`, `false`, `auto`, `auto:N` | Enabled (all tools deferred) |
| `CLAUDE_CODE_MCP_ALLOWLIST_ENV` | Restrict env vars passed to stdio servers | Off (servers inherit shell env) |
| `ENABLE_CLAUDEAI_MCP_SERVERS` | Enable/disable claude.ai connector sync | true |
| `MCP_CONNECTION_NONBLOCKING` | Don't block startup waiting for MCP connections | 0 (blocking) |

---

## Managed/Enterprise MCP Configuration

Two enterprise options exist (relevant context but NOT for the book's audience):

1. **`managed-mcp.json`** — IT deploys a fixed set of servers. Users can't add/modify/remove.
2. **Allowlist/denylist** — Users can add servers, but restricted by name, command, or URL pattern.

---

## Implications for the Chapter

### What this means for Ch 8 (Connections)

1. **Lead with the built-in tools.** WebSearch and WebFetch are already there. The reader's system already has "connections" — this chapter shows them how to add MORE.

2. **Remote HTTP is the happy path.** For non-technical readers, `claude mcp add --transport http` + OAuth is dramatically simpler than stdio servers. Lead with Notion or Sentry as the first build.

3. **Don't teach MCP architecture.** The reader doesn't need to know about JSON-RPC, stdio transport internals, or the protocol spec. They need to know: "run this command, authenticate, ask Claude questions about your data."

4. **The `.mcp.json` file IS the system artifact.** Just like state files (Ch 5) and skills (Ch 7), the connection config is a file the reader creates and maintains. This fits the "systems thinking" throughline — connections are the component that lets the system reach outside itself.

5. **"Break it on purpose" quality gate ideas:**
   - Remove/rename the API key and watch it fail gracefully
   - Ask Claude something that requires the connection, then disconnect the server
   - Add a server with a wrong URL and see what `/mcp` shows

6. **Gotchas to warn readers about:**
   - `.mcp.json` at project root, NOT in `.claude/`
   - Project-scoped servers need approval (they'll get a prompt)
   - Relative paths break — use absolute paths or PATH-available commands
   - `npx` requires Node.js (mention once, clearly)

7. **The 4 throughline systems could use connections like this:**
   - **Study System**: Web search for research, maybe Google Drive for notes
   - **Job Hunting**: LinkedIn (if MCP exists), job boards, Google Calendar for interviews
   - **Project Management**: Linear/Notion/Jira for tasks, GitHub for code
   - **Content**: Notion for content calendar, social media APIs, analytics

8. **The "maintain it" section should cover:**
   - `/mcp` to check health
   - What to do when tokens expire (re-authenticate via `/mcp`)
   - Removing servers you no longer use
   - Checking output limits if database queries are getting truncated

### Simplest possible first connection for the book

**Recommended first build:** Notion (remote HTTP, OAuth, no API key needed, reader likely already uses it)

```bash
claude mcp add --transport http notion https://mcp.notion.com/mcp
```

Then `/mcp` to authenticate. Then "What pages do I have in my workspace?"

**Fallback if reader doesn't use Notion:** Sentry (same pattern, different URL), or the filesystem MCP server if they want local-only.

---

## Sources

1. **Anthropic official MCP docs**: https://code.claude.com/docs/en/mcp — primary source for all configuration, scopes, authentication, output limits, managed config
2. **Anthropic tools reference**: https://code.claude.com/docs/en/tools — built-in tools list (WebSearch, WebFetch confirmed as built-in, not MCP)
3. **Anthropic settings docs**: https://code.claude.com/docs/en/settings — settings.json format, MCP-related settings keys, scope precedence
4. **Anthropic debug config docs**: https://code.claude.com/docs/en/debug-your-config — `/mcp`, `/doctor`, common MCP failure causes
5. **Anthropic troubleshooting docs**: https://code.claude.com/docs/en/troubleshooting — performance, search issues, links to MCP debug
6. **Anthropic env vars docs**: https://code.claude.com/docs/en/env-vars — MCP_TIMEOUT, MAX_MCP_OUTPUT_TOKENS, ENABLE_TOOL_SEARCH, CLAUDE_CODE_MCP_ALLOWLIST_ENV
7. **MCP spec site**: https://modelcontextprotocol.io/introduction — protocol overview, architecture, client-server model, transports
8. **MCP architecture**: https://modelcontextprotocol.io/docs/learn/architecture — detailed protocol layers, primitives, lifecycle, JSON-RPC format
9. **MCP servers registry (GitHub)**: https://github.com/modelcontextprotocol/servers — official reference servers (Filesystem, Git, Memory, Fetch, Time, Sequential Thinking)
10. **Anthropic MCP registry API**: https://api.anthropic.com/mcp-registry/v0/servers — commercial servers compatible with Claude Code (22+ servers listed)
