import Game.Metadata

open GameLogic

World "OrIntro"
Level 8
Title "The Implication"

OnlyTactic
  exact
  «have»

Introduction "
# BOSS LEVEL
If we summon the Kraken, then we shall assuredly perish. While that might sound ominous, consider this: if we summon the Kraken or **have icecream**, then we shall **have icecream!** or we shall perish.
# Proposition Key:
- I — **We have have icecream!**
- K — We summon the Kraken
- P — We shall assuredly perish
"

/-- Implication of ∨ -/
Statement (I K P : Prop)(h : K → P) : K ∨ I → I ∨ P := by
  exact (or_elim · (h ≫ or_inr) or_inl)

Conclusion "
Okay, that was a bit easy for a boss level. Don't sweat it, just enjoy the icecream!
"
