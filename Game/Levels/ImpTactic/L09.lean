import Game.Metadata

open GameLogic

World "ImpTactic"
Level 9
Title "Implication Tactic Boss"

OnlyTactic
  assumption
  constructor
  intro
  «repeat»

Introduction "
# World's End
The home stretch, you can do it!

# More tactic combinations
You can combine two tactics into a single tactic using `{tac1; tac2}`. This may be helpful when combined with a tactic like `repeat`. As an example, there may come a time in this level where the following can save you a bit of typing:
```
repeat {intro; assumption}
```
"

/-- `Q → (P → Q) ∧ (¬P → Q)` -/
Statement (P Q : Prop) : Q → (P → Q) ∧ (¬P → Q) := by
  intro
  constructor
  repeat {intro; assumption}

Conclusion "
This set of tactic-based levels is complete!

------
```
intro
constructor
repeat {intro; assumption}
```
"
