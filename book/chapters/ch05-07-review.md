# Review: Chapters 5, 6, 7

**Date**: 2026-05-06
**Reviewer**: book-editor

---

## Chapter 5 — State Files: Teaching Your Systems to Remember

### Score Card

```
Chapter: Ch 5 — State Files
Date: 2026-05-06
Reviewer: book-editor

Clarity:           4/5  — Clear throughout; every concept has a plain-language equivalent, state patterns explained with concrete examples
Systems Thinking:  5/5  — Nails the feedback loop concept; the reader understands WHY state exists (not just how) and walks away with a transferable mental model
Voice:             4/5  — Reads like a person, good rhythm, varied paragraph lengths, no detected AI tells
Build Quality:     4/5  — Fully reproducible build with real files, multi-session walkthrough, and three "Break It" tests proving the component works
Progression:       5/5  — Adds exactly one component (state), explicitly builds on Ch 4's CLAUDE.md, no forward references
Quality Gate:      5/5  — Five concrete checks including duplicate detection, cross-session memory, derived insights, and a "name the gap" bridge to Ch 6
─────────────────
TOTAL:             27/30

PASS: YES
```

### Top 3 Strengths

1. **The multi-session walkthrough is the best teaching device in these three chapters.** Sessions 1-2-3 for Job Hunting show the reader exactly how state accumulates and how the system's behavior changes. This isn't abstract — they see Application #1's callback data change the recommendation for Application #3.

2. **"Maintain It: State Hygiene" section is practical and honest.** The 50-row guideline, the monthly check, the "clean desk not filing cabinet" analogy — this teaches real maintenance without sugarcoating it. This is the kind of content other AI books skip entirely.

3. **"Break It on Purpose" is the strongest across all three chapters.** Three distinct tests (remove wiring, feed duplicate, check edit behavior), each proving a different aspect of the component. Test 3 (checking whether Claude updates rows vs. rewrites the file) is especially clever — it teaches the reader to observe HOW the system uses state, not just WHETHER.

### Top 3 Issues to Fix

1. **"See the System" diagram (line 21-29) uses ASCII art that may not render well in print.** The feedback arrow `↓` and `[State file on disk]` placement work in monospace but could confuse in a proportional font. Consider noting this is meant for terminal display, or simplify the diagram. This applies to all three chapters but is most noticeable here as the first Act 2 chapter.

2. **The `@` import syntax (line 104-121) needs a clearer caveat.** The chapter says "The `@job-state.md` line tells Claude Code to load that file's contents into its context automatically." The `@` syntax in CLAUDE.md for auto-loading files is presented as established fact but may behave differently across tool versions. Add a sentence like: "If Claude doesn't seem to read the file, you can also start your session by saying 'read job-state.md first.'" Provide the fallback so the reader isn't stuck.

3. **"Extend It" sections (line 175-283) are slightly repetitive.** Study, Project Management, and Content all follow the exact same pattern: create state file, add to CLAUDE.md, describe three sessions. The "three sessions" descriptions for PM and Content are less vivid than the Job Hunting walkthrough — they summarize rather than show. Consider trimming each extension to the state file template + one sentence on what changes, since the Job Hunting build already taught the pattern.

### AI Tells Found

None detected. Clean voice throughout.

### Jargon Found (untranslated)

- **"context"** (line 292) — "That context has limits" — the word "context" is used without translation. Should say something like "Claude's working memory" (which the chapter does use elsewhere, but not here).

---

## Chapter 6 — Skills: Loading Expertise On Demand

### Score Card

```
Chapter: Ch 6 — Skills
Date: 2026-05-06
Reviewer: book-editor

Clarity:           4/5  — Strong throughout; the CLAUDE.md-vs-skill distinction is explained with concrete parallel examples
Systems Thinking:  4/5  — The state-to-skill feedback loop (Step 6) is genuinely insightful; shows components interacting, not just stacking
Voice:             4/5  — Conversational and direct; "the trick is to let the examples do most of the talking" is exactly right for this voice
Build Quality:     4/5  — Two complete skill files with real templates, clear folder structure, reproducible build
Progression:       4/5  — Adds exactly one component (skill), builds on Ch 5 state, references Ch 3 Loop pattern appropriately
Quality Gate:      4/5  — Five checks including the voice-match test (show someone and ask "which did I write?"), which is concrete and clever
─────────────────
TOTAL:             24/30

PASS: YES
```

### Top 3 Strengths

