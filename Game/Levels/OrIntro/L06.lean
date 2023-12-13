import Game.Metadata

World "OrIntro"
Level 6
Title "or distributes over and"

Introduction "
# A distribution of cookies
You can tell the cookies are either gingersnap cookies or they're a mix of shortbread cookies and sugar cookies.
# Proposition Key:
- G — They are gingersnap cookies
- H — They are shortbread cookies
- U — They are sugar cookies
"

/-- ∨ over ∧ -/
Statement (G H U : Prop)(h : G ∨ H ∧ U) : (G ∨ H) ∧ (G ∨ U) := by
  have fg : G → (G ∨ H) ∧ (G ∨ U) :=
    λg ↦ ⟨or_inl g, or_inl g⟩
  have fhu : H ∧ U → (G ∨ H) ∧ (G ∨ U) :=
    λhu ↦ ⟨or_inr hu.left,or_inr hu.right⟩
  exact or_elim h fg fhu

Conclusion "
Concluded
"
