import Game.Metadata

open GameLogic

World "ImpIntro"
Level 6
Title "and_imp"

OnlyTactic
  exact
  «have»

Introduction "
# Curry
If you've got chips and dip, then you've got a popular party snack! This is undeniable.\\
\\
Therefore if you've got chips, then if you've got dip, then you've got a popular party snack.
# Proposition Key:
- `C` — You've got chips
- `D` — You've got Dip
- `S` — You've got a popular party snack
"

/-- Conjunction interacting with implication -/
Statement (C D S: Prop) (h : C ∧ D → S) : C → D → S := by
  exact λc ↦ and_intro c ≫ h

example (C D S: Prop) (h : C ∧ D → S) : C → D → S := by
  exact λc d ↦ h (and_intro c d)

Conclusion "
Cool. Chips and Dip!

----
# A Tip!
If you're writing a function with more than one parameter, you can just list the parameters. That's a shorthand for nested function declarations.
```
λ(p : P) ↦ λ(q : Q) ↦ h (and_intro p q)
-- can be written as:
λ(p : P)(q : Q) ↦ h (and_intro p q)
-- Or because the propositions of p and
-- q are clear from the goal:
λp q ↦ h (and_intro p q)
```
"
