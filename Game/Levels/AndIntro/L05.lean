import Game.Metadata

open GameLogic

World "AndIntro"
Level 5
Title "And Elimination 2"

NewTheorem GameLogic.and_right
OnlyTactic
  exact
  «have»
TheoremTab "∧"

Introduction "
# Another Unlock
Can you figure this one out?
"

/-- Both P and Q entails just Q as well! -/
Statement (P Q : Prop)(h: P ∧ Q) : Q := by
  Hint (hidden := true) "`exact h.right`"
  exact and_right h

Conclusion "
Nice. Onward!

----
```
exact h.right
```
----
```
exact and_right h
```
"
