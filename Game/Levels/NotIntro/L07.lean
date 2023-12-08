import Game.Metadata

World "NotIntro"
Level 7
Title "Negation"

Introduction "
# The Power of negation
\"Is it possible that if this is the cake you bought, then it's gonna taste horrible?\"\\
\"I'm certain that's not possible.\"\\
\"Oh, so what you're saying is that you have evidence that the cake is delicious!\"
# Proposition Key:
- `B` — You bought this cake
- `C` — The cake tastes horrible
"

/-- Nested `λ↦`s. -/
Statement (B C : Prop) (h: ¬(B → C)) : ¬C := by
  exact λ(c : C) ↦ h (λ(_ : B) ↦ c)

Conclusion "
Phew, that makes perfect sense now.
"
