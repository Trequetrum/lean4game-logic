import Game.Metadata

open GameLogic

World "OrIntro"
Level 4
Title "Or is Commutative"

Introduction "
# Either way.
Chocolate chip oatmeal cookies, which ingredient goes first?
1. Oatmeal or chocolate chips?
2. Chocolate chips or oatmeal?
# Proposition Key:
C — Chocolate chips
O — Oatmeal

This time they're not under assumptions, but you have the evidence in your inventory.
- `or_inr : C → O ∨ C`
- `or_inl : O → O ∨ C`
"

/-- Commutativity of "`∨`" -/
Statement (C O : Prop)(h : C ∨ O) : O ∨ C := by
  exact or_elim h or_inr or_inl

Conclusion "
Well, done.

---
```
exact or_elim h or_inr or_inl
```
"
