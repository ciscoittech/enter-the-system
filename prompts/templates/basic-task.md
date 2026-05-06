# Basic Task Template

**Use case**: Simple, single-step Cowork tasks
**Difficulty**: 1/5 | **Effectiveness**: varies
**Best for**: Chapters 2-4

## The Template

```
Context: I'm a [your role] working on [project/area]. This folder contains [description of what's in the folder].

Input: Read the [specific files or file types] in this folder. They are [format: spreadsheets, Word docs, PDFs, text files].

Output: Create a [deliverable type] called [filename] that includes:
- [Specific element 1]
- [Specific element 2]
- [Specific element 3]

If anything is unclear or missing: [skip it / ask me / make a note in the output / use your best judgment].
```

## How to Use This Template

1. Replace everything in [brackets] with your specifics
2. Be as concrete as possible in the Output section
3. The "If anything is unclear" section prevents Claude from guessing when it shouldn't

## Example (Filled In)

```
Context: I'm an office manager organizing end-of-quarter files. This folder contains invoices, receipts, and expense reports from Q1.

Input: Read all the PDF and image files in this folder. They are scanned invoices and receipts from various vendors.

Output: Create a spreadsheet called "Q1-expenses-summary.xlsx" that includes:
- One row per invoice/receipt
- Columns: Date, Vendor, Amount, Category (office supplies, software, travel, other)
- A summary row at the bottom with totals per category

If anything is unclear or missing: Add a row anyway and put "UNCLEAR" in the column you couldn't fill. Don't skip any document.
```
