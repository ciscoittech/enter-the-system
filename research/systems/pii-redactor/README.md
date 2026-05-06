# PII Redactor — Production System Evidence

**Source**: damira_work tools (production network operations system)
**Location**: `work projects/damira_work/tools/pii/`
**Status**: Production — used for real client network configurations

## What It Is

A smart redaction system that strips sensitive data from text before an LLM sees it. Built for network troubleshooting — where you need AI help analyzing device configs, but those configs contain customer IPs, passwords, SNMP communities, hostnames, and company names.

## Why This Matters for the Book

The PII redactor is the clearest real-world example of the **Control** concept (Ch 7: Hooks) and the **Gate** pattern (Ch 3). It sits between the user's data and the AI, enforcing a rule: "the AI never sees raw sensitive data."

But it's more than a filter. It's a *system* — because it also tells the AI how to interpret the sanitized data. That's the systems-thinking lesson.

## The Three Design Decisions Worth Teaching

### 1. What to redact vs. what to preserve

Not everything gets stripped. The system makes domain-aware decisions:

| Data Type | Action | Why |
|-----------|--------|-----|
| Private IPs (RFC1918) | **Preserved** | Essential for subnet/routing analysis |
| Public IPs | **Mapped** to 10.99.x.x | LLM needs to reason about topology |
| Passwords, secrets, keys | **Destroyed** | Never recoverable — too dangerous |
| SNMP communities | **Replaced** with `community1`, `community2` | Preserves uniqueness without exposure |
| Hostnames | **Replaced** with `device-1`, `device-2` | Preserves device relationships |
| Customer names | **Replaced** with `Customer-1` | Preserves context without exposure |
| Vendor domains (cisco.com, etc.) | **Preserved** | Public knowledge, safe to share |

**The lesson**: Good control isn't blanket rules. It's smart rules that know the difference between "sensitive" and "needed."

### 2. Reversible vs. non-reversible redaction

The system maintains a bidirectional mapping (a "token store") so most redactions can be reversed after AI processing. But passwords are one-way — they get `[REDACTED]` with no way back.

**The lesson**: Not all data has the same risk profile. Design your controls to match the consequence of exposure.

### 3. Context injection — telling the AI what happened

This is the killer feature. After redacting, the system prepends a header explaining the sanitization to the LLM:

```
[SECURITY NOTE: This data has been sanitized for privacy.
- Public IPs are mapped to 10.99.x.x range (treat as valid public endpoints)
- Descriptions show [Link to Site X] (actual customer info redacted)
- Hostnames show device-X (actual names redacted)
Do NOT warn about RFC1918/private IP usage — the routing logic is correct.]
```

Without this, the AI would:
- Flag RFC1918 addresses as "private" and suggest they're wrong
- Ask about the real IP addresses (defeating the purpose)
- Misinterpret the redacted topology

With this, the AI understands the *rules of the game* and works within them.

**The lesson**: Control isn't just blocking bad output. It's shaping how the AI interprets its input. The redaction is regex. The context injection is systems thinking.

## How It Works (Simplified for Teaching)

```
[Raw config with real data]
        ↓
[PII Redactor]
  - Scan for patterns (IPs, passwords, hostnames, etc.)
  - Apply rules: preserve, map, or destroy
  - Build token store (for later restoration)
  - Prepend context injection header
        ↓
[Sanitized config + context header]
        ↓
[LLM processes safely]
        ↓
[Response with mapped tokens]
        ↓
[Restore] (optional — swap tokens back to originals)
        ↓
[Final output with real data restored]
```

## Where This Fits in the Book

### Ch 7 (Hooks) — Starter version
A simple hook that scans for common PII patterns (email, phone, API keys) and blocks Claude from saving files that contain them. The reader builds their first automated guard rail.

Key teaching: "Your hook doesn't fix the problem — it refuses to let bad output through and tells you what's wrong."

### Ch 9 (Pipelines) — Intermediate version
A pipeline stage: Redact → Process → Restore. The reader sees the Gate pattern applied to data safety, with the redaction as a pre-processing stage and optional restoration as post-processing.

Key teaching: "The AI never saw the original data. It worked with the sanitized version. The system protected the data AND got the work done."

### Ch 12 (Design Your Own) — Reference
Point to the full production system as an example of where hooks evolve. From a simple regex grep to a domain-aware, reversible, context-injecting redaction system.

Key teaching: "Start with the simple version. Add sophistication when you can name the failure it prevents."

## The Systems-Thinking Angle

A prompt-level approach: "Don't include any sensitive data in your output."
→ Unreliable. The AI decides what's "sensitive." It will miss things.

A hook-level approach: grep for patterns, block if found.
→ Better. Catches known patterns. But the AI still SAW the data.

A system-level approach: Redact before the AI sees it, inject context so the AI knows the rules, optionally restore after.
→ The data never reaches the AI. The AI works correctly within the constraints. The system is trustworthy by design, not by hope.

That progression — from prompt to hook to system — mirrors the entire arc of the book.

## Technical Details (for reference, not for the chapter)

- **Implementation**: Python, ~400 lines across 4 files
- **Detection**: 30+ regex patterns covering IPs, passwords, SNMP, hostnames, FQDNs, banners, customer names
- **Modes**: TOKEN mode (`[IP-001]`) and MAP mode (`10.99.0.1`) — MAP is default because it looks natural to LLMs
- **Structure-aware**: Uses ciscoconfparse for Cisco config parsing (with regex fallback)
- **Boundary-aware**: Uses word-boundary regex to avoid substring mangling
- **Vendor whitelist**: 33 vendor domains preserved (cisco.com, juniper.net, etc.)
