import Game.Metadata

open GameLogic

World "IffTactic"
Level 3
Title "Iff_mp"

OnlyTactic
  intro
  apply
  assumption

Introduction "
# Right-Hand Swap
"

Statement (P Q R  : Prop) (h1 : Q ↔ R)(h2 : P → Q) : P → R := by
  intro p
  apply h1.mp
  apply h2
  assumption
