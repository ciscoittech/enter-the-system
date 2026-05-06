# Ch 7 Research: Hooks in Claude Code

Research compiled 2026-05-06 from official Anthropic documentation (code.claude.com/docs/en/hooks, /hooks-guide, /settings, /debug-your-config) and project-level settings examples.

---

## How It Actually Works

Hooks are user-defined commands that execute at specific points in Claude Code's lifecycle. They are **deterministic** -- they always run when their trigger fires, unlike CLAUDE.md instructions which are guidance the model may or may not follow. This is the key teaching distinction: CLAUDE.md = advice, hooks = enforcement.

### Execution model

1. An event fires (e.g., Claude is about to edit a file)
2. Claude Code checks all registered hooks for that event
3. Matcher filtering narrows which hooks apply (e.g., only `Edit|Write` tools)
4. Optional `if` field further filters by tool arguments (e.g., only `Bash(git *)`)
5. **All matching hooks run in parallel** (identical handlers are deduplicated)
6. Hook receives event data as JSON on **stdin**
7. Hook communicates back via **exit code** + **stdout** (JSON) + **stderr** (error messages)
8. Claude Code applies the most restrictive decision if multiple hooks disagree

### Synchronous by default

Command hooks are **synchronous and blocking** -- Claude Code waits for the hook to finish before proceeding. The `async` field can make them non-blocking, and `asyncRewake` runs in background but wakes Claude on exit code 2.

### Default timeout

- Command hooks: **600 seconds** (10 minutes) by default
- HTTP hooks: **30 seconds** by default
- Prompt hooks: **30 seconds** by default
- Agent hooks: **60 seconds** by default
- All configurable per-hook via `"timeout"` field (in seconds)

---

## settings.json Format

### Where hooks live

Hooks go inside the `"hooks"` key of a settings file. They coexist with `"permissions"` and all other settings keys:

```json
{
  "permissions": {
    "allow": ["Read", "Glob", "Grep"],
    "deny": []
  },
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "bash .claude/hooks/protect-files.sh"
          }
        ]
      }
    ],
    "Notification": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "osascript -e 'display notification \"Claude needs attention\" with title \"Claude Code\"'"
          }
        ]
      }
    ]
  }
}
```

### Structure breakdown

```
{
  "hooks": {
    "<EventName>": [           // Which lifecycle event (e.g., "PreToolUse")
      {
        "matcher": "...",      // Filter: which tool/type this applies to (string, not array)
        "hooks": [             // Array of hook handlers to run
          {
            "type": "command", // Handler type: command | http | mcp_tool | prompt | agent
            "command": "...",  // The shell command to run
            "if": "Bash(rm *)",// Optional: permission-rule-syntax filter (tool events only)
            "timeout": 600,    // Optional: seconds before canceling
            "statusMessage": "Checking...",  // Optional: spinner text
            "async": false,    // Optional: run without blocking
            "asyncRewake": false, // Optional: run in background, wake on exit 2
            "shell": "bash",   // Optional: "bash" (default) or "powershell"
            "once": false      // Optional: run only once per session
          }
        ]
      }
    ]
  }
}
```

### Settings file locations (scope)

| Location | Scope | Shareable? |
|----------|-------|------------|
| `~/.claude/settings.json` | All projects on this machine | No (personal) |
| `.claude/settings.json` | This project only | Yes (commit to git) |
| `.claude/settings.local.json` | This project only | No (gitignored) |
| Managed policy settings | Organization-wide | Yes (admin-controlled) |
| Plugin `hooks/hooks.json` | When plugin enabled | Yes (bundled) |
| Skill/Agent YAML frontmatter | While component active | Yes (in component file) |

### Precedence (highest wins)

1. Managed settings (cannot be overridden)
2. Command line flags (`--settings`)
3. Local project (`.claude/settings.local.json`)
4. Shared project (`.claude/settings.json`)
5. User (`~/.claude/settings.json`)

