import Game.Metadata

open GameLogic

World "AndTactic"
Level 8

Title "And Tactic Boss"

OnlyTactic
  assumption
  constructor
  cases

Introduction "
# BOSS LEVEL
The trick for this level is to pull out the relevant info from the assumption `h` before moving on, otherwise you'll need to re-do that work for each sub-goal.

I use the `cases` tactic 5 times and for me, they're the first five tactics for this level.
"

/-- Take apart and build evidence -/
Statement (A C I O P S U : Prop)(h: ((P ∧ S) ∧ A) ∧ ¬I ∧ (C ∧ ¬O) ∧ ¬U) : A ∧ C ∧ P ∧ S := by
  cases h
  cases left
  cases right
  cases right_2
  cases left_2
  constructor
  assumption
  constructor
  assumption
  assumption

Conclusion "
Amazing! You've beaten the `∧` world a second time and you've learned some extra tactics in the process.
"
