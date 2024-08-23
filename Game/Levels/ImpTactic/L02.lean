import Game.Metadata

open GameLogic

World "ImpTactic"
Level 2
Title "Identity"

NewTactic intro

OnlyTactic
  assumption
  intro

Introduction "
# The `intro` Tactic
The `intro` tactic lets you define a function interactively. It introduces one or more hypotheses, optionally naming them.\\
\\
In this level, `intro h` does two things. First, it adds an assumption `h : P` and second, it changes your goal from `P → P` to just `P`. In this sense, `intro h` is a bit like `λh ↦ `.
"

/-- Identity via tactics -/
Statement (P: Prop) : P → P := by
  intro; assumption
