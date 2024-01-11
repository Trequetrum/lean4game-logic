import Game.Metadata

open GameLogic

World "ImpTactic"
Level 8
Title "Distribute"

OnlyTactic
  assumption
  constructor
  cases
  apply
  intro

Introduction "
# Keep it up
"

/-- `(P → Q) ∧ (P → R) → P → Q ∧ R` -/
Statement (P Q R : Prop) (h : (P → Q) ∧ (P → R)) : P → Q ∧ R := by
  intro
  cases h
  apply and_intro
  apply left
  assumption
  apply right
  assumption

example (P Q R : Prop) (h : (P → Q) ∧ (P → R)) : P → Q ∧ R := by
  intro
  cases h
  constructor
  apply left
  assumption
  apply right
  assumption