**Array merging**: Arrays concatenate and deduplicate across scopes. So hooks from user + project settings both fire.

**IMPORTANT**: There is NO standalone `.claude/hooks.json` file. Hooks must be inside a `settings.json` under the `"hooks"` key. This is a common mistake.

---

## Available Triggers

### Complete event list (30 events)

| Event | When It Fires | Can Block? | Matcher Field |
|-------|---------------|------------|---------------|
| **SessionStart** | New session, resume, clear, or compaction | No | `startup`, `resume`, `clear`, `compact` |
| **Setup** | With `--init-only`, `--init`, or `--maintenance` | No | `init`, `maintenance` |
| **UserPromptSubmit** | User submits a prompt | Yes | No matcher support |
| **UserPromptExpansion** | Slash command expands | Yes | Command name |
| **PreToolUse** | Before a tool executes | Yes | Tool name (`Bash`, `Edit`, `Write`, `Read`, `Glob`, `Grep`, `WebFetch`, `WebSearch`, `Agent`, `mcp__*`) |
| **PermissionRequest** | Permission dialog appears | Yes | Tool name |
| **PermissionDenied** | Tool denied by auto mode | No | Tool name |
| **PostToolUse** | After tool succeeds | Yes (stops loop) | Tool name |
| **PostToolUseFailure** | After tool fails | Yes (stops loop) | Tool name |
| **PostToolBatch** | After parallel tool batch | Yes | No matcher support |
| **Notification** | Notification sent | No | `permission_prompt`, `idle_prompt`, `auth_success`, `elicitation_dialog`, `elicitation_complete`, `elicitation_response` |
| **SubagentStart** | Subagent spawned | No | Agent type |
| **SubagentStop** | Subagent finishes | Yes | Agent type |
| **TaskCreated** | Task created | Yes | No matcher support |
| **TaskCompleted** | Task completed | Yes | No matcher support |
| **Stop** | Claude finishes responding | Yes | No matcher support |
| **StopFailure** | Turn ends in API error | No | Error type |
| **TeammateIdle** | Agent team teammate idle | Yes | No matcher support |
| **InstructionsLoaded** | CLAUDE.md loaded | No | Load reason |
| **ConfigChange** | Config file changes | Yes | Config source |
| **CwdChanged** | Working directory changes | No | No matcher support |
| **FileChanged** | Watched file changes | No | Literal filenames |
| **WorktreeCreate** | Worktree created | Yes | No matcher support |
| **WorktreeRemove** | Worktree removed | No | No matcher support |
| **PreCompact** | Before context compaction | Yes | `manual`, `auto` |
| **PostCompact** | After compaction | No | `manual`, `auto` |
| **Elicitation** | MCP requests user input | Yes | MCP server name |
| **ElicitationResult** | User responds to MCP | Yes | MCP server name |
| **SessionEnd** | Session terminates | No | End reason |

### For the book (Ch 7): Focus on these 5

The book should teach these and mention the rest exist:

1. **PreToolUse** -- "Check BEFORE Claude acts" (the primary teaching hook)
2. **PostToolUse** -- "Check AFTER Claude acts" (auto-format, logging)
3. **Stop** -- "Check before Claude says 'I'm done'" (quality gate)
4. **Notification** -- "Get alerted when Claude needs you" (practical utility)
5. **SessionStart** -- "Inject context when Claude starts" (re-inject after compaction)

---

## Data Flow

### Input: How data reaches the hook script

Every hook receives **JSON on stdin**. The script reads it with `cat` and parses with `jq`:

```bash
#!/bin/bash
INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')
```

**Common fields in every event:**
```json
{
  "session_id": "abc123",
  "transcript_path": "/path/to/transcript.jsonl",
  "cwd": "/current/working/directory",
  "hook_event_name": "PreToolUse",
  "permission_mode": "default"
}
```

**PreToolUse adds:**
```json
{
  "tool_name": "Edit",
  "tool_input": {
    "file_path": "/path/to/file.txt",
    "old_string": "original",
    "new_string": "replacement"
  },
  "tool_use_id": "toolu_01abc"
}
```

