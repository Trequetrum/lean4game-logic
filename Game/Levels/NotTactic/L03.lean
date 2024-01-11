import Game.Metadata

open GameLogic

World "NotTactic"
Level 3
Title "Double False"

NewTactic exfalso
OnlyTactic
  assumption
  apply
  intro
  exfalso

Introduction "
# exfalso
`exfalso` is **Contradiction**'s younger brother. Using `exfalso` turns your goal to `False`. This is the same thing as using `apply false_elim`. Using the principle that “from nonsense, follows nonsense,” if you spot a constradiction in your assumptions, you can make progress by changing your goal to `False.`\\
\\
Remember that because `¬P` is the same as `P → False`, you can use the `apply` tactic on evidence for `¬P`
"

/-- not not introduction. -/
Statement (P : Prop)(h'₁ : P) : ¬¬P := by
  intro np
  exfalso
  apply np
  assumption

example (P : Prop)(h'₁ : P) : ¬¬P := by
  intro
  contradiction
