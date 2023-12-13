import Game.Metadata

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
"

/-- Commutativity of "`∨`" -/
Statement (C O : Prop)(h : C ∨ O) : O ∨ C := by
  exact or_elim h or_inr or_inl

Conclusion "
Well, done.
---
This one is nice becuase the `→`s you need already have names!
```
exact or_elim h or_inr or_inl
```
"
