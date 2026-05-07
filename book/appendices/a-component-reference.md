# Appendix A: System Component Reference

Every component in the book — what it is, when to add it, what failure it prevents, and a template to start from.

---

## 1. Prompt (Introduced: Chapter 4)

**What it is**: A structured request with four parts — Context, Input, Output, Constraints. Saved as a file you reuse, not a message you paste and lose.

**When to add it**: Always. Every system starts here. If you're asking AI to do anything, you need a structured prompt.

**The failure it prevents**: "It didn't do what I wanted." Vague prompts produce vague output. Structure removes ambiguity.

**Template**:
```markdown
## Context
[Who you are, what you're working on, your level]

## Input
[What the AI should read or work with]

## Output
[Exactly what the finished work looks like — be specific]

## Constraints
[What NOT to do — prevent the mistakes you've seen before]
```

**Evidence**: In our eval, vague prompts scored 11/20. Structured prompts scored 20/20. Every run.

---

## 2. State (Introduced: Chapter 5)

**What it is**: A file that tracks what happened across sessions — topics covered, scores, decisions made, what's next. The system reads it at session start and writes to it at session end.

**When to add it**: When running the system twice reveals the gap — it forgets everything from the first run.

**The failure it prevents**: "I have to re-explain everything every time." Without state, every session starts from zero.

**Template**:
```markdown
# [System Name] — State

## Status Tracker
| Item | Status | Last Updated | Notes |
|------|--------|-------------|-------|
| | | | |

## Session Log
| Date | What Happened | Key Findings |
|------|---------------|-------------|
| | | |

## Open Items
- [ ] 

## Next Session Focus
- 
```

**Maintenance**: Archive completed items monthly. If the file is too long for the AI to process well, split active from archived state. See Chapter 5 "Maintain It" section.

---

## 3. Skill (Introduced: Chapter 6)

**What it is**: A reusable knowledge document the AI loads before working. Contains rules, examples, vocabulary, and expertise for a specific domain.

**When to add it**: When you find yourself re-explaining the same context every session — your voice, your preferences, your domain knowledge.

**The failure it prevents**: "It doesn't know how I work / write / think." Without a skill, the AI defaults to generic output.

**Template**:
```markdown
# [Domain] Skill

## Identity
You are a [role] who [key expertise]. Your output should [key quality].

## Rules
- [What to always do]
- [What to never do]

## Examples
### Good Output
[2-3 examples of what right looks like — real examples, not descriptions]

### Bad Output
[1-2 examples of what wrong looks like — AI defaults to avoid]

## Vocabulary
**Use**: [words/phrases that match the target voice]
**Never use**: [words/phrases to avoid — AI-isms, jargon, etc.]
```

**Maintenance**: Version your skills — note what changed and why. If the new version produces worse output, roll back. Quarterly review: does the skill still match how you actually work? See Chapter 7 "Maintain It" section.

---

## 4. Hook (Introduced: Chapter 7)

**What it is**: An automated check (shell script) that runs before or after the AI acts. Together, your hooks form the **validation layer** between Claude's output and your use of it. Catches mistakes before they reach you.

**When to add it**: When the cost of a mistake is higher than the cost of checking. Cover letters, financial reports, quiz answers you're studying from.

**The failure it prevents**: "It gave me confident garbage and I almost used it." Without hooks, you're the only quality gate, and you're not always paying attention.

**Template**:
```bash
#!/bin/bash
INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Only check relevant files
[[ "$FILE_PATH" != *"your-pattern"* ]] && exit 0

CONTENT=$(echo "$INPUT" | jq -r '.tool_input.content // empty')

# Check 1: [describe what you're checking]
if echo "$CONTENT" | grep -qi "bad-pattern"; then
    echo "FAILED: [explain why]"
    exit 2
fi

exit 0
```

**Maintenance**: Tune thresholds. If a hook flags everything, it's too strict. If it catches nothing, it's too loose. Periodically feed known-bad input to verify hooks still fire. See Chapter 7 "Break It on Purpose" section.

---

## 5. Connection (Introduced: Chapter 8)

**What it is**: A way for the AI to reach outside your local files — web search, MCP servers (plugins for Google Drive, Notion, databases), APIs, CLI tools.

**When to add it**: When the system needs information you don't have in your files — current data, information from another tool, or data that changes frequently.

**The failure it prevents**: "It only knows what I paste in." Without connections, the system is limited to your local files and whatever you type.

**Maintenance**: Check that external sources still work monthly. Build fallback behavior: "if you can't reach [source], note the gap and continue." See Chapter 10 "Maintain It" section.

---

## 6. Pipeline (Introduced: Chapter 9)

**What it is**: A multi-stage workflow where each stage's output feeds the next, with quality gates between stages that decide "continue" or "rework."

**When to add it**: When cramming everything into one prompt produces mediocre results across all stages. Research + drafting + editing in one prompt = B- at everything. Pipeline = A at each stage.

**The failure it prevents**: "It tried to do everything at once and botched it." Without stages, each task gets a fraction of the AI's attention.

**Template**:
```
Stage 1: [GATHER] → exit criteria: [what "done" looks like]
    ↓
Stage 2: [PROCESS] → exit criteria: [what "done" looks like]
    ↓
Quality Gate: [specific checks] → pass / rework with feedback
    ↓
Stage 3: [OUTPUT] → exit criteria: [what "done" looks like]
    ↓
State update: log what happened at every stage
```

**Maintenance**: Find the bottleneck — the slowest or most error-prone stage. Fix that one. Ignore the rest. If a stage passes 100% for a month, consider removing it. See Chapter 11 "Maintain It" section.

---

## Component Addition Decision Framework

Ask these questions in order:

1. **Does the system produce the wrong output?** → Fix the **Prompt** (Context/Input/Output/Constraints)
2. **Does the system forget everything between sessions?** → Add **State**
3. **Do you keep re-explaining the same context?** → Add a **Skill**
4. **Does bad output slip through?** → Add a **Hook**
5. **Does the system need external information?** → Add a **Connection**
6. **Is one prompt trying to do too much?** → Add a **Pipeline**

Only add a component when you can name the failure it prevents. If you can't name the failure, you don't need the component yet.
