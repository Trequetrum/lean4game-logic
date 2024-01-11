import Game.Metadata

open GameLogic

World "OrTactic"
Level 5
Title "Old Hat"

NewTheorem GameLogic.or_comm
OnlyTactic
  assumption
  apply
  left
  right

Introduction "
# Old Hat
You've got this.
"

/-- Implication across ∨ -/
Statement (P Q R : Prop)(h1 : P → Q)(h2 : P ∨ R) : Q ∨ R := by
  cases h2
  left
  apply h1
  assumption
  right
  assumption
