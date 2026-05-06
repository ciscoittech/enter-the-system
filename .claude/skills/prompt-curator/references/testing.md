# Prompt Testing Protocol

## Test Each Prompt Against These Criteria

### 1. Clarity Test
- Can a non-technical person understand what to type?
- Are there ambiguous instructions? ("organize appropriately" — what does that mean?)
- Does it use jargon the reader won't know?

### 2. Completeness Test (4-Part Formula)
- [ ] **Context**: Does it tell Claude who the user is / what this is for?
- [ ] **Input**: Does it describe what Claude should read?
- [ ] **Output**: Does it specify what the deliverable looks like?
- [ ] **Exceptions**: Does it handle unclear/missing data?

Missing parts? Add them and re-test.

### 3. Output Verification
- What does Claude actually produce with this prompt?
- Is the output useful as-is, or does it need significant rework?
- Does the output match what the prompt asked for?

### 4. Failure Mode Test
- What happens with messy or incomplete input data?
- What happens if the folder has unexpected file types?
- Does Claude make up data that wasn't in the source?
- Does Claude ask clarifying questions or just guess?

### 5. Audience Fit Test
- Would a non-technical knowledge worker understand the prompt?
- Would they understand the output?
- Is the prompt under ~200 words? (longer = readers won't use it)

## Test Result Template

```markdown
**Prompt**: [name]
**Tested**: [date]
**Clarity**: [pass/fail + notes]
**Completeness**: [which parts present/missing]
**Output quality**: [description of what Claude produced]
**Failure modes**: [what went wrong with edge cases]
**Audience fit**: [pass/fail + notes]
**Verdict**: [INCLUDE / ADAPT / EXCLUDE]
**Adaptation notes**: [what to change if ADAPT]
```
