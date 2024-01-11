import Game.Metadata

open GameLogic

World "NotTactic"
Level 7
Title "Negation"

OnlyTactic
  intro
  apply
  assumption

Introduction "
# Anonymous intro
You've likely tried this already, but you can use `intro` without following it with any identifiers.
"

Statement (P Q : Prop) (h: ¬(P → Q)) : ¬Q := by
  intro
  apply h
  intro
  assumption
