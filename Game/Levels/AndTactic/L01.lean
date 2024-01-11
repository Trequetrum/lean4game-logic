import Game.Metadata

open GameLogic

World "AndTactic"
Level 1
Title "Assumption"

NewTactic assumption

OnlyTactic assumption

Introduction "
# `assumption`
If the evidence you want is in your list of **Assumptions**, the `assumption` tactic will finish the level for you.
"

/-- Use the assumption tactic -/
Statement (P : Prop)(h'₁ : P) : P := by
  assumption
