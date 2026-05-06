# /book-status Command

**Purpose**: Report overall book production progress.
**Usage**: `/book-status`

## What It Does

1. Read `book/book-state.md`
2. Count chapters by status:
   - Not started
   - Research done
   - Prompts curated
   - Drafted (with self-score)
   - Reviewed (with review score)
   - Published (moved to `published/`)
3. Calculate overall progress percentage
4. Identify bottlenecks (chapters blocking others)
5. Report prompt library stats (tested vs raw)

## Output

```
BOOK STATUS — [date]

Progress: X/16 chapters drafted, Y/16 reviewed, Z/16 published
Overall: XX%

PART I (Foundations):   [status bar]
PART II (Workflows):    [status bar]
PART III (Domain):      [status bar]
PART IV (Advanced):     [status bar]

Bottlenecks:
- Ch 03 not yet drafted — blocks all of Part II

Prompt Library: XX tested / YY raw / ZZ in chapters

Next action: [recommendation]
```
