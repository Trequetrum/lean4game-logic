import Game.Metadata

World "ImpIntro"
Level 6
Title "and_imp"

Introduction "
# Curry
If you've got chips and dip, then you've got a popular party snack! This is undeniable.\\
\\
Therefore if you've got chips, then if you've got dip, then you've got a popular party snack.
# Proposition Key:
- `C` — You've got chips
- `D` — You've got Dip
- `S` — You've got a popular party snack
"

/-- Conjunction interacting with implication --/
Statement (P Q R: Prop) (h : P ∧ Q → R) : P → Q → R := by
  exact λ(p : P)(q : Q) ↦ h (and_intro p q)

Conclusion "
Cool. Chips and Dip!

----
# A Tip!
If you're writting a function with more than one parameter, you can just list the parameters. That's a shorthand for nested function delcarations.
```
λ p : P ↦ λ q : Q ↦ h ⟨p, q⟩
-- can be written as:
λ(p : P)(q : Q) ↦ h ⟨p, q⟩
-- Or because the propositions of p and
-- q are clear from the goal:
λp q ↦ h ⟨p, q⟩
```
"
