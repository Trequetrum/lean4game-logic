import Game.Metadata

open GameLogic

World "ImpIntro"
Level 4
Title "Chain Reasoning"

NewLemma GameLogic.and_comm

Introduction "
# A Chain of Reasoning
You know Alarfil will be excited about a cake with sprinkles. Since Sybeth has just started dating Alarfil and enjoys seeing them happy, it follows that Sybeth will be excited about a cake with sprinkles.
# Proposition Key:
- `C` — The **C**ake has sprinkles
- `A` — **A**larfil is happy
- `S` — **S**ybeth is happy

# Transitivity Aside
With numbers, if `a` is less than `b` and `b` is less than `c`, then you can deduce that `a` is less than `c`.
```
(a < b) ∧ (b < c) → (a < c)
```
This is the transitive property of `<`. You should be able to show that this same property holds for conditionals — \"`→`\"
"

/-- Show that → is transitive -/
Statement (C A S: Prop) (h₁ : C → A) (h₂ : A → S) : C → S := by
  exact λ(c: C) ↦ h₂ (h₁ c)

-- Example using infix application to drop a pair of brackets.
example (C A S: Prop) (h₁ : C → A) (h₂ : A → S) : C → S := by
  exact λc ↦ h₂ <| h₁ c

Conclusion "
AH ha! Well done.

----
For the math-inclined, because the expression for an implication is a function, you can also use function composition.
```
exact h₂ ∘ h₁
```
"
