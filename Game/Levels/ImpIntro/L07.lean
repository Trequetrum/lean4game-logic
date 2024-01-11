import Game.Metadata

open GameLogic

World "ImpIntro"
Level 7
Title "and_imp 2"

OnlyTactic
  exact
  «have»

Introduction "
# Un-Curry
If you've got chips, then if you've got dip, then you've got a popular party snack.\\
\\
Therefore, if you've got chips and dip, then you've got a popular party snack!
# Proposition Key:
- `C` — You've got chips
- `D` — You've got Dip
- `S` — You've got a popular party snack
"

/-- Conjunction interacting with implication -/
Statement (C D S: Prop) (h : C → D → S) : C ∧ D → S := by
  exact λ(cd: C ∧ D) ↦ h cd.left cd.right

example (C D S: Prop) (h : C → D → S) : C ∧ D → S := by
  exact λ⟨c, d⟩ ↦ h c d

Conclusion "
Cool. Chips and Dip for sure!
"
