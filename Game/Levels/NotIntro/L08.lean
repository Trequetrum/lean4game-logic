import Game.Metadata

World "NotIntro"
Level 8
Title "World 3, Level Seven"

Introduction "
# Allergy #1
Owing to his allergy, if Paul is present, there must be no avocado at the party. Which means that we cannot have both Paul and avacado at the party
# Proposition Key:
- `A` — There's avacado at the party
- `P` — Paul is attending the party
"

/-- Show ¬(P ∧ A) -/
Statement (A P : Prop) (h : P → ¬A) : ¬(P ∧ A) := by
  exact λpa ↦ h pa.left pa.right

Conclusion "
That's settled
"
