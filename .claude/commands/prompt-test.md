# /prompt-test Command

**Purpose**: Test a specific Cowork prompt and document the results.
**Usage**: `/prompt-test "organize my downloads folder by file type"`

## What It Does

1. Take the prompt as input
2. Analyze against the 4-part formula — which parts are present/missing?
3. Assess what Cowork would produce with this prompt
4. Identify failure modes (what could go wrong)
5. Rate difficulty (1-5) and effectiveness (1-5)
6. Suggest improvements to make the prompt stronger
7. Document the full result

## Output

Printed directly (not saved unless user requests):

```
PROMPT TEST RESULTS

Original: "[the prompt]"

4-Part Formula Check:
  Context:    [present/missing]
  Input:      [present/missing]
  Output:     [present/missing]
  Exceptions: [present/missing]

Expected Output: [what Claude would produce]

Failure Modes:
  - [what could go wrong]

Difficulty: X/5  |  Effectiveness: X/5

Improved Version:
[the prompt rewritten with all 4 parts]
```

## When to Use

- Testing a community prompt before including it in the book
- Testing a reader-submitted prompt
- Verifying a prompt from a chapter draft actually works
