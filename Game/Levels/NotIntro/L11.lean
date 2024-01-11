import Game.Metadata

open GameLogic

World "NotIntro"
Level 11
Title "not_not_not"

OnlyTactic
  exact
  «have»

Introduction "
# Allergy: Triple Confusion
Pippin is allergic to avocado. You tell him you're not *not* **not** bringing avacado!!! Pippin gives you a confused look, but after a moment of contemplation, he responds with, \"Ok, good to know.\"
# Proposition Key:
- `A` — You're bringing avacado
"

/-- ¬A is stable. -/
Statement (A : Prop)(h : ¬¬¬A) : ¬A := by
  exact λa ↦ h λna ↦ na a

Conclusion "
Well reasoned
"
