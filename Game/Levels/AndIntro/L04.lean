import Game.Metadata

World "AndIntro"
Level 4
Title "And Elimination"

NewDefinition and_left

Introduction "
# Using Only What Is Needed
Sarah has left a voicemail on your answering machine. In it she says \"Hello, it's Sarah, I'm calling to confirm that Paul is coming to the party and I am also coming to the party! See you then!\"\\
\\
You'd like to convince Alan to join the party. You know that Alan is good friends with Paul. Constructing evidence that Paul is attending the party might just be the key to convincing Alan to join as well.
# Proposition Key:
- P — \"**P**aul is coming to the party\"
- S — \"**S**arah is coming to the party\"
# Assumptions:
- `h : P ∧ S` — The voicemail (`h`) is evidence that `P ∧ S`
# Convincing Alan
Alan is close with Paul, but you don't know much about his friendship with Sarah. You want only a relevant part of the voicemail. Fortunately, you know that any evidence with an `∧` has a left part and a right part. You can use this knowledge to pull evidence out of `h`.\\
\\
This can be done with either of these two methods:
```
have p := h.left
have p := and_left h
```
Once you've done this, you're very close to level 1 again where the Goal is directly in your assumptions.
"

/-- Exhibit evidence that Paul is coming to the party. -/
Statement (P S : Prop)(h: P ∧ S) : P := by
  have p := h.left
  exact p

Conclusion "
You've got a proof that Paul is coming to the party! Lets see if Alan will attend as well.

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
