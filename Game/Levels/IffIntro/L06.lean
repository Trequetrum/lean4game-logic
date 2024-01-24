import Game.Metadata

namespace GameLogic

World "IffIntro"
Level 6
Title "Rewriting"

NewTheorem
  GameLogic.and_assoc
  GameLogic.or_assoc
OnlyTactic
  exact
  «have»
  rw
  «repeat»
  nth_rewrite

Introduction "
# Keep rewriting!
It's another round of the resistance! This time you know that if you could prove that Alarfil, Cyna, or Lippa are part of the resistance, then that would be good enough to show that least one of the other two are spies.\\
\\
It doesn't really matter how your friends are paired up, the same truth will hold.
# Proposition Key:
- A — Alarfil is a member of the resistance
- C — Cyna is a member of the resistance
- L — Lippa is a member of the resistance
## new theorems
Two new theorems have been unlocked for this level. We'll make you prove them later — though I imagine they make a certain amount of intuitive sense regardless.
1. `or_assoc : P ∨ Q ∨ R ↔ (P ∨ Q) ∨ R`
2. `and_assoc : P ∧ Q ∧ R ↔ (P ∧ Q) ∧ R`
"

/-- Exactly 2 rewrites -/
Statement (P Q R : Prop) (h : P ∨ Q ∨ R → ¬(P ∧ Q ∧ R)) : (P ∨ Q) ∨ R → ¬((P ∧ Q) ∧ R) := by
  rw [or_assoc, and_assoc]
  exact h

example (P Q R : Prop) (h : P ∨ Q ∨ R → ¬(P ∧ Q ∧ R)) : (P ∨ Q) ∨ R → ¬((P ∧ Q) ∧ R) := by
  exact or_assoc.mp ≫ h ≫ imp_trans and_assoc.mp

Conclusion "
```
rw [or_assoc]
rw [and_assoc]
exact h
```
----
```
rw [or_assoc, and_assoc]
exact h
```
----
```
exact or_assoc.mp ≫ h ≫ imp_trans and_assoc.mp

```
"
