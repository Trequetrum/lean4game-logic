import Game.Metadata

open GameLogic

World "AndIntro"
Level 6
Title "Mix and Match"

OnlyTactic
  exact
  «have»
TheoremTab "∧"

Introduction "
# Mixed Up Conjunctions
Recall when you placed the invites for Alarfil, Ilyn, Orin, and Uriel in separate boxes. There was a mix-up in the arrangement. Can you fix it so that Alarfil and Uriel's invites are together?
# Proposition Key:
- A — **A**larfil is invited to the party
- I — **I**lyn is invited to the party
- O — **O**rin is invited to the party
- U — **U**riel is invited to the party
"

/-- and_intro, and_left, and_right -/
Statement (A I O U : Prop)(h1 : A ∧ I)(h2 : O ∧ U) : A ∧ U := by
  have a := h1.left
  have u := h2.right
  exact and_intro a u

example (A I O U : Prop)(h1 : A ∧ I)(h2 : O ∧ U) : A ∧ U := by
  exact and_intro h1.left h2.right

example (A I O U : Prop)(h1 : A ∧ I)(h2 : O ∧ U) : A ∧ U := by
  exact and_intro (and_left h1) (and_right h2)

example (A I O U : Prop)(h1 : A ∧ I)(h2 : O ∧ U) : A ∧ U := by
  exact ⟨h1.left, h2.right⟩

Conclusion "
That's better, but you'd better send out those invites so you can get some responses!

----
```
have a := h1.left
have u := h2.right
exact and_intro a u
```
---
```
exact and_intro h1.left h2.right
```
----
```
exact and_intro (and_left h1) (and_right h2)
```
---
```
exact ⟨h1.left, h2.right⟩
```
"
