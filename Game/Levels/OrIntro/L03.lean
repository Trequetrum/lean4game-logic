import Game.Metadata

open GameLogic

World "OrIntro"
Level 3
Title "Or Elimination"

NewTheorem GameLogic.or_elim
OnlyTactic
  exact
  «have»

Introduction "
# Party Games
Here's the deal. Ilyn and Cyna both said they're bringing board games and you're sure at least one of them is going to make it. So there's definitely board games at the party!
# Proposition Key:
- `B` — There will be boardgames at the party
- `C` — Cyna is coming to the party
- `I` — Ilyn is coming to the party
# Or Elimination
If you can conclude something from `A` and you can conclude the same thing from `B`, then if you know `A ∨ B` it won't matter which of the two happens as you can still guarentee something.
# You've unlocked `or_elim`
`or_elim` has three parameters:
1. takes evidence for a disjunction,
2. evidence an implication on the left,
3. evidence for an implication on the right.

`or_elim` is your first 3-paramater function. The associated proposition is `or_elim : (P ∨ Q) → (P → R) → (Q → R) → R`.
```
pvq: P ∨ Q
pr : P → R
qr : Q → R
have r : R := or_elim pvq pr qr
```
"

/-- `or_elim h₃ ... ...` -/
Statement (B C I : Prop)(h1 : C → B)(h2 : I → B)(h3 : C ∨ I) : B := by
  exact or_elim h3 h1 h2

Conclusion "
`or_elim` is your first 3-paramater function. The associated proposition is `or_elim : (P ∨ Q) → (P → R) → (Q → R) → R`
"
