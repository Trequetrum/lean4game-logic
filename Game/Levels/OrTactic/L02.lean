import Game.Metadata

open GameLogic

World "OrTactic"
Level 2
Title "Right Evidence"

NewTactic right
OnlyTactic
  assumption
  right

Introduction "
# `right` tactic
Can you guess how it works?
"

/-- Go Right -/
Statement (P Q : Prop)(h'₁ : Q) : P ∨ Q := by
  right
  assumption