**PostToolUse adds** `tool_use_result` with the tool's output.

**UserPromptSubmit provides:** `"prompt": "the user's message"`

**SessionStart provides:** `"source": "startup|resume|clear|compact"` and `"model": "claude-sonnet-4-6"`

### Output: How the hook communicates back

Three channels:

1. **Exit code** -- The primary signal
2. **stdout** -- JSON for structured decisions, or plain text for context injection
3. **stderr** -- Error messages shown to user/Claude when blocking

### Exit codes

| Code | Meaning | Behavior |
|------|---------|----------|
| **0** | Success / allow | Action proceeds. stdout parsed for JSON output |
| **2** | Block | Action blocked (if event supports it). stderr becomes Claude's feedback. **stdout JSON is IGNORED** |
| **1 or other** | Non-blocking error | Action proceeds anyway. stderr logged. Transcript shows error notice |

**CRITICAL GOTCHA**: Exit code 1 does NOT block. This is different from typical Unix convention where 1 = failure. Only exit code **2** blocks. This will confuse readers who know Unix basics.

### JSON output format (stdout)

For structured control beyond allow/block, exit 0 and print JSON:

```json
{
  "hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "permissionDecision": "deny",
    "permissionDecisionReason": "This file is protected"
  }
}
```

Permission decision values for PreToolUse: `"allow"`, `"deny"`, `"ask"`, `"defer"`

Top-level decision pattern (for PostToolUse, Stop, etc.):
```json
{
  "decision": "block",
  "reason": "Tests must pass before stopping"
}
```

### Output size limits

- `additionalContext`, `systemMessage`, injected context: **10,000 characters max**
- Excess saved to file; path provided to Claude with preview

### Environment variables available to hooks

| Variable | Available In | Value |
|----------|--------------|-------|
| `$CLAUDE_PROJECT_DIR` | All command hooks | Project root directory |
| `$CLAUDE_ENV_FILE` | SessionStart, Setup, CwdChanged, FileChanged | File path for persisting env vars |
| `$CLAUDE_CODE_REMOTE` | All hooks | `"true"` in web environments, unset in CLI |
| `${CLAUDE_PLUGIN_ROOT}` | Plugin hooks only | Plugin installation directory |
| `${CLAUDE_PLUGIN_DATA}` | Plugin hooks only | Plugin persistent data directory |

---

## What Works Well

### Proven patterns from official docs

1. **Desktop notifications** (Notification hook) -- The simplest useful hook. One-liner, no script file needed:
   ```json
   {
     "type": "command",
     "command": "osascript -e 'display notification \"Claude needs attention\" with title \"Claude Code\"'"
   }
   ```

2. **Auto-format after edits** (PostToolUse on Edit|Write) -- Run Prettier on every file Claude edits:
   ```json
   {
     "type": "command",
     "command": "jq -r '.tool_input.file_path' | xargs npx prettier --write"
   }
   ```

3. **Block edits to protected files** (PreToolUse on Edit|Write) -- Pattern-match file paths, exit 2 to block:
   ```bash
   #!/bin/bash
   INPUT=$(cat)
   FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
   PROTECTED=(".env" "package-lock.json" ".git/")
   for pattern in "${PROTECTED[@]}"; do
     if [[ "$FILE_PATH" == *"$pattern"* ]]; then
       echo "Blocked: $FILE_PATH matches protected pattern '$pattern'" >&2
       exit 2
     fi
   done
   exit 0
   ```

4. **Re-inject context after compaction** (SessionStart with `compact` matcher):
   ```json
   {
     "type": "command",
     "command": "echo 'Reminder: use Bun, not npm. Run bun test before committing.'"
   }
   ```

5. **Log every bash command** (PostToolUse on Bash):
   ```json
   {
     "type": "command",
     "command": "jq -r '.tool_input.command' >> ~/.claude/command-log.txt"
   }
   ```

