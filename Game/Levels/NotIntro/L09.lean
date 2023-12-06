import Game.Metadata

World "NotIntro"
Level 9
Title "World 3, Level Eight"

Introduction "
# Allergy #2
We cannot have both Paul and avacado at the party. Which means that if Paul is attending, then there will not be any avacado.
# Proposition Key:
- `A` — There's avacado at the party
- `P` — Paul is attending the party
"

/-- Show P → ¬A. -/
Statement (A P : Prop) (h: ¬(P ∧ A)) : P → ¬A := by
  exact λp a ↦ h ⟨p,a⟩

Conclusion "
Concluding text ???

----
Reminder that these are the same:
```
λp ↦ λa ↦ h ⟨p,a⟩
-- and
λp a ↦ h ⟨p,a⟩
```
"
