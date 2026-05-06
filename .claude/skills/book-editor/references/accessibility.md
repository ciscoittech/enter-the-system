# Accessibility Rules for Non-Technical Audience

## The Reader Profile

- Uses a computer daily for work (email, spreadsheets, documents, presentations)
- Has never used a command line or terminal
- May have tried ChatGPT but found it hit-or-miss
- Doesn't know what "AI" means technically — just knows it's the thing that writes text
- Skeptical of hype, responsive to practical results
- Time-poor — will not read a chapter that doesn't deliver value by the end

## Writing Rules

### Always Do
- Describe what to click, not what concept to apply
- "Click the blue 'Work in a Folder' button" not "Initialize a workspace"
- Include what the screen looks like after each action
- Use screenshots or describe the visual result explicitly
- Explain what Claude is doing while it works ("You'll see Claude reading through your files — this takes about 2 minutes for a typical folder")
- Give time estimates ("This usually takes 3-5 minutes")

### Never Do
- Assume they know what a file extension means (say "spreadsheet files" not ".csv files")
- Use code blocks for anything the reader types (use quoted text or highlighted blocks)
- Reference other AI tools without explanation ("Unlike GPT..." — they may not use GPT)
- Skip the "why" — always explain why a step matters, briefly
- Use keyboard shortcuts without also explaining the menu path

### Error Recovery
- Every walk-through should include at least one "If this happens..." recovery step
- Common situations to cover:
  - Claude asks for permission (explain what to click)
  - Claude produces the wrong thing (explain how to tell Claude to try again)
  - Claude takes too long (explain that the app needs to stay open)
  - Claude makes something up (explain how to verify)

### Emotional Accessibility
- Never make the reader feel stupid for not knowing something
- "If you haven't used this before, here's what to expect" not "For beginners..."
- Normalize confusion: "The first time is always the slowest. By your third file organization, you'll do this in 2 minutes."
- Celebrate small wins: "That's it. You just did in 4 minutes what would have taken an hour."
