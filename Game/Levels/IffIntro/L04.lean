import Game.Metadata

open GameLogic

World "IffIntro"
Level 4
Title "Iff_Intro"

OnlyTactic
  exact
  «have»

Introduction "
# Left-Hand Swap
You'll need `h1.mpr` in order to turn evidence for R into evidence for P
"

/-- Statement -/
Statement (P Q R : Prop) (h1 : P ↔ R)(h2 : P → Q) : R → Q := by
  exact h1.mpr ≫ h2