1. **The opening scenario is the best hook across all three chapters.** "They sound like AI" — three words that nail the problem. The progression from "not terrible" to "flat, generic" to "doesn't sound like you" is precise and recognizable. Any reader who has used AI for content creation will feel this.

2. **The "show, don't describe" design principle (line 70) is a strong, transferable idea.** "Three examples of your real writing teach Claude more about your voice than 500 words of rules describing your voice." This is the kind of insight the reader takes beyond this chapter and beyond this book.

3. **Step 6: The state-to-skill feedback loop (lines 254-262) elevates the chapter.** Instead of treating skills as static, it shows how corrections flow from state back into the skill, which improves the next draft, which reduces corrections. This is real systems thinking — components affecting each other across time.

### Top 3 Issues to Fix

1. **The skill file templates use placeholder text that may leave readers stuck (lines 109-148).** Phrases like `[Paste a paragraph from something you actually wrote...]` are helpful as guidance but the reader who doesn't have published writing will feel blocked. Add one sentence: "If you don't have published writing, use a long email, a detailed Slack message, or even a text you sent explaining something — anything that sounds like you." Remove the barrier.

2. **Automatic skill loading is undersold then oversold (lines 60-63).** The chapter says Claude "reads the description line from every skill at startup and decides when one matches" but then says "automatic loading works about half the time." This is honest but could undermine confidence. Restructure: lead with the reliable path (typing `/editorial-voice`), then mention auto-loading as a bonus that sometimes works. The current order — explain auto-loading, then say it's unreliable — creates unnecessary doubt.

3. **"Extend It" for Job Hunting and PM systems (lines 305-375) have the same repetition problem as Ch 5.** The career-profile skill is well done. The pm-methodology skill is fine but reads like a checklist being filled out rather than a build the reader experiences. Consider tightening PM to just the SKILL.md content and one sentence on what changes — the Content System deep build already taught the reader how skills work.

### AI Tells Found

None detected. No banned phrases found.

### Jargon Found (untranslated)

- **"context"** (line 12) — "It clogs the conversation with 2,000 words of examples before you even ask for anything" — the word "conversation" is fine, but later (line 395) "Claude's attention gets diluted" anthropomorphizes without translating. Consider: "the later sections get less influence on Claude's output."

---

## Chapter 7 — Hooks: Automated Guard Rails

### Score Card

```
Chapter: Ch 7 — Hooks
Date: 2026-05-06
Reviewer: book-editor

Clarity:           3/5  — Shell scripting is clearly explained line-by-line, but the technical complexity jumps significantly; non-technical readers may struggle with bash syntax, jq, exit codes, and JSON formatting
Systems Thinking:  4/5  — The Gate pattern connection is strong; the "most expensive mistake" test is a transferable framework for deciding what to automate
Voice:             4/5  — The opening scenario (fabricated Nexus Technologies credential) is vivid and specific; the voice stays human throughout the technical sections
Build Quality:     4/5  — Two complete, working hook scripts with line-by-line explanation, registration in settings.json, and three deliberate-failure tests
Progression:       4/5  — Adds exactly one component (hook), builds on skills and state from prior chapters, no forward references
Quality Gate:      4/5  — Five concrete checks including both positive (hooks catch bad input) and negative (hooks DON'T block good output) verification
─────────────────
TOTAL:             23/30

PASS: YES
```

### Top 3 Strengths

1. **The opening scenario is memorable and high-stakes.** The Nexus Technologies fabrication at 11pm on application seven is specific, visceral, and not hypothetical — it's exactly what Claude does. "You never worked at Nexus Technologies. You never led a data migration. That '73%' is fabricated." This lands.

2. **The line-by-line script walkthrough (lines 172-191) is the right approach for non-technical readers.** Explaining `#!/bin/bash` as "copy it and forget it" and `INPUT=$(cat)` as "captures the data Claude Code sends" meets the reader where they are. The plain-English translations are accurate without being condescending.

3. **The "Production Guard Rails" section (lines 311-319) is a well-placed glimpse forward.** The network engineering sanitization example shows what hooks become at scale without requiring the reader to build it. The detail about prepending a note so Claude doesn't re-flag the fake addresses is a genuinely interesting insight that rewards careful reading.

### Top 3 Issues to Fix