6. **Auto-approve specific permissions** (PermissionRequest on ExitPlanMode):
   ```json
   {
     "type": "command",
     "command": "echo '{\"hookSpecificOutput\": {\"hookEventName\": \"PermissionRequest\", \"decision\": {\"behavior\": \"allow\"}}}'"
   }
   ```

### What hooks are NOT for

- They cannot trigger `/` commands or tool calls
- They cannot undo actions (PostToolUse runs after the fact)
- `additionalContext` is injected as plain text Claude reads -- it's not a command
- PermissionRequest hooks do NOT fire in non-interactive mode (`-p`); use PreToolUse instead

---

## What Breaks / Gotchas

### 1. Exit code 1 does NOT block

The most dangerous misconception. In Unix, exit 1 = error = stop. In Claude Code hooks, exit 1 = non-blocking error = action proceeds anyway. Only **exit 2** blocks. The book must drill this.

### 2. Shell profile pollution breaks JSON parsing

When Claude Code spawns a hook, it sources your shell profile (`~/.zshrc` or `~/.bashrc`). If your profile has unconditional `echo` statements, that text gets prepended to your hook's JSON output:

```
Shell ready on arm64
{"decision": "block", "reason": "Not allowed"}
```

Claude Code tries to parse this as JSON and fails. **Fix**: wrap echo statements in interactive-only checks:
```bash
if [[ $- == *i* ]]; then
  echo "Shell ready"
fi
```

### 3. Matcher is a STRING, not an array

```json
"matcher": "Edit|Write"     // CORRECT -- pipe-separated string
"matcher": ["Edit", "Write"] // WRONG -- array causes schema error, hook silently dropped
```

This is a schema error. Claude Code shows a settings error notice, `/doctor` reports the validation failure, and the hook entry is dropped so it won't appear in `/hooks`.

### 4. Matcher is case-sensitive

`"bash"` will NOT match the `Bash` tool. Tool names are capitalized: `Bash`, `Edit`, `Write`, `Read`, `Glob`, `Grep`, `WebFetch`, `WebSearch`, `Agent`.

### 5. No standalone hooks file

There is no `.claude/hooks.json`. Hooks MUST be inside a `settings.json` under the `"hooks"` key. This is explicitly called out as a common mistake in the debug docs.

### 6. stdout must be ONLY the JSON object

If your script prints anything before the JSON (debug messages, warnings), JSON parsing fails. Use stderr for debug output:
```bash
echo "Debug: checking file" >&2    # Goes to stderr (safe)
echo '{"decision": "block"}'       # Goes to stdout (parsed as JSON)
```

### 7. Stop hooks can loop forever

If a Stop hook blocks Claude from stopping (exit 2 or `decision: "block"`), Claude continues working, then tries to stop again, triggering the hook again. You must check the `stop_hook_active` field:

```bash
INPUT=$(cat)
if [ "$(echo "$INPUT" | jq -r '.stop_hook_active')" = "true" ]; then
  exit 0  # Allow Claude to stop on the second attempt
fi
```

### 8. Multiple hooks modifying same input is non-deterministic

When multiple PreToolUse hooks return `updatedInput`, hooks run in parallel so the last one to finish wins. Order is not guaranteed. Avoid having more than one hook modify the same tool's input.

### 9. PostToolUse cannot undo

The tool already ran. PostToolUse can inject context, stop the loop, or log -- but it cannot reverse the action.

### 10. chmod +x is required for script files

The hooks guide explicitly states: "Hook scripts must be executable for Claude Code to run them" with `chmod +x .claude/hooks/protect-files.sh`. Inline commands (like `echo` or `jq`) don't need this since they run directly in the shell.

### 11. File watcher may miss settings changes

Direct edits to settings files are "normally picked up automatically" but if they don't appear after a few seconds, restart the session to force a reload.

---

## Shell Scripting for Non-Technical Readers

### Minimum knowledge needed

