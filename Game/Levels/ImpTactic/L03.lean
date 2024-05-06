import Game.Metadata

open GameLogic

World "ImpTactic"
Level 3
Title "Swapping"

OnlyTactic
  assumption
  constructor
  cases
  intro

Introduction "
# Nothing New
Just use what you know. Start with `intro` to give yourself an assumption to work with
"

/-- Show that ∧ is commutative -/
Statement (P Q: Prop) : P ∧ Q → Q ∧ P := by
  intro h
  cases h
  constructor
  assumption
  assumption