1. **Clarity drop at the shell scripting sections.** This is the most technically demanding chapter so far and the clarity score reflects it. Specific issues:
   - **Line 87-98: "install jq"** — the chapter assumes the reader has Homebrew on Mac. Many non-technical readers won't. Add: "If `brew` isn't recognized, visit https://jqlang.github.io/jq/download/ for other install options."
   - **Lines 132-169: The full verify-cover-letter.sh script** — while the line-by-line walkthrough is good, the script itself is 37 lines and uses `grep -oE`, `sed`, `sort -u`, pipe chains, and bash variable expansion. Non-technical readers will copy this successfully but won't understand it. That's acceptable — but say it explicitly: "You don't need to understand every character. Copy this exactly, and the walkthrough below explains what matters."
   - **Line 280: JSON formatting caveat** — "JSON is fussy about commas" is helpful but insufficient. Show a before (broken) and after (fixed) example of the most common mistake (trailing comma after last item).

2. **Inconsistency with Ch 6 skill file structure (line 424-430 "What You Built").** Chapter 6 builds skills as `skills/editorial-voice/SKILL.md` (folder with SKILL.md inside). Chapter 7's "What You Built" tree shows them as flat files: `skills/editorial-voice.md`. This will confuse readers who built Ch 6's structure. Also, `career-profile.md` in Ch 7's tree (line 428) doesn't match `career-profile/SKILL.md` from Ch 6. Pick one structure and be consistent. The Ch 6 structure (folders) matches how Claude Code actually works, so Ch 7's tree should be corrected.

3. **"Extend It" hooks for Study and PM systems (lines 326-400) are uneven.** The Study quiz-format hook gets a full script. The PM status-dates hook gets a description but NO script — just a paragraph. The Content quality hook gets a full script. Either give all three scripts or describe all three (with the reader building them as an exercise). The inconsistency makes the PM extension feel like an afterthought.

### AI Tells Found

None detected. No banned phrases from the voice.md list.

### Jargon Found (untranslated)

- **"exit code"** (lines 188-190) — explained functionally ("0 = allow, 2 = block") which is good, but the term "exit code" itself is never translated. Add: "an exit code is a number your script sends back to say what happened."
- **"shell script"** (line 57) — translated once as "a file with a few lines of instructions your computer can run" which is adequate.
- **"jq"** (line 87) — described as "a tool that reads structured data" but structured data is itself jargon. Try: "a small free program that extracts information from the data Claude Code sends to your hooks."
- **"chmod +x"** (line 195) — explained as "tell your computer this file is something it should run, not just read" which is good.
- **`>&2`** (line 189) — translated as "the error channel" but this is still jargon. Try: "which is how scripts send error messages back to the program that ran them."

---

## Cross-Chapter Notes

### Consistency Issues

1. **Skill file structure mismatch.** Ch 6 uses `skills/editorial-voice/SKILL.md` (folder structure). Ch 7 uses `skills/editorial-voice.md` (flat file). Must be reconciled — Ch 6's structure is correct per Claude Code conventions.

2. **"Extend It" section depth varies.** Ch 5 gives three full extension builds. Ch 6 gives three. Ch 7 gives two full scripts and one description-only. Standardize the depth. Recommendation: since the reader understands the pattern by Ch 7, all three extensions could be description-only with the script left as a reader exercise. This also shortens the chapter.

3. **The "name the gap" quality gate check** appears in all three chapters (Ch 5 line 365, Ch 6 line 489, Ch 7 line 517). This is a strong pattern — each chapter's final check has the reader articulate what's still missing and preview the next component. Keep this. It's one of the best progression devices in the book.

### Word Counts

- Ch 5: ~3,200 words — slightly over the 1,800-3,000 range from the checklist but acceptable for a first Act 2 chapter that establishes the pattern
- Ch 6: ~3,400 words — over range. The "Extend It" sections could be trimmed
- Ch 7: ~4,200 words — significantly over range. The shell scripting explanations are necessarily longer, but the "Extend It" sections and the "Production Guard Rails" digression could be tightened

### Overall Assessment

All three chapters pass. The writing is strong, the voice is clean, the systems thinking is genuine. The main pattern across all three: the deep builds on the primary system are excellent; the "Extend It" sections get progressively more repetitive and could be trimmed. Ch 7's clarity score is the weakest at 3/5 — the technical jump to shell scripting is real and the chapter handles it well but could do more to reassure the non-technical reader.

Priority fixes:
1. **Ch 7: Reconcile skill file structure** with Ch 6 (quick fix, high impact on reader trust)
2. **Ch 7: Add Homebrew fallback** and "you don't need to understand every character" reassurance (medium effort, high impact on clarity)
3. **All three: Consider trimming "Extend It" sections** to reduce repetition and bring word counts into range (medium effort, medium impact)
