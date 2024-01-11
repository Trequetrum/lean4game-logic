import Game.Metadata

open GameLogic

World "AndTactic"
Level 7
Title "More Cases"

OnlyTactic
  assumption
  cases

Introduction "
# So Many Cases
Just keep picking the right hypothesis.
"

/-- Navigate the tree -/
Statement (P Q : Prop)(h: (Q ∧ (((Q ∧ P) ∧ Q) ∧ Q ∧ Q ∧ Q)) ∧ (Q ∧ Q) ∧ Q) : P := by
  cases h
  cases left
  cases right_1
  cases left
  cases left_2
  assumption
