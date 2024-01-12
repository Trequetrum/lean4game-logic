import Game.Metadata

open GameLogic

World "IffIntro"
Level 3
Title "Iff_mp"

OnlyTactic
  exact
  «have»

Introduction "
# Right-Hand Swap
You'll need h1.mp in order to turn evidence for Q into evidence for R
"

/-- Statement -/
Statement (P Q R  : Prop) (h1 : Q ↔ R)(h2 : P → Q) : P → R := by
  exact h2 ≫ h1.mp
