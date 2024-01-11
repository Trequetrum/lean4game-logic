import Game.Metadata

open GameLogic

World "AndTactic"
Level 3
Title "Practise Makes Perfect"

OnlyTactic
  assumption
  constructor

Introduction "
# Practise Makes Perfect
You only have `assumption` and `constructor` available to you. Figure out the order you need to enter them in.
"

/-- Repeat constructor/assumption until you're done -/
Statement (P Q R S : Prop)(h'₁ : P)(h'₂ : Q)(h'₃ : R)(h'₄ : S) : (P ∧ Q) ∧ R ∧ S := by
  constructor
  constructor
  assumption
  assumption
  constructor
  assumption
  assumption


/-- Tactic Proof -/
example (P Q R S : Prop)(h'₁ : P)(h'₂ : Q)(h'₃ : R)(h'₄ : S) : (P ∧ Q) ∧ R ∧ S := by
  repeat (first | constructor | assumption)
