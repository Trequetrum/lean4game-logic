import Game.Metadata

open GameLogic

World "ImpTactic"
Level 6
Title "repeat combinator"

NewTactic «repeat»

OnlyTactic
  assumption
  constructor
  apply
  intro
  «repeat»

Introduction "
# The `repeat` tactic combinator
Sometimes you'll find you need to use the same tactic a few times in a row. Any tactic can be repeated (until it fails) using the `repeat`.\\
\\
In this level, it's very like that you'll be building a conjunction from two assumptions already available in your proof state. Once you make it that far, instead of writting
```
constructor
assumption
assumption
```
try this instead
```
constructor
repeat assumption
```
"

/-- repeat assumption -/
Statement (P Q R: Prop) (h : P ∧ Q → R) : P → Q → R := by
  intro p
  intro q
  apply h
  constructor
  repeat assumption

/-- Tactic Proofs -/
example (P Q R: Prop) (h : P ∧ Q → R) : P → Q → R := by
  intro p
  exact and_intro p ≫ h

example (P Q R: Prop) (h : P ∧ Q → R) : P → Q → R := by
  intro p
  have h2 : Q → P ∧ Q := and_intro p
  have h3 : Q → R     := h2 ≫ h
  assumption

example (P Q R: Prop) (h : P ∧ Q → R) : P → Q → R := by
  intro _ _
  apply h
  constructor <;> assumption
