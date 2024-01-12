import Game.Metadata

open GameLogic

World "IffTactic"
Level 2
Title "Conjuctive Iff"

OnlyTactic
  assumption
  cases
  constructor
  «repeat»

Introduction "
# Using Tactics
Last level you learned that `constructor` works for biconditionals in the the same way it works for conjunction. This level demonstrates that `cases` works the way you may expect as well.
"

Statement (P Q : Prop) (h : P ↔ ¬Q) : (P → ¬Q) ∧ (¬Q → P) := by
  cases h
  constructor
  repeat assumption
