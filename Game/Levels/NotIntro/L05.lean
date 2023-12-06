import Game.Metadata

World "NotIntro"
Level 5
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

/-- The premise is a bit silly, sure. -/
Statement (J : Prop) (h: J → ¬J) : ¬J := by
  exact λj ↦ h j j

Conclusion "
You're uncertain about the coherence of this, yet it surely must make sense. Let's proceed.
"
