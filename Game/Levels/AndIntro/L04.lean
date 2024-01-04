import Game.Metadata

open GameLogic

World "AndIntro"
Level 4
Title "And Elimination"

NewTheorem GameLogic.and_left

Introduction "
# Using Only What Is Needed
Sybeth has left a voicemail on your answering machine. In it she says “Hello, it's Sybeth, I'm calling to confirm that Pippin is coming to the party and I am also coming to the party! See you then!”\\
\\
You'd like to convince Cyna to join the party. You know that Cyna is good friends with Pippin. Constructing evidence that Pippin is attending the party might just be the key to convincing Cyna to join as well.
# Proposition Key:
- P — \"**P**ippin is coming to the party\"
- S — \"**S**ybeth is coming to the party\"
# Assumptions:
- `h : P ∧ S` — The voicemail (`h`) is evidence that `P ∧ S`
# Convincing Cyna
Cyna is close with Pippin, but you don't know much about his friendship with Sybeth. You want only a relevant part of the voicemail. Fortunately, you know that any evidence with an `∧` has a left part and a right part. You can use this knowledge to pull evidence out of `h`.\\
\\
This can be done with either of these two methods:
```
have p := h.left
have p := and_left h
```
Once you've done this, you're very close to level 1 again where the Goal is directly in your assumptions.
"

/-- Exhibit evidence that Pippin is coming to the party. -/
Statement (P S : Prop)(h: P ∧ S) : P := by
  have p := h.left
  exact p

Conclusion "
You've got a proof that Pippin is coming to the party! Lets see if Cyna will attend as well.

----
Which proof did you use?
```lean
have p := h.left
exact p
```
or
```lean
exact h.left
```
"
