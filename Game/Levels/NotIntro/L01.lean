import Game.Metadata

open GameLogic

World "NotIntro"
Level 1
Title "Not False"

NewDefinition GameLogic.false_def
OnlyTactic
  exact
  «have»

Introduction "
# Proof State
The proof state in the level is as short as you've seen so far. There are no **Objects** or **Assumptions** listed.\\
\\
In other levels, you get a proposition key and in the proof state — under **Objects** — you'd see something like `P Q : Prop`. When you see `P` in a level, it's a variable standing in for whatever proposition is in the proposition key. The game freely re-uses these letters in other levels as they can stand in for anything.\\
\\
You won't see `False` listed under objects, just as you won't see **Theorems** or **Definitions** listed under assumptions. This just means that `False` never changes from level to level. It's never a stand-in for anything else. It's a fully defined and always available proposition.
## Not False
Intuitively, it should be very simple to provide evidence for \"not false\". Since `¬P` is shorthand for `P → False`, you should think of `¬False` as shorthand for `False → False`. To drive home the fact that `False` is a proposition, this has the same proof as `P → P` (Which you solved in \"**→ Tutorial, level 2**\").
"

/-- `identity` -/
Statement: ¬False := by
  exact identity

example: ¬False := by
  exact λ(f : False) ↦ f

Conclusion "
You'll never **actually** find evidence for `False`, but evidence for `¬False` is a very simple tautology, as you would expect.

----
Which Proof did you use?
```
exact identity
exact λ(f : False) ↦ f
exact λf ↦ f
```
"
