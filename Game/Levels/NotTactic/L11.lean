import Game.Metadata

open GameLogic

World "NotTactic"
Level 11
Title "not_not_not"

OnlyTactic
  assumption
  intro
  apply

Introduction "
# False
Once your goal is false, then you can `apply h`
"

/-- ¬A is stable. -/
Statement (P : Prop)(h : ¬¬¬P) : ¬P := by
  intro
  apply h
  intro np
  apply np
  assumption
