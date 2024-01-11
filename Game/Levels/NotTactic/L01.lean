import Game.Metadata

open GameLogic

World "NotTactic"
Level 1
Title "Not False"

OnlyTactic
  assumption
  intro

Introduction "
Just like before, you need to keep in mind that `¬P` is defined as `P → False`.\\
\\
∴ `¬False` is actually asking for `False → False`
"

/-- `identity` -/
Statement: ¬False := by
  intro
  assumption
