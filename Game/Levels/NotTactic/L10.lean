import Game.Metadata

open GameLogic

World "NotTactic"
Level 10
Title "Conjunction Implicaiton"

OnlyTactic
  assumption
  intro
  apply
  constructor
  «repeat»

Introduction "
# Intro
Remember how `λx y ↦ ...` is just shorthand for `λx ↦ λy ↦ ...`? Well, the `intro` tactic admits the same shorthand:
```
intro p q
```
is just shorthand for
```
intro p
intro q
```
"

/-- Show P → ¬A. -/
Statement (P Q : Prop) (h: ¬(Q ∧ P)) : Q → ¬P := by
  intro p q
  apply h
  constructor
  repeat assumption

example (P Q : Prop) (h: ¬(Q ∧ P)) : Q → ¬P := by
  intro _ _
  apply h
  constructor <;> assumption
