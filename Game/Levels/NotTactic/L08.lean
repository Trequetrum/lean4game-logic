import Game.Metadata

open GameLogic

World "NotTactic"
Level 8
Title "Negated Conjunction"

OnlyTactic
  cases
  intro
  apply
  assumption

Introduction "
# Pattern matching tip
You can solve this level using the knowledge you've acquired so far. If you've used a language with destructuring or pattern matching before, then you can introduce and pattern-match in one step with `intro ⟨nq, p⟩`. Doing so means you won't need the `cases` tactic for this level.
"

/-- Negation into conjunction. -/
Statement (P Q : Prop) (h: Q) : ¬(¬Q ∧ P) := by
  intro nqp
  cases nqp
  apply left
  assumption

example (P Q : Prop) (h: Q) : ¬(¬Q ∧ P) := by
  intro ⟨nq, _⟩
  apply nq
  assumption
