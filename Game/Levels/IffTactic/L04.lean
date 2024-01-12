import Game.Metadata

open GameLogic

World "IffTactic"
Level 4
Title "Iff_Intro"

OnlyTactic
  intro
  apply
  assumption

Introduction "
# Left-Hand Swap
"

Statement (P Q R : Prop) (h1 : P ↔ R)(h2 : P → Q) : R → Q := by
  intro r
  apply h2
  apply h1.mpr
  assumption
