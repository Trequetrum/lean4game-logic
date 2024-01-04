import Game.Metadata

open GameLogic

World "NotIntro"
Level 6
Title "Alarfil"

NewTheorem GameLogic.modus_tollens

Introduction "
# The Alarfil Effect
You're delighted that Alarfil will be there.\\
\\
Remarkably, even in moments when Alarfil lacks humor, he manages to be amusing! His comedic charm persists, regardless of circumstances.
# Proposition Key:
- `A` — Alarfil is humorless
"

/-- Remember `h : A → A → False` -/
Statement (A : Prop) (h: A → ¬A) : ¬A := by
  exact λ(a : A) ↦ h a a

Conclusion "
This joke is a reach, I know, but my answer this this level kinda spells `ahaa` — `λa ↦ h a a`. \\
\\
Okay, okay. Let's proceed.
"