Readers need to understand:

1. **What a shell script is** -- A text file containing commands the computer runs in order
2. **The shebang line** -- `#!/bin/bash` at the top tells the system which program runs the script
3. **Reading stdin** -- `INPUT=$(cat)` captures what Claude Code sends
4. **Parsing JSON with jq** -- `echo "$INPUT" | jq -r '.tool_input.file_path'` extracts a value
5. **Exit codes** -- `exit 0` (allow), `exit 2` (block)
6. **stderr vs stdout** -- `echo "message" >&2` sends to stderr (error channel)
7. **Making scripts executable** -- `chmod +x script.sh`

### The simplest possible working hook

**Inline (no script file needed):**
```json
{
  "hooks": {
    "Notification": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "osascript -e 'display notification \"Claude needs you\" with title \"Claude Code\"'"
          }
        ]
      }
    ]
  }
}
```

**Simplest script file that blocks something:**
```bash
#!/bin/bash
INPUT=$(cat)
FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

if [[ "$FILE" == *".env"* ]]; then
  echo "Cannot edit .env files" >&2
  exit 2
fi

exit 0
```

### What shell does Claude Code use?

**Bash** is the default. Can be changed to PowerShell with `"shell": "powershell"`. On macOS (where the default shell is zsh), hooks still run in bash. However, the shell profile (`~/.zshrc` or `~/.bashrc`) IS sourced, which is why profile echo statements can break hooks.

### What happens if a hook script has a syntax error?

The script exits with a non-zero code (likely 1 or 2 depending on where the error is). Since exit 1 = non-blocking error, a syntax error before any `exit 2` statement will NOT block the action -- Claude proceeds anyway. The transcript shows a `<hook name> hook error` notice. The full error goes to the debug log.

### Can hooks be written in Python?

Yes. Any executable can be a hook. The `command` field runs in a shell, so:
```json
{
  "type": "command",
  "command": "python3 \"$CLAUDE_PROJECT_DIR\"/.claude/hooks/validate.py"
}
```

The Python script reads stdin, parses JSON, and exits with the appropriate code. Same for Node.js, Ruby, etc.

### How to debug a hook that isn't firing

1. Run `/hooks` -- confirm the hook appears under the correct event
2. Check matcher spelling -- case-sensitive, must be string not array
3. Run `/doctor` -- catches schema errors in settings
4. Start with `claude --debug hooks` or `claude --debug-file /tmp/claude.log` -- shows which hooks matched, exit codes, stdout, stderr
5. Test manually: `echo '{"tool_name":"Bash","tool_input":{"command":"ls"}}' | ./my-hook.sh && echo $?`
6. Check `chmod +x` on script files

### Prerequisite: jq

Almost every hook example uses `jq` for JSON parsing. Readers need to install it:
- macOS: `brew install jq`
- Ubuntu/Debian: `apt-get install jq`
- The book should call this out in the chapter prerequisites

---

## Community Patterns

### From the project itself

The book project's own `.claude/settings.json` demonstrates real hooks:

- **protect-files.sh** on PreToolUse (Edit|Write) -- Prevents edits to `book/published/` and `research/raw/`
- **jargon-check.sh** on PreToolUse (Edit|Write) -- Checks for banned jargon words
- **skill-suggester.sh** on UserPromptSubmit -- Suggests relevant skills when prompts are submitted
- **on-stop.sh** on Stop -- Runs checks when Claude finishes

### From the chapter's build-along project

The `downloads/ch07-hook/.claude/settings.json` shows the older hook format (pre-current-API) with `$FILE` arguments. This format appears outdated -- the current API uses stdin JSON, not command arguments.

### Patterns from official examples

1. **Compliance/audit logging** -- ConfigChange hooks that append to audit logs
2. **Environment management** -- SessionStart + CwdChanged hooks that manage direnv integration
3. **MCP tool monitoring** -- PreToolUse with regex matchers like `mcp__github__.*`
4. **Quality gates** -- Stop hooks (or prompt/agent hooks) that verify work is complete before allowing Claude to finish

