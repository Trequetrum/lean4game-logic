import Game.Metadata

open GameLogic

World "NotIntro"
Level 12
Title "¬Intro Boss"

NewTheorem GameLogic.not_not_not
OnlyTactic
  exact
  «have»

Introduction "
# BOSS Level
\"Is it possible that if this is the cake you bought, then it's gonna taste horrible?\"\\
\"I'm certain that's not possible!\"\\
\"Oh, so what you're saying is that you have evidence that this is not not the cake you bought.\"
# Proposition Key:
- `B` — You bought this cake
- `C` — The cake tastes horrible
"

/-- ¬¬\"You bought this cake" -/
Statement (B C : Prop) (h : ¬(B → C)) : ¬¬B := by
  exact λnb ↦ h (λb ↦ false_elim (nb b))

example (B C : Prop) (h : ¬(B → C)) : ¬¬B := by
  exact λnb ↦ h (nb ≫ false_elim)

Conclusion "
These unintuitive statements highlight the inherent challenge in contemplating the *potential* existence (or definite non-existance) of implications.

That's a twist of logic, to be sure!
"
