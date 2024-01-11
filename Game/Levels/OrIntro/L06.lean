import Game.Metadata

open GameLogic

World "OrIntro"
Level 6
Title "or distributes over and"

OnlyTactic
  exact
  «have»

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
    λhu ↦ ⟨or_inr hu.left, or_inr hu.right⟩
  exact or_elim h fg fhu

example (G H U : Prop)(h : G ∨ H ∧ U) : (G ∨ H) ∧ (G ∨ U) := by
  exact or_elim h
    (λg ↦ ⟨or_inl g, or_inl g⟩)
    λhu ↦ ⟨or_inr hu.left, or_inr hu.right⟩

Conclusion "
As proof terms start getting bigger, it makes more sense to use Editor mode instead of typewritter mode.

----
```
exact or_elim h
  (λg ↦ ⟨or_inl g, or_inl g⟩)
  (λhu ↦ ⟨or_inr hu.left, or_inr hu.right⟩)
```
You can split this up a bit, but you'll need to write out a lot of propositions in full.
```
-- the case for g
have fg : G → (G ∨ H) ∧ (G ∨ U) :=
    λg ↦ ⟨or_inl g, or_inl g⟩

-- the case for H ∧ U
have fhu : H ∧ U → (G ∨ H) ∧ (G ∨ U) :=
    λhu ↦ ⟨or_inr hu.left, or_inr hu.right⟩

-- Finish it out with or_elim
exact or_elim h fg fhu
```
"
