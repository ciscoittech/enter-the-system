# Chapter 5: State Files. Teaching Your Systems to Remember

You applied to six jobs last week. You open Claude Code in your `job-hunting/` folder. You paste a new job posting. Claude drafts a solid cover letter, but it doesn't know you already applied to this company's competitor last Tuesday with a different angle. It doesn't know which resume version got you a callback. It doesn't know you've been emphasizing "data infrastructure" in your last three letters because that's what's working.

It starts from zero. Every. Single. Time.

You could paste all of that context into your prompt. But after 20 applications, that paste is three pages long. After 50, it's unmanageable. And you're the one maintaining it, by hand, in a text file, copying and pasting every session.

Your CLAUDE.md told Claude WHO you are. But it can't tell Claude what HAPPENED. Instructions are static. Your job search is dynamic. It changes every day.

---

## See the System

Here's what your Job Hunting System looks like right now:

```
[Job posting] + [CLAUDE.md auto-loaded] → [Claude] → [Cover letter + resume bullets]
```

Good output. No feedback arrow. Each session is independent. The system has Instruction but no Memory.

Here's what it looks like after this chapter:

```
[Job posting] + [CLAUDE.md + State auto-loaded] → [Claude] → [Output + State updated]
                                                                       ↓
                                                             [State file on disk]
```

The feedback arrow appears. The system remembers.

---

## The New Component: State Files

A state file is a plain text document that lives in your system's folder. It tracks what happened. Not what you want (that's CLAUDE.md), but what IS. Applications submitted, dates, statuses, outcomes, patterns.

Claude reads it at the start of every session. Writes to it at the end. You don't paste it. You don't copy it. It loads automatically, because you'll add one line to your CLAUDE.md telling Claude where it is.

**Three patterns you'll use in every system going forward:**

**Status tables** work like a spreadsheet in markdown. Each row is an item: an application, a task, a topic, a draft. Columns track the details.

| Company | Role | Date Applied | Status | Notes |
|---------|------|-------------|--------|-------|
| Stripe | Sr PM | 2025-04-12 | Phone screen | Emphasized data infra |

**Session logs** are timestamped entries of what happened. Useful when the work is sequential: study sessions, drafts, project meetings.

**Derived fields** are calculated from your data. "Callback rate by resume version." "Average quiz score by topic." "Completion percentage." Claude updates these when it writes to state. These are where patterns emerge.

Without state, the system treats every session as day one. With state, session 10 is informed by sessions 1 through 9. That's the difference between 10 isolated cover letters and a campaign that learns.

---

*This is a preview. The full chapter continues with building a Job Hunting System that tracks every application, learns which approaches get callbacks, and uses derived fields to surface patterns you'd never spot manually.*

**[Read the full book →](https://frontierengineering.dev/book)**

---

**What you'll build in this chapter:**
- A state file that gives your Job Hunting System memory across sessions
- Status tables, session logs, and derived fields that turn raw history into actionable patterns
- A system where session 10 is informed by sessions 1 through 9 — automatically

**Free preview:** [Act 1 (Chapters 1-3)](../ch01-draft.md) is free — start there.
