import Game.Metadata

open GameLogic

World "NotTactic"
Level 5
Title "Modus Tollens"

OnlyTactic
  intro
  apply
  assumption

Introduction "
# Modus Tollens
By now you're getting used to using `intro` and `apply` on negated propositions. Keep it up!
"

/-- Modus Tollens. -/
Statement (P Q : Prop)(h1 : P → Q)(h2 : ¬Q) : ¬P := by
  intro
  apply h2
  apply h1
  assumption
