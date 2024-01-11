import Game.Metadata

open GameLogic

World "NotTactic"
Level 9
Title "Implies a Negation"

OnlyTactic
  assumption
  cases
  intro
  apply
  «repeat»

Introduction "
# Enjoy ⌣
"

/-- Show ¬(P ∧ A) -/
Statement (P Q : Prop) (h : Q → ¬P) : ¬(Q ∧ P) := by
  intro qp
  cases qp
  apply h
  repeat assumption

example (P Q : Prop) (h : Q → ¬P) : ¬(Q ∧ P) := by
  intro ⟨_, _⟩
  apply h
  repeat assumption

Conclusion "
Did you use `intro ⟨p, a⟩` this time?
"
