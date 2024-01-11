import Game.Metadata

open GameLogic

World "IffTactic"
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
  exact λr ↦ h2 (h1.mpr r)

/-- Tactic Proof -/
example (P Q R : Prop) (h1 : P ↔ R)(h2 : P → Q) : R → Q := by
  intro r
  apply h2
  apply h1.mpr
  assumption
