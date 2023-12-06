import Game.Metadata

World "AndIntro"
Level 6
Title "Mix and Match"

Introduction "
# Mixed Up Conjunctions
Recall when you placed the invites for Jason, Justin, Jaime, and Jordan in separate boxes. there was a mix-up in the arrangement. Can you fix it so that Jason's and Justine's invites are together?
# Proposition Key:
- A — J**a**son is invited to the party
- I — Ja**i**me is invited to the party
- O — J**o**rdan is invited to the party
- U — J**u**stin is invited to the party
"

/-- and_intro, and_left, and_right -/
Statement (A I O U : Prop)(h₁ : A ∧ I)(h₂ : O ∧ U) : A ∧ U := by
  exact and_intro h₁.left h₂.right

Conclusion "
That's better, but you'd better send out those invites so you can get some responses!
"
