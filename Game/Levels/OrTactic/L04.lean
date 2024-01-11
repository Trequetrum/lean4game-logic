import Game.Metadata

open GameLogic

World "OrTactic"
Level 4
Title "Or is Commutative"

OnlyTactic
  assumption
  cases
  right
  left

Introduction "
# Cases again
Similar to last level.
"

/-- Commutativity of “`∨`” -/
Statement (P Q : Prop)(h : P ∨ Q) : Q ∨ P := by
  cases h
  right
  assumption
  left
  assumption
