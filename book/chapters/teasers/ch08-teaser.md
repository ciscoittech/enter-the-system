# Chapter 8: Connections — Your Systems Reach the Outside World

Your Study System is working. State file tracks your weak areas: networking at 62%, IAM at 68%, storage at 81%. The study-method skill calibrates explanations to how you learn. The quiz hook verifies every question has four options and one correct answer. You sit down for a Thursday evening session.

"Quiz me on VPC peering. I keep getting these questions wrong."

Claude pulls your state file, sees networking is flagged weak, loads your skill, and generates five questions. You take the quiz. Score: 3 out of 5. Claude updates your state. Same as last week.

Here's the problem. Those questions came from the same pool of knowledge Claude already has. Your notes are three months old. AWS released a new VPC feature last Tuesday that's already appearing on practice exams. A blog post on Medium explains peering better than anything in your study materials, using an analogy about apartment buildings that would have clicked for you immediately. A community site has 40 free practice questions specifically for the networking section of your exam.

Your system doesn't know any of that exists.

The state file knows you're weak on networking. The skill file knows you learn best through analogies. The hook verifies quiz quality. But none of those components can DO anything about the weakness except re-quiz you on the same material. The system can only work with what you've already given it. And you're the bottleneck. The only way new information gets in is if you find it yourself, copy it, and paste it into a file.

You could spend 30 minutes searching for better material, formatting it, and saving it where Claude can find it. But that's you doing the research manually. That's exactly the kind of work you built the system to handle.

What you need: the system goes out and GETS information. Searches the web for better explanations. Pulls your course materials from wherever you keep them. Finds practice resources you didn't know existed. The system becomes a researcher, not just a tutor.

---

*This is a preview. The full chapter continues with adding web search to your Study System, connecting to external data sources, and building a system that finds better material for your weak areas without you lifting a finger.*

**[Read the full book →](https://frontierengineering.dev/book)**

---

**What you'll build in this chapter:**
- A web search connection that lets your Study System find current material for your weakest topics
- Source verification hooks that check whether search results are credible before the system uses them
- A system that actively researches on your behalf instead of waiting for you to paste in content

**Free preview:** [Act 1 (Chapters 1-3)](../ch01-draft.md) is free — start there.
