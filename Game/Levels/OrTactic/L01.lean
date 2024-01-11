import Game.Metadata

open GameLogic

World "OrTactic"
Level 1
Title "Left Evidence"

NewTactic left
OnlyTactic
  assumption
  left

Introduction "
# `left` tactic
If your goal is a disjunction, `left` will change your goal to the left of that disjunction, ignoring the right.
"

/-- Go Left -/
Statement (P Q : Prop)(h'₁ : P) : P ∨ Q := by
  left
  assumption
