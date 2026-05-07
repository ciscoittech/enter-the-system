# Chapter 13: Composing Systems

You spent 3 weeks studying distributed systems for a certification. Your Study System tracked every session. 14 quiz scores, concept maps, 8 topics at mastery level. You know this material cold.

Tuesday, your Content System asks you what to write about. You tell it "distributed systems for non-technical managers." Claude researches the topic from scratch: web search, source gathering, outline from zero. It doesn't know you just spent 3 weeks building deep expertise on this exact subject. That expertise is sitting in your study-state.md. Claude never sees it because the Content System and the Study System don't know each other exist.

Meanwhile, your Job Hunting System is tailoring a cover letter for a distributed systems role. It cites your certification progress: "currently studying for [cert]." It doesn't mention the 3 blog posts you published about distributed systems through the Content System, because it doesn't know about them. Published posts are stronger evidence than "currently studying."

Four systems. Four separate worlds. You're the integration layer, manually carrying information between them. That's the problem you built systems to solve in the first place.

---

## The Rules of Composition

Before you wire anything together, four constraints. Violate them and you end up with a fragile monolith instead of a connected network.

**Rule 1: Independence first.** Every system must work alone. If you unplug every cross-system connection, each system functions exactly as it did in Chapter 9. The connections are a bonus, not a dependency. You'll test this at the end of the chapter.

**Rule 2: Reference, don't merge.** You're not combining four state files into one mega-state. You're building an index that tells each system where to look for relevant context from the other systems. A card catalog, not a single giant book.

**Rule 3: Loose coupling.** System A can USE information from System B. System A cannot DEPEND on System B running first, running correctly, or running at all. If System B's state file is empty, System A works fine. It just doesn't have the bonus context.

**Rule 4: Start with two.** Don't wire all four systems together at once. Connect the two with the most obvious value. Prove it works. Then add the next connection.

---

*This is a preview. The full chapter continues with four composition patterns (Chain, Shared State, Shared Skills, Cross-system Hooks), hands-on wiring of the Study and Content systems, and a stress test where you unplug every connection to prove each system still works alone.*

**[Read the full book →](https://frontierengineering.dev/book)**

---

**What you'll build in this chapter:**
- Cross-system connections that let your Study expertise feed your Content pipeline and Job Hunting letters
- A master index that gives each system awareness of what the others have produced
- The discipline of loose coupling — systems that benefit from each other but never depend on each other

**Free preview:** [Act 1 (Chapters 1-3)](../ch01-draft.md) is free — start there.
