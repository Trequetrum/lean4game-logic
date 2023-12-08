import Game.Metadata

World "ImpIntro"
Level 4
Title "Chain Reasoning"

NewLemma and_comm

Introduction "
# A Chain of Reasoning
You know Jason will be excited about a cake with sprinkles. Since Sarah has just started dating Jason and enjoys seeing him happy, it follows that Sarah will be excited about a cake with sprinkles.
# Proposition Key:
- `C` — The **C**ake has sprinkles
- `J` — **J**ason is happy
- `S` — **S**arah is happy

# Transitivity Aside
With numbers, if `a` is less than `b` and `b` is less than `c`, then you can deduce that `a` is less than `c`.
```
(a < b) ∧ (b < c) → (a < c)
```
This is the transitiive property of `<`. You should be able to show that this same property holds for conditionals — \"`→`\"
"

/-- Show that → is transitive -/
Statement (C J S: Prop) (h₁ : C → J) (h₂ : J → S) : C → S := by
  exact λ(c: C) ↦ h₂ (h₁ c)

Conclusion "
AH ha! Well done.

----
For the math-inclined, because the expression for an implication is a function, you can also use function composition.
```
exact h₂ ∘ h₁
```
"
