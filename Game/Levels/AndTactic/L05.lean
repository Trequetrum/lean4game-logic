import Game.Metadata

open GameLogic

World "AndTactic"
Level 5
Title "Rinse and Repeat"

OnlyTactic
  assumption
  cases

Introduction "
# Rinse and Repeat
When you were writing expressions before, lvl 4 needed `and_left` while level 5 needed `and_right`. Tactics can incorperate an arbitrary amount of automation. In this case, because assumption will do a search through your assumptions for you, your proof for this level can be 100% identical to the one you used last level.
"

/-- Both P and Q entails just Q as well! -/
Statement (P Q : Prop)(h: P ∧ Q) : Q := by
  cases h
  assumption
