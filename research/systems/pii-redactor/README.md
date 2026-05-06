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

## How It Actually Works — Step by Step

### Phase 1: Scan (Pattern Detection)

The redactor runs 30+ regex patterns against the input text, in a specific order that prevents collisions:

1. **Banners first** — login banners and MOTD text get stripped entirely (they often contain org names, legal notices, contact info)
2. **Descriptions** — interface descriptions in device configs (e.g., "Link to Customer-Acme-Chicago-WAN") get replaced with `[Link to Site X]`
3. **Customer/company names** — detected from description patterns + SNMP location/contact fields
4. **Hostnames** — device names from config syntax. Generic names like "router" or "switch" are ignored (not useful to redact)
5. **FQDNs/domains** — matched against TLD patterns (.com, .net, .internal, etc.) BUT vendor domains (cisco.com, juniper.net — 33 in whitelist) are preserved
6. **Public IPs** — any IPv4 not in RFC1918 ranges gets mapped to `10.99.x.x`. Private IPs are left alone.
7. **Passwords/secrets** — 11 patterns covering `enable secret`, `username password`, `key-string`, `pre-shared-key`, `api-key`, `auth-token`, freeform `secret:` and `password:` patterns
8. **SNMP communities** — 8 vendor-specific patterns (`snmp-server community`, `rocommunity`, `rwcommunity`, freeform)
9. **IPv6** — link-local addresses preserved, others mapped

The order matters. Banners are stripped first because they contain text that would false-positive on later patterns. Passwords are scanned late because earlier patterns (hostnames, descriptions) might contain password-like strings in non-sensitive contexts.

### Phase 2: Decide (Three-Tier Classification)

Every detected item gets one of three treatments:

**PRESERVE** — Keep the original value. Used for:
- Private/RFC1918 IPs (10.x, 172.16-31.x, 192.168.x) — essential for routing analysis
- Vendor domains (cisco.com, juniper.net, arista.com) — public knowledge
- Generic hostnames ("router", "switch") — no information to protect

**MAP** — Replace with a consistent alias. A token store maintains bidirectional mapping so the replacement can be reversed after AI processing. Used for:
- Public IPs → `10.99.0.1`, `10.99.0.2`, ... (incrementing, natural-looking)
- Hostnames → `device-1`, `device-2`, ...
- Customer names → `Customer-1`, `Customer-2`, ...
- SNMP communities → `community1`, `community2`, ...
- FQDNs → `example-1.internal`, `example-2.internal`, ...
- Interface descriptions → `[Link to Site 1]`, `[Link to Site 2]`, ...

The MAP approach is critical: the AI sees `10.99.0.1` and treats it as a real IP. It sees `device-1` and treats it as a real hostname. The relationships between entities are preserved — if `device-1` connects to `10.99.0.5`, that relationship is real and analyzable. Only the identities are hidden.

**DESTROY** — Replace with `[REDACTED]`, no way back. Used for:
- Passwords, enable secrets, key strings
- API keys, auth tokens
- Pre-shared keys, TACACS/RADIUS secrets

These are too dangerous in any form. Even a mapped alias would tell an attacker "there's a password here." Destruction is the only safe option.

### Phase 3: Inject Context

After redaction, the system prepends a header to the sanitized text:

```
[SECURITY NOTE: This data has been sanitized for privacy.
- Public IPs are mapped to 10.99.x.x range (treat as valid public endpoints)
- Descriptions show [Link to Site X] (actual customer info redacted)
- Hostnames show device-X (actual names redacted)
- SNMP communities show communityX (actual strings redacted)
- Passwords show [REDACTED] (non-recoverable, do not attempt to guess)
Do NOT warn about RFC1918/private IP usage — the routing logic is correct.
Do NOT ask for the original values — work with what's provided.]
```

This header is what turns a redaction tool into a system. Without it, the AI:
- Flags `10.99.x.x` as "looks like a private/test range" and questions the topology
- Warns about `[REDACTED]` passwords and suggests the config is incomplete
- Asks "what's the actual hostname of device-1?" defeating the purpose

With the header, the AI understands the rules and works within them. It analyzes the topology using mapped IPs. It troubleshoots routing using mapped hostnames. It never asks for originals.

### Phase 4: Process + Restore

The AI processes the sanitized data. Its response contains mapped tokens (`10.99.0.1`, `device-3`, etc.).

The restore phase swaps mapped tokens back to originals using the token store:
- `10.99.0.1` → `203.0.113.45` (the real public IP)
- `device-3` → `chi-core-rtr-01` (the real hostname)
- `Customer-2` → `Acme Corp` (the real customer)
- `[REDACTED]` → stays `[REDACTED]` (passwords are one-way)

The final output has real data where it's needed (IPs, hostnames) and permanent redaction where it's critical (passwords, secrets).

### The Boundary-Aware Detail

One subtle but important implementation detail: the system uses word-boundary regex for password replacement to avoid substring mangling. Without this, a password like `admin123` inside a longer string `admin1234567` would get partially replaced, producing corrupted output. The boundary check ensures only exact matches get redacted.

```python
def _safe_replace(self, text, original, replacement):
    """Boundary-aware replacement to avoid substring mangling."""
    escaped = re.escape(original)
    return re.sub(r'(?<!\w)' + escaped + r'(?!\w)', replacement, text)
```

## Diagrams

![PII Redactor Data Flow](../../book/diagrams/png/pii-redactor-flow.png)
*The complete flow: raw data → scan → decide (preserve/map/destroy) → context injection → AI processes safely → optional restore*

![PII Redactor Decision Logic](../../book/diagrams/png/pii-redactor-decision.png)
*Three-tier decision: PRESERVE (needed for analysis), MAP (hide identity, keep relationships), DESTROY (too dangerous in any form)*

![Context Injection — The Systems-Thinking Insight](../../book/diagrams/png/pii-redactor-context.png)
*Without context injection, the AI fights the redaction. With it, the AI works within the rules. The redaction is regex. The context injection is systems thinking.*

## Technical Details (for reference, not for the chapter)

- **Implementation**: Python, ~400 lines across 4 files (redactor.py, patterns.py, store.py, __init__.py)
- **Detection**: 30+ regex patterns covering IPs, passwords, SNMP, hostnames, FQDNs, banners, customer names
- **Modes**: TOKEN mode (`[IP-001]`) and MAP mode (`10.99.0.1`) — MAP is default because it looks natural to LLMs
- **Structure-aware**: Uses ciscoconfparse for Cisco config parsing (with regex fallback)
- **Boundary-aware**: Uses word-boundary regex to avoid substring mangling
- **Vendor whitelist**: 33 vendor domains preserved (cisco.com, juniper.net, etc.)
- **Minimum length filters**: Avoids false positives on very short strings (3+ chars for passwords)
- **Entity linking**: Alias map normalizes vendor names across platforms before redaction
