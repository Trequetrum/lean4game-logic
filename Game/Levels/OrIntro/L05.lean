import Game.Metadata

open GameLogic

World "OrIntro"
Level 5
Title "Carry On Effects"

Introduction "
# Carry On Effects
If the cake arrives, then everybody will rejoice. Either the cake arrives or you get a refund. Therefore, either everybody will rejoice or you get a refund! That's a win-win situation.
# Proposition Key:
C — The cake arrives
J — Everybody is joyfull
R — You get a refund
"

/-- Implication across ∨ -/
Statement (C J R : Prop)(h₁ : C → J)(h₂ : C ∨ R) : J ∨ R := by
  exact or_elim h₂ (h₁ ≫ or_inl) or_inr

Conclusion "
Well done, you're getting good at this!
"
