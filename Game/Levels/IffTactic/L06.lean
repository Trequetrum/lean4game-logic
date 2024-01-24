import Game.Metadata

namespace GameLogic

World "IffTactic"
Level 6
Title "Rewriting"

OnlyTactic
  assumption
  intro
  apply

Introduction "
# Remember to use `or_assoc` and `and_assoc`
Even without the `rw` tactic, this can be solved in a few lines.
"

Statement (P Q R : Prop) (h : P ∨ Q ∨ R → ¬(P ∧ Q ∧ R)) : (P ∨ Q) ∨ R → ¬((P ∧ Q) ∧ R) := by
  intro _ _
  apply h
  apply or_assoc.mp
  assumption
  apply and_assoc.mp
  assumption
