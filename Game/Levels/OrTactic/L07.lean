import Game.Metadata

open GameLogic

World "OrTactic"
Level 7
Title "and distributes over or"

OnlyTactic
  assumption
  constructor
  cases
  left
  right
  «repeat»

Introduction "
# Tactics, Tactics, Tactics
"

/-- ∧ over ∨ -/
Statement (P Q R : Prop)(h : P ∧ (Q ∨ R)) : (P ∧ Q) ∨ (P ∧ R) := by
  cases h
  cases right
  left
  constructor
  repeat assumption
  right
  constructor
  repeat assumption
