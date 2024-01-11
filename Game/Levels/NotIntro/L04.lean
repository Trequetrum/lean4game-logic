import Game.Metadata

open GameLogic

World "NotIntro"
Level 4
Title "Self Contradictory"

OnlyTactic
  exact
  «have»

Introduction "
# Self Contradictory
Alarfil claims Lippa is coming and Cyna claims Lippa is not coming. They can't both be right.
# Proposition Key:
- `L` — **L**ippa is attending the party
"

/-- The law of non-self-contradiction -/
Statement (L : Prop) : ¬(L ∧ ¬L) := by
  exact λ(h : L ∧ ¬L) ↦ h.right h.left

Conclusion "
Well Concluded!
"
