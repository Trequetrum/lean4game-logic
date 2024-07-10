import Game.Metadata

open GameLogic

World "AndIntro"
Level 8
Title "Rearranging Boxes"

OnlyTactic
  exact
  «have»
TheoremTab "∧"

Introduction "
# BOSS LEVEL
If you can finish this level, you've certainly mastered the `∧`. There's no deep logical tricks in this boss level, you've just got to know how to work at properly unnesting and then building the right Proposition.\\
\\
Using the `have` tactic, you can break this task down into digestible chunks. The top right of the screen has a button that toggles between editor mode and typewriter mode. Editor mode is often a bit easier to work with as it allows you to enter multi-line expressions or edit earlier lines seamlessly. While in editor mode, the proof state will change depending on which line your caret is on.
# Rearranging Boxes
Finally, a bunch of your invites have returned with RSVPs. The mailman has delivered them in a big box. Make a list of the expected attendees so far.
# Proposition Key:
- A — **A**larfil is coming to the party
- C — **C**yna** is coming to the party
- I — **I**lyn** is coming to the party
- O — **O**rin** is coming to the party
- P — **P**ippin** is coming to the party
- S — **S**ybeth** is coming to the party
- U — **U**riel** is coming to the party
"

/-- Take apart and build evidence -/
Statement (A C I O P S U : Prop)(h: ((P ∧ S) ∧ A) ∧ ¬I ∧ (C ∧ ¬O) ∧ ¬U) : A ∧ C ∧ P ∧ S := by
  have psa := h.left
  have c := h.right.right.left.left
  have cps := and_intro c psa.left
  exact and_intro psa.right cps

Conclusion "
Amazing! You've mastered \"AND\".

---
```
-- 3/4 of the things you need are one step away
have psa := h.left

-- Evidence for C takes some digging
have c := h.right.right.left.left

-- build C ∧ P ∧ S
have cps := and_intro c psa.left

-- exhibit A ∧ C ∧ P ∧ S
exact and_intro psa.right cps
```
"
