import Game.Metadata

open GameLogic

World "OrTactic"
Level 8
Title "The Implication"

OnlyTactic
  assumption
  constructor
  cases
  left
  right
  apply
  intro

Introduction "
# Final `∨` Tactic Level
This level uses most of the tactics you've learned so far.
"

/-- Implication of ∨ -/
Statement (P Q R : Prop)(h : Q → R) : Q ∨ P → P ∨ R := by
  intro qp
  cases qp
  right
  apply h
  assumption
  left
  assumption
