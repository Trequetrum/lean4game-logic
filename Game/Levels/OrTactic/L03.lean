import Game.Metadata

open GameLogic

World "OrTactic"
Level 3
Title "Or Elimination"

OnlyTactic
  assumption
  cases
  apply

Introduction "
# A new way to use the `cases` tactic
You've used cases so far as a means to take apart conjunctions like `P ∧ Q`. The same tactic works a bit differently on disjunctions. When you use `cases h3`, you'll need to show `P` assuming Q and show `P` assuming `R`. Then the game will conclude that `P` is the case regardless of which of the disjunctions are true.
"

/-- `cases h3` -/
Statement (P Q R : Prop)(h1 : Q → P)(h2 : R → P)(h3 : Q ∨ R) : P := by
  cases h3
  apply h1
  assumption
  apply h2
  assumption
