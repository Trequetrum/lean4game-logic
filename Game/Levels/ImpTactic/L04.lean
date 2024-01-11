import Game.Metadata

open GameLogic

World "ImpTactic"
Level 4
Title "Apply Chain Reasoning"

OnlyTactic
  assumption
  apply
  intro

Introduction "
# More practise
This level will require `apply` again. Remember that it lets you reason backwards on the goal.
"

/-- Show that → is transitive -/
Statement (C A S: Prop) (h1 : C → A) (h2 : A → S) : C → S := by
  intro
  apply h2
  apply h1
  assumption
