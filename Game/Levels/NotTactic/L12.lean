import Game.Metadata

open GameLogic

World "NotTactic"
Level 12
Title "Not Tactics Boss"

OnlyTactic
  assumption
  intro
  apply
  exfalso
  contradiction

Introduction "
# The Final “Redux: ¬ World Tactics” level
"

Statement (B C : Prop) (h : ¬(B → C)) : ¬¬B := by
  intro nb
  apply h
  intro b
  exfalso
  apply nb
  assumption

example (B C : Prop) (h : ¬(B → C)) : ¬¬B := by
  intro nb
  apply h
  intro b
  contradiction
