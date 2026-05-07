# Chapter 7: Hooks. Automated Guard Rails

It's Tuesday night. You've been applying to jobs for three hours. Your Job Hunting System is humming. State file tracking everything, career-profile skill loaded, Claude tailoring each application. You're on application number seven.

Claude drafts a cover letter for the Senior PM role at Datadog. You skim it. Looks good. You submit it.

Wednesday morning, coffee in hand, you re-read the letter. Third paragraph: "In my role leading the data migration at Nexus Technologies, I reduced query latency by 73%."

You never worked at Nexus Technologies. You never led a data migration. That "73%" is fabricated. Claude invented a project, a company, and a metric, and presented all of it with the same confidence as your real achievements. And you submitted it.

This isn't a hypothetical. Claude makes things up. It does it confidently and fluently. Your career-profile skill has your REAL achievements (real companies, real numbers, real projects). But nothing in your system compares what Claude writes against what's actually in that file. You're the quality gate. And at 11pm on application seven, you blinked.

The system has Instruction (CLAUDE.md), Memory (state file), and Expertise (career-profile skill). Everything it needs to do good work. But nothing checking whether the work IS good.

A check that compares the cover letter's claims against the skill file would have caught this in two seconds. The claim "data migration at Nexus Technologies" doesn't appear anywhere in your career profile. Flag. Block. Fix.

That's a hook: an automated check that runs before or after Claude acts, catching specific errors you've defined. You write the check once. It runs every time. It doesn't get tired at 11pm.

Together, your hooks form a **validation layer**: the automated barrier between Claude's output and your use of it. Each hook checks one thing. The layer checks everything. You'll add hooks throughout the rest of this book, and they'll stack into a validation layer that catches errors you haven't even thought of yet.

---

*This is a preview. The full chapter continues with building fabrication-check hooks for the Job Hunting System, creating quiz-quality hooks for the Study System, and assembling a validation layer that catches the mistakes you're too tired to notice.*

**[Read the full book →](https://frontierengineering.dev/book)**

---

**What you'll build in this chapter:**
- A fabrication-check hook that catches invented credentials before they leave your system
- A quiz-quality hook that validates every study question has the right structure
- A validation layer — multiple hooks stacked so each one checks a different failure mode

**Free preview:** [Act 1 (Chapters 1-3)](../ch01-draft.md) is free — start there.
