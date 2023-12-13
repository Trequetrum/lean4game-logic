import Game.Metadata

World "AndIntro"
Level 5
Title "And Elimination 2"

NewDefinition and_right

Introduction "
# Another Unlock
Can you figure this one out?
"

/-- Both P and Q entails just Q as well! -/
Statement (P Q : Prop)(h: P ∧ Q) : Q := by
  Hint (hidden := true) "`exact h.right`"
  exact h.right

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
