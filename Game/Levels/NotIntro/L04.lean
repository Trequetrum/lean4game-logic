import Game.Metadata

open GameLogic

World "NotIntro"
Level 4
Title "Self Contradictory"

Introduction "
# Self Contradictory
Jason claims Bert is coming and Alan claims Bert is not coming. They can't both be right.
# Proposition Key:
- `B` — Bert is attending the party
"

/-- The law of non-self-contradiction -/
Statement (B : Prop) : ¬(B ∧ ¬B) := by
  exact λ(h : B ∧ ¬B) ↦ h.right h.left

Conclusion "
Well Concluded!
"
