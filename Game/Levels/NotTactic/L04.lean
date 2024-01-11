import Game.Metadata

open GameLogic

World "NotTactic"
Level 4
Title "Self Contradictory"

OnlyTactic
  intro
  cases
  apply
  assumption

Introduction "
# Self Contradictory
You start this level with the `intro` tactic. This will add an assumption to your proof state and change your goal to `False`.
"

/-- The law of non-self-contradiction -/
Statement (P : Prop) : ¬(P ∧ ¬P) := by
  intro pnp
  cases pnp
  apply right
  assumption

example (P : Prop) : ¬(P ∧ ¬P) := by
  intro ⟨p, np⟩
  contradiction
