import Game.Metadata

open GameLogic

World "AndIntro"
Level 6
Title "Mix and Match"

Introduction "
# Mixed Up Conjunctions
Recall when you placed the invites for Alarfil, Ilyn, Orin, and Uriel in separate boxes. There was a mix-up in the arrangement. Can you fix it so that Alarfil and Uriel's invites are together?
# Proposition Key:
- A — **A**larfil is invited to the party
- I — **I**lyn is invited to the party
- O — **O**rin is invited to the party
- U — **U**riel is invited to the party
### Quick tip!
You can type h₁ by entering \"h\\1\". There's unicode table for all the unicode shortcuts this game uses. It should be available under **Definitions** in your inventory.
"

/-- and_intro, and_left, and_right -/
Statement (A I O U : Prop)(h₁ : A ∧ I)(h₂ : O ∧ U) : A ∧ U := by
  have a := h₁.left
  have u := h₂.right
  exact and_intro a u

Conclusion "
That's better, but you'd better send out those invites so you can get some responses!

----
```
have a := h₁.left
have u := h₂.right
exact and_intro a u
```
---
```
exact and_intro h₁.left h₂.right
```
"
