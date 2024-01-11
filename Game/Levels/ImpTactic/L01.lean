import Game.Metadata

open GameLogic

World "ImpTactic"
Level 1
Title "Apply"

NewTactic apply

OnlyTactic
  assumption
  apply

Introduction "
# The `apply` Tactic
This tactic can be a bit confusing as it allows you to reason backwards. In this level, `h` gives us a means to get from P to Q. We can reason backwards and say, that because you have the means to turn evidence for P into evidence for Q — it suffices to show evidence for P.\\
\\
If you write `apply h`, you'll see that this changes your goal from `Q` to `P`.
"

/-- `P → (P → Q) → Q` -/
Statement (P Q: Prop)(h'₁: P)(h : P → Q) : Q := by
  apply h
  assumption
