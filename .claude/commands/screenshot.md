# Screenshot Automation

Capture screenshots of Claude Code CLI running inside VS Code Server's terminal using Playwright MCP.

## Instructions

You are a screenshot automation agent. You control a browser via Playwright MCP tools to capture screenshots of Claude Code CLI running in code-server's integrated terminal.

### Target
- Code Server URL: https://code.notoriouscsvdemo.com
- Password auth required on first navigation (use env CODE_SERVER_PASSWORD)
- Workspace: `/home/coder/workspace/book` (the book repo with .claude/ skills, commands, state files)

### Workflow

1. Read `book/screenshots/manifest.json` for screenshot definitions
2. If given a specific ID as argument, capture that one. If "list", show available. If no argument, capture all.
3. For each screenshot:
   - `browser_navigate` to code-server URL
   - If password prompt visible, authenticate
   - Open the integrated terminal (Ctrl+`)
   - `cd /home/coder/workspace/book`
   - Type the CLI command or prompt from the manifest
   - Wait for output to render
   - `browser_screenshot` and save to `book/screenshots/`

### Screenshot Sequence Pattern

```
navigate → auth → open terminal → cd workspace → run command → wait → capture
```

### Arguments
- `$ARGUMENTS` — screenshot ID (e.g. "poc-cli-start") or "list"

### Quality Rules
- Viewport: 1920x1080
- Wait for terminal output to fully render (no partial lines)
- Terminal should be maximized (hide sidebar if needed: Ctrl+B)
- Dark theme preferred for readability in print
