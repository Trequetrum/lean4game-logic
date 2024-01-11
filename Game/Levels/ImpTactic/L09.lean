import Game.Metadata

open GameLogic

World "ImpTactic"
Level 9
Title "Implication Tactic Boss"

OnlyTactic
  assumption
  constructor
  intro

Introduction "
# World's End
The home stretch, you can do it!
"

/-- `Q → (P → Q) ∧ (¬P → Q)` -/
Statement (P Q : Prop) : Q → (P → Q) ∧ (¬P → Q) := by
  intro
  constructor
  intro; assumption
  intro; assumption

Conclusion "
This set of tactic-based levels is complete!
"
