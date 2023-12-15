import Game.Metadata

open GameLogic

World "IffIntro"
Level 2
Title "Title"

NewDefinition GameLogic.iff_mp GameLogic.iff_mpr

Introduction "
# Two sides to every coin
You're flipping a coin to decide what color placemats you you want. Heads means blue placemats and tails means purple placemats. Here's the thing, you're secretly hoping it comes up blue.
# Proposition Key:
- B — Blue Placemats
- P — Purple Placemats
# Unlocked `↔-e mp` and `↔-e mpr`
For a biconditional like `h : P ↔ Q`,
1. You can extract `P → Q` using `iff_mp h` or `h.mp`. `mp` here is short of modus ponens.
2. You can extra `Q → P` using `iff_mpr h` or `h.mpr`. `mpr` here is short of modus ponens reversed.
"

/-- Statement -/
Statement (B P : Prop) (h : B ↔ ¬P) : (B → ¬P) ∧ (¬P → B) := by
  exact and_intro (iff_mp h) (iff_mpr h)

Conclusion "
Onward and upward
"
