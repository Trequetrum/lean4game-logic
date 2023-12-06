import Game.Metadata

World "NotIntro"
Level 11
Title "World 3, Level Ten"

NewLemma not_not_not

Introduction "
# BOSS Level
\"If this is the cake you bought, then it's gonna taste horrible\"\\
\"There's no evidence for that!\"\\
\"How do you know!?\"\\
\"This is not not the cake I bought\"\\
\\
Huh?
# Proposition Key:
- `B` — You bought a cake
- `C` — The cake tastes horrible
"

/-- TODO. -/
Statement (B C : Prop) (h : ¬(B → C)) : ¬¬B := by
  exact λnb ↦ h (λb ↦ false_elim (nb b))

Conclusion "
That's a twist of logic, to be sure!
"
