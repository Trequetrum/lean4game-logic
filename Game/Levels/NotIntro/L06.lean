import Game.Metadata

World "NotIntro"
Level 6
Title "Jason"

NewLemma mt

Introduction "
# The Jason Effect
You're delighted that Jason will be there.\\
\\
Remarkably, even in moments when Jason lacks humor, he manages to be amusing! His comedic charm persists, regardless of circumstances.
# Proposition Key:
- `J` — Jason is humorless
"

/-- Remember `h : J → J → False` -/
Statement (J : Prop) (h: J → ¬J) : ¬J := by
  exact λ(j : J) ↦ h j j

Conclusion "
You're uncertain about the coherence of this, yet it surely must make sense. Let's proceed.
"
