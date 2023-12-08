import Game.Metadata

World "AndIntro"
Level 8
Title "Rearranging Boxes"

Introduction "
# BOSS LEVEL
If you can finish this level, you've certainly mastered the `∧`. There's no deep logical tricks in this boss level, you've just got to know how to work at properly unnesting and then building the right Proposition.\\
\\
Using the `have` tactic, you can break this task down into digestible chunks. The top right of the screen has a button that toggles between editor mode and typewritter mode. Editor mode is often a bit easier to work with as it allows you to enter multi-line expressions or edit earlier lines seamlessly.
# Rearranging Boxes
Finally, a bunch of your invites have returned with RSVPs. The mailman has delivered them in a big box. Make a list of the expected attendees so far.
# Proposition Key:
- A — J**a**son is coming to the party
- I — Ja**i**me is coming to the party
- L — A**l**an is coming to the party
- O — J**o**rdan is coming to the party
- P — **P**aul is coming to the party
- S — **S**arah is coming to the party
- U — J**u**stin is coming to the party
"

NewTactic «have»

/-- Take apart and build evidence -/
Statement (A I L O P S U : Prop)(h: ((P ∧ S) ∧ A) ∧ ¬I ∧ (L ∧ ¬O) ∧ ¬U) : A ∧ L ∧ P ∧ S := by
  have psa := h.left
  have l := h.right.right.left.left
  have lps := and_intro l psa.left
  exact and_intro psa.right lps

Conclusion "
Amazing! You've mastered \"AND\".

---
```
-- 3/4 of the things you need are one step away
have psa := h.left

-- Evidence for L takes some digging
have l := h.right.right.left.left

-- build L ∧ P ∧ S
have lps := and_intro l psa.left

-- exibit A ∧ L ∧ P ∧ S
exact and_intro psa.right lps
```
"
