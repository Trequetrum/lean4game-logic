import Game.Metadata

open GameLogic

World "NotIntro"
Level 10
Title "Conjunction Implicaiton"

Introduction "
# Allergy #2
We cannot have both Pippin and avacado at the party. Which means that if Pippin is attending, then there will not be any avacado.
# Proposition Key:
- `A` — There's avacado at the party
- `P` — Pippin is attending the party
"

/-- Show P → ¬A. -/
Statement (A P : Prop) (h: ¬(P ∧ A)) : P → ¬A := by
  exact λ(p: P)(a : A) ↦ h (and_intro p a)

Conclusion "
That's settled... again!

----
Reminder that these are the same:
```
λp ↦ λa ↦ h ⟨p,a⟩
-- and
λp a ↦ h ⟨p,a⟩
```
"
