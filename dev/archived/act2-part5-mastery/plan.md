# Act 2 Part V: Mastery (Ch 12-13)

## Goal

Reader learns to debug failures and compose multiple systems into a personal AI operating system. No new components — mastery of what's built.

## Chapters

- **Ch 12** (Debugging): Every failure maps to a component. Symptom → component → isolate → fix → add check. Debug scenarios for all 4 systems. NOT maintenance (that's taught per-component in Ch 5, 7, 8, 10, 11). This chapter is about fixing what breaks, not preventing drift.
- **Ch 13** (Composition): Wire systems together. Shared state (master index pointing to individual state files). Shared skills (voice skill loads into any system that writes). Cross-system hooks. Chain pattern (System A output → System B input). Reader picks 3 of their systems and connects them.

## Dependencies

- Part IV (Ch 10-11) must be complete — reader needs all 6 components
- Systems-thinking source material (Meadows, Goldratt) — useful for Ch 12 debugging mental model but not blocking
- All eval notebooks should be run by this point

## Quality Gate

- Both chapters score ≥ 20/30
- Ch 12: Reader can diagnose a failure without adding prompt complexity
- Ch 13: Reader's composed system works for a full work week
- Each system still works independently when disconnected
