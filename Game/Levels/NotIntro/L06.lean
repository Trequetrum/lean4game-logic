import Game.Metadata

World "NotIntro"
Level 6
Title "Negation"

Introduction "
# The Power of negation
\"If this is the cake you bought, then it's gonna taste horrible\"\\
\"There's no evidence for that!\"\\
\"How do you know!?\"\\
\"The website says the cake is delicious!\"
# Proposition Key:
- `B` — You bought a cake
- `C` — The cake tastes horrible
"

/-- Nested `λ↦`s. -/
Statement (B C : Prop) (h: ¬(B → C)) : ¬C := by
  exact λc ↦ h (λ_ ↦ c)

Conclusion "
Phew, that makes perfect sense now.
"
