import Game.Metadata

open GameLogic

World "AndIntro"
Level 3
Title "The Have Tactic"

NewDefinition GameLogic.Precedence
NewTactic «have»
OnlyTactic
  exact
  «have»
TheoremTab "∧"

Introduction "
# Too Many Invites
You have invites for Alarfil, Ilyn, Orin, and Uriel who all live together. Unfortunately, boxes only have space for two items, but you've thought up a clever solution!
1. You'll put Alarfil's and Ilyn's invites in a box,
2. You'll put Orin's and Uriel's invites in another box.
3. You'll put both boxes in a final box.
### Nested Boxes!
Nesting boxes like this is a way to get around the “two items per box” rule. Ensure that everything is correctly labelled to guarantee each invite reaches the correct recipient.
# Proposition Key:
- A — **A**larfil is invited to the party
- I — **I**lyn is invited to the party
- O — **O**rin is invited to the party
- U — **U**riel is invited to the party

# The `have` Tactic
You can complete this level with your knowledge from the previous level without using this new tactic. For example, either of these would work:
```
exact and_intro (and_intro a i) (and_intro o u)
exact ⟨⟨a,i⟩,⟨o,u⟩⟩
```
Instead of nesting this way, you can break the process down into steps using the `have` tactic. Enter “`have ai := and_intro a i`” to create your first box. After it's entered, it will appear under assumptions in the proof state. Now enter “`have ou := and_intro o u`” to create the second box.\\
\\
If you followed this suggestion, your proof state should now have the following assumptions:
```
Assumptions:
a: A
i: I
o: O
u: U
ai: A ∧ I
ou: O ∧ U
```
\\
Finally, now you can place these two boxes — `ai` and `ou` — into a third box and submit your answer using the `exact` tactic.
"

/-- Three × and_intro. -/
Statement (A I O U : Prop)(a : A)(i : I)(o : O)(u : U) : (A ∧ I) ∧ O ∧ U := by
  have ai := and_intro a i
  have ou := and_intro o u
  Hint (hidden := true) "exact and_intro {ai} {ou}"
  exact and_intro ai ou

example (A I O U : Prop)(a : A)(i : I)(o : O)(u : U) : (A ∧ I) ∧ O ∧ U := by
  exact ⟨⟨a,i⟩,⟨o,u⟩⟩

Conclusion "
Great! Another 4 invites sent out. You're getting the hang of this.
"
