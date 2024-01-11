import Game.Metadata

open GameLogic

World "OrTactic"
Level 6
Title "or distributes over and"

OnlyTactic
  assumption
  constructor
  cases
  left
  right

Introduction "
# Tactics All Day Long
"

/-- ∨ over ∧ -/
Statement (P Q R : Prop)(h : P ∨ Q ∧ R) : (P ∨ Q) ∧ (P ∨ R) := by
  cases h
  constructor
  left
  assumption
  left
  assumption
  cases h_1
  constructor
  right
  assumption
  right
  assumption
