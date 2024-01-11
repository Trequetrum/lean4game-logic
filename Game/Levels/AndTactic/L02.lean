import Game.Metadata

open GameLogic

World "AndTactic"
Level 2
Title "Constructor"

NewTactic constructor

OnlyTactic
  assumption
  constructor

Introduction "
# Constructor
Whenever there's a clear way to create new evidence **that matches the goal**, the constructor tactic will pick that for you. This replaces the current goal with one or more goals that together complete the construction.\\
\\
For this level, your goal is `P ∧ Q`. The `constructor` tactic will replace that goal with two separate subgoals. This is likely the first time you've seen two goals in your proof state. First you'll need to show evidence for `P`, then you'll need to show evidence for `Q`.
"

/-- Use the constructor tactic -/
Statement (P Q : Prop)(h'₁ : P)(h'₂ : Q) : P ∧ Q := by
  constructor
  assumption
  assumption
