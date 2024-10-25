import Game.Metadata

open GameLogic

World "NotIntro"
Level 5
Title "Modus Tollens"

OnlyTactic
  exact
  «have»

Introduction "
# Modus Tollens
If Bella comes to the party, she is certain to perform a bawdy song. You've assured Sybeth that there will be no bawdy songs at the event. Sybeth is disappointed to discover that Bella won't be joining.
# Proposition Key:
- `B` — Bella is attending the party
- `S` — A bawdy song will be sung
"

/-- Modus Tollens. -/
Statement (B S : Prop)(h1 : B → S)(h2 : ¬S) : ¬B := by
  exact imp_trans h1 h2

Conclusion "
Congratulations. Did you recognise this proof? It's actually a slightly less general version of the proof you used in the \"**→ Tutorial world, level 4**\" to show that implication is transitive.

---
Thinking of `h₂` as `Q → False`, you can actually use your imp_trans theorem here.
```
exact λp ↦ h₂ (h₁ p)
```
```
exact imp_trans h₁ h₂
```
For the math-inclined, because the expression for an implication is a function, you can also use function composition.
```
exact h₂ ∘ h₁
```
"
