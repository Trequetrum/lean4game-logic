import Game.Metadata

open GameLogic

World "AndTactic"
Level 4
Title "Cases for a Conjunction"

NewTactic cases

OnlyTactic
  assumption
  cases

Introduction "
# `cases` for a Conjunction
Here, we introduce the `cases` tactic in an unstructured context. `cases` takes a name from the local context and either splits it into multiple goals, or deconstructs it into its parts depending on the Proposition.\\
\\
In this level, `cases h` will replace `h` with its `left` and `right` parts. Try it out.
"

/-- P and Q implies P -/
Statement (P Q : Prop)(h: P ∧ Q) : P := by
  cases h
  assumption
