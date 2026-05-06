# Document Creation Template

**Use case**: Creating a new document from source materials
**Difficulty**: 2/5 | **Effectiveness**: varies
**Best for**: Chapters 5, 7, 8, 9

## The Template

```
Context: I'm a [your role] preparing a [document type] for [audience]. The tone should be [formal/casual/technical/conversational].

Input: Read the following files in this folder:
- [file1.ext] — [what it contains]
- [file2.ext] — [what it contains]
- [folder/] — [what's in it]

Output: Create a [format: Word doc, PDF, presentation] called [filename] with this structure:
1. [Section 1 name] — [what goes here, ~X paragraphs]
2. [Section 2 name] — [what goes here]
3. [Section 3 name] — [what goes here]

Formatting:
- [Any specific formatting requirements]
- [Font, headers, spacing preferences]

If anything is unclear: [Flag it with [NEEDS REVIEW] in the text / ask me / skip it].
```

## Example (Filled In)

```
Context: I'm a project manager preparing a status report for my director. The tone should be professional but concise — she reads 20 of these a week.

Input: Read the following files in this folder:
- meeting-notes-apr.docx — Notes from our 4 April team meetings
- sprint-board-export.csv — Our Jira sprint data for April
- risks.txt — My running list of project risks

Output: Create a Word document called "april-status-report.docx" with this structure:
1. Executive Summary — 3-4 sentences covering overall project health
2. Key Accomplishments — Bullet list of completed items from the sprint data
3. Risks & Blockers — Table with columns: Risk, Impact (High/Med/Low), Mitigation
4. Next Month — 3-5 priorities for May based on what's in progress

Formatting:
- Use headers for each section
- Keep the whole thing to 2 pages max

If anything is unclear: Flag it with [NEEDS INPUT] and keep going.
```
