# Analysis Task Template

**Use case**: Analyzing data and producing insights
**Difficulty**: 3/5 | **Effectiveness**: varies
**Best for**: Chapters 6, 10

## The Template

```
Context: I'm a [your role] analyzing [what data and why]. I need to [make a decision / report to someone / understand a trend].

Input: Read [filename.ext] in this folder. It's a [spreadsheet/CSV/data file] with these columns:
- [Column 1]: [what it contains]
- [Column 2]: [what it contains]
- [Column 3]: [what it contains]
There are approximately [N] rows covering [time period or scope].

Analysis: I need to understand:
1. [Specific question 1]
2. [Specific question 2]
3. [Specific question 3]

Output: Create [filename.ext] with:
- A summary tab with answers to my questions above
- [Any charts or visualizations needed]
- [Any specific calculations or groupings]

Important: Do NOT make up data that isn't in the source file. If a row has missing values, [skip it / note it / use the last known value].
```

## Example (Filled In)

```
Context: I'm a small business owner reviewing my spending for the last 6 months. I need to find subscriptions I'm paying for but not using, and see where my money is actually going.

Input: Read bank-statement-export.csv in this folder. It's a CSV export from my bank with these columns:
- Date: transaction date (MM/DD/YYYY)
- Description: merchant name and transaction details
- Amount: dollar amount (negative = charge, positive = deposit)
- Category: bank's auto-category (not always accurate)
There are approximately 800 rows covering November 2025 through April 2026.

Analysis: I need to understand:
1. What recurring charges am I paying monthly? List each with the monthly amount.
2. What are my top 5 spending categories by total amount?
3. Are there any subscriptions that appear to be duplicates or that I might have forgotten about?

Output: Create spending-analysis.xlsx with:
- Tab 1: "Recurring Charges" — all recurring subscriptions sorted by monthly cost
- Tab 2: "Spending by Category" — categories with totals and percentages, plus a bar chart
- Tab 3: "Potential Waste" — subscriptions that look like duplicates or unused services

Important: Do NOT make up data that isn't in the source file. If a transaction is ambiguous, add it to a "Needs Review" section at the bottom of the relevant tab.
```
