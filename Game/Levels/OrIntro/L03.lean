import Game.Metadata

World "OrIntro"
Level 3
Title "World 4, Level 3"

NewDefinition or_elim

Introduction "
# Party Games
Here's the deal. Jaime and Alan both said they're bringing board games and you're sure at least one of them is going to make it. So there's definitely board games at the party!
# Proposition Key:
- `A` — Alan is coming to the party
- `B` — There will be boardgames at the party
- `J` — Jaime is coming to the party
# Or Elimination
If you can conclude something from `A` and you can conclude the same thing from `B`, then if you know `A ∨ B` it won't matter which of the two happens as you can still guarentee something.
# You've unlocked `or_elim`
`or_elim` has three parameters:
1. takes evidence for a disjunction,
2. evidence an implication on the left,
3. evidence for an implication on the right.
"

/-- `or_elim h₃ ... ...` -/
Statement (A B J : Prop)(h₁ : A → B)(h₂ : J → B)(h₃ : A ∨ J) : B := by
  exact or_elim h₃ h₁ h₂

Conclusion "
Concluded
"
