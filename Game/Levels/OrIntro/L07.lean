import Game.Metadata

World "OrIntro"
Level 7
Title "and distributes over or"

Introduction "
# A distribution of cookies
You can tell from the aroma that there are are gingersnap cookies. There's another smell there too. Could be shortbread cookies or sugar cookies.
# Proposition Key:
- G — They are gingersnap cookies
- H — They are shortbread cookies
- U — They are sugar cookies
"

/-- ∧ over ∨ -/
Statement (G H U : Prop)(h : G ∧ (H ∨ U)) : (G ∧ H) ∨ (G ∧ U) := by
  have hvu := h.right
  have ffh : H → (G ∧ H) ∨ (G ∧ U) :=
    λx ↦ or_inl ⟨h.left, x⟩
  have ffu : U → (G ∧ H) ∨ (G ∧ U) :=
    λx ↦ or_inr ⟨h.left, x⟩
  exact or_elim hvu ffh ffu

Conclusion "
Concluded
"
