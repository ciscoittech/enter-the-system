# Multi-Step Workflow Template

**Use case**: Projects requiring multiple deliverables or phases
**Difficulty**: 4/5 | **Effectiveness**: varies
**Best for**: Chapters 13, 14

## The Template

```
Context: I'm a [your role] working on [project]. This involves multiple deliverables that build on each other. The final result needs to be ready by [when] for [audience].

Input: This folder contains:
- [folder/files description 1]
- [folder/files description 2]
- [any reference templates or examples]

Project goal: [One sentence describing the complete outcome]

Deliverables (in order):
1. [Deliverable 1] — [format, filename, what it includes]
   Source: [which input files to use]
2. [Deliverable 2] — [format, filename, what it includes]
   Source: [which input files + deliverable 1]
3. [Deliverable 3] — [format, filename, what it includes]
   Source: [which input files + prior deliverables]

Checkpoints: After completing each deliverable, pause and show me what you've created before moving to the next one.

Quality checks:
- [Specific thing to verify across all deliverables]
- [Consistency requirement]

If anything is unclear: Ask me before proceeding — don't guess on multi-step work.
```

## Example (Filled In)

```
Context: I'm an HR coordinator building an onboarding package for new hires starting June 1. This involves several documents that reference each other. The package needs to be ready by May 25 for the hiring manager to review.

Input: This folder contains:
- policies/ — Current company policy documents (handbook, PTO policy, benefits overview)
- templates/ — Previous onboarding docs from last quarter (may be outdated)
- new-hire-info.txt — Names, roles, start dates, and managers for the 3 new hires

Project goal: A complete onboarding package with personalized welcome docs, a first-week schedule, and a reference guide.

Deliverables (in order):
1. Welcome letter — Word doc for each new hire, personalized with their name, role, and manager. Warm, professional tone. Filename: welcome-[firstname].docx
   Source: new-hire-info.txt, previous templates for format
2. First-week schedule — Spreadsheet with hour-by-hour schedule for days 1-5. Same for all hires except the role-specific training block. Filename: first-week-schedule.xlsx
   Source: previous templates, policies/ for required training topics
3. Quick reference guide — One-page PDF with key info: IT helpdesk contact, WiFi password placeholder, building map placeholder, PTO request process, benefits enrollment deadline.
   Source: policies/ folder for accurate info

Checkpoints: After completing each deliverable, pause and show me what you've created before moving to the next one.

Quality checks:
- All three new hires' names and roles are correct across all documents
- Policy references match the current versions in policies/
- No placeholder text left in final versions (except WiFi password and building map, which I'll fill in)

If anything is unclear: Ask me before proceeding — don't guess on multi-step work.
```
