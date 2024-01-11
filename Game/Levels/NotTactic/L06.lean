import Game.Metadata

open GameLogic

World "NotTactic"
Level 6
Title "Self Contradictory 2"

NewTheorem GameLogic.modus_tollens
OnlyTactic
  intro
  apply
  «repeat»
  assumption

Introduction "
# Another self-contradiction
If you try to `apply h` right away, you'll be stuck. You'll have to try something else first.\\
\\
Once your goal is to show `False`, then `apply h` seems to do something funny. It asks you to show evidence for the same goal twice. If you try to apply `P → Q → R → S` to a Goal of `S`, then apply will make you prove each parameter separately — resulting is the three sub-goals of showing `P`, showing `Q`, and showing `R`.\\
\\
In this level, `apply h` is applying `P → P → False` to a goal of `False`, so it follows that you'll need to show evidence for `P` twice.
"

/-- Remember `h: P → ¬P` is actually `h : P → P → False` -/
Statement (P : Prop) (h: P → ¬P) : ¬P := by
  intro
  apply h
  repeat assumption
