import Game.Metadata

open GameLogic

World "ImpTactic"
Level 7
Title "Another One"

OnlyTactic
  assumption
  cases
  apply
  intro
  «repeat»

Introduction "
# And Another One
Reverse the implication you proved last level.
# More about `apply`
What this level is showing is that you can think about `h` as a function with 2 parameters instead of a function that returns a function. The `apply` tactic implicitly understands this point of view.\\
\\
Once your goal is `R`, you can `apply h`. This is like saying “in order to prove R, it suffices to prove `P` and prove `Q`”. You'll notice that `apply` automatically creates the two goals for you in such cases.\\
\\
**Aside:** When you've been using `constructor` to build conjunctions, this has been the same thing as if you had used `apply and_intro`. You can try that out next level if you so inclined.
"

/-- `(P → Q → R) → P ∧ Q → R` -/
Statement (P Q R: Prop) (h : P → Q → R) : P ∧ Q → R := by
  intro pq
  cases pq
  apply h
  repeat assumption

example (P Q R: Prop) (h : P → Q → R) : P ∧ Q → R := by
  intro ⟨_,_⟩
  apply h
  repeat assumption
