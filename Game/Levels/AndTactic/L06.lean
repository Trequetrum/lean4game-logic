import Game.Metadata

open GameLogic

World "AndTactic"
Level 6
Title "Nothing New"

OnlyTactic
  assumption
  constructor
  cases

Introduction "
# Nothing New
Just use what you've been taught.
"

/-- Combining your new tactics -/
Statement (P Q R S : Prop)(h1 : P ∧ Q)(h2 : R ∧ S) : P ∧ S := by
  cases h1
  cases h2
  constructor
  assumption
  assumption
