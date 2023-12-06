import Game.Metadata

World "NotIntro"
Level 3
Title "Self Contradictory"

Introduction "
# Self Contradictory
Jason claims Bert is coming and Alan claims Bert is not coming. They can't both be right.
# Proposition Key:
- `B` — Bert is attending the party
"

/-- not not introduction. -/
Statement (B : Prop) : ¬(B ∧ ¬B) := by
  exact λh ↦ h.right h.left

Conclusion "
Well Concluded!
"
