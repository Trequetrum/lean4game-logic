import Game.Metadata

World "ImpIntro"
Level 7
Title "and_imp 2"

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

/-- Conjunction interacting with implication --/
Statement (P Q R: Prop) (h : P → Q → R) : P ∧ Q → R := by
  exact λ(pq: P ∧ Q) ↦ h pq.left pq.right

Conclusion "
Cool. Chips and Dip for sure!
"
