import Game.Metadata

open GameLogic

World "IffIntro"
Level 2
Title "Conjuctive Iff"

NewLemma
  GameLogic.iff_mp
  GameLogic.iff_mpr

Introduction "
# Two sides to every coin
You're flipping a coin to decide which team gets to guess first in *Salad Bowl*. Heads means blue team and tails means purple team. Even though you're on the purple team, you're secretly hoping it comes up heads.
# Proposition Key:
- B — Blue Team goes first
- P — Purple Team goes First
# Unlocked `iff_mp` and `iff_mpr`
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
