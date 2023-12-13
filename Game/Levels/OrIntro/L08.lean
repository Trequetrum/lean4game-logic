import Game.Metadata

World "OrIntro"
Level 8
Title "The Implication"

Introduction "
# BOSS LEVEL
If we summon the Kraken, then we shall assuredly perish. Sure that sounds bad, but soncider that if we summon the Kraken or have icecream, then we shall perish or (hear me out here) **have icecream!**.
# Proposition Key:
- I — We have have icecream!
- K — We summon the Kraken
- P — We shall assuredly perish
"

/-- Implication of ∨ -/
Statement (I K P : Prop)(h : K → P) : K ∨ I → P ∨ I := by
  exact λpvr ↦ or_elim pvr (h ≫ or_inl) or_inr

Conclusion "
Concluded
"