### Hook types beyond shell commands

The docs reveal 5 hook types total:
1. **command** -- Shell script (the one we teach)
2. **http** -- POST to a URL endpoint
3. **prompt** -- Single-turn LLM evaluation (Haiku by default)
4. **agent** -- Multi-turn subagent with tool access (experimental)
5. **mcp_tool** -- Call a tool on a connected MCP server

For the book, we teach `command` only and mention the others exist.

---

## Implications for the Chapter

### What we MUST teach

1. **The mental model**: Hooks = automated checks that ALWAYS run (deterministic), vs CLAUDE.md = advice that Claude may or may not follow. This is the core distinction.

2. **The JSON-on-stdin pattern**: Every hook reads JSON from stdin. This is non-negotiable -- readers need to understand `INPUT=$(cat)` and `jq`.

3. **Exit code 2 = block, everything else = proceed**: This is the most counterintuitive part. Exit 1 does NOT block. Must be drilled with an exercise.

4. **The settings.json structure**: Nested structure (`hooks > EventName > [{matcher, hooks: [{type, command}]}]`) is complex. Build it up piece by piece.

5. **chmod +x**: Required on Mac/Linux. Must be taught explicitly.

6. **jq as a prerequisite**: The chapter needs a "Before You Start" section that installs jq.

### What to warn about

1. **Shell profile echo statements** breaking JSON parsing -- reader may hit this immediately
2. **Matcher is a string, not an array** -- the most common configuration mistake
3. **Exit 1 vs exit 2** -- against Unix convention
4. **Stop hook infinite loops** -- teach the `stop_hook_active` guard from day one
5. **Testing hooks manually** -- pipe sample JSON to the script before relying on it

### What to simplify

1. **Only teach `command` type hooks** -- prompt, agent, http, mcp_tool are advanced
2. **Focus on 3-4 events**: PreToolUse (block), PostToolUse (auto-format), Notification (alert), Stop (quality gate). Mention SessionStart for context injection.
3. **Use inline commands first** before introducing script files -- lower barrier to entry
4. **Provide copy-paste JSON blocks** for each hook -- don't make readers construct the nested structure from scratch
5. **The 4 throughline systems each get ONE hook** that demonstrates a different pattern

### Teaching sequence suggestion

1. Start with Notification hook (simplest, no script file, immediate feedback)
2. Move to PreToolUse with inline command (block something obvious like .env edits)
3. Introduce script files with protect-files.sh (the full pattern: stdin, jq, exit codes)
4. Show PostToolUse for auto-formatting (the tool already ran, so different mental model)
5. End with Stop hook as quality gate (the most powerful but most complex)

### The `$FILE` argument pattern is OUTDATED

The chapter's build-along project (`downloads/ch07-hook/.claude/settings.json`) uses `$FILE` arguments in hook commands. The current API does NOT pass file paths as arguments -- it passes JSON on stdin. The build-along materials need updating to match the current API.

---

## Sources

All accessed 2026-05-06:

1. **Hooks Reference** (complete event schemas, JSON formats, all fields)
   https://code.claude.com/docs/en/hooks

2. **Hooks Guide** (practical walkthrough, common patterns, troubleshooting)
   https://code.claude.com/docs/en/hooks-guide

3. **Settings Reference** (settings.json schema, scopes, precedence, merging)
   https://code.claude.com/docs/en/settings

4. **Debug Your Configuration** (troubleshooting hooks/settings not firing)
   https://code.claude.com/docs/en/debug-your-config

5. **Troubleshooting** (general, points to debug-your-config for hooks)
   https://code.claude.com/docs/en/troubleshooting

6. **Claude Code Overview** (hooks mentioned in "Customize" section)
   https://code.claude.com/docs/en/overview

7. **Project settings.json** (live example of hooks in this book project)
   `.claude/settings.json` in frontier-engineering-cowork
