import Game.Metadata

open GameLogic

World "NotTactic"
Level 2
Title "Contradiction"

NewTactic contradiction
OnlyTactic
  intro
  contradiction

Introduction "
# Contradiciton
This level introduces a relatively powerful tactic. Contradiction is a finishing tactic that will look through your assumptions and discharge some of the more obvious contradictions in order to solve any goal.\\
\\
examples:
  1. `h : False` says `h` is evidence for `False` which is a contradiction
  2. `h₁ : P` and `h₂ : ¬P` says that P is true and not true at the same time. This is also a contradiction.
"

/-- ¬S is enough to show S → B -/
Statement (P Q : Prop)(h'₁ : ¬P) : P → Q := by
  intro
  contradiction

example (P Q : Prop)(h'₁ : ¬P) : P → Q := by
  intro
  exfalso
  apply h'₁
  assumption
