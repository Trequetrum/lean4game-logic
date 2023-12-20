import Game.Metadata

open GameLogic

World "OrIntro"
Level 2
Title "Right Evidence"

NewLemma GameLogic.or_inr

Introduction "
# Or Introduction Right
You know that skittles are super colourful. Which means that either sprinkles are are colourful or skittles are super colourful.
# Proposition Key:
- `K` — sprinkles are are colourful
- `S` — skittles are super colourful
# New unlock
You've just unlocked `or_inr`. It turns evidence for the righthand of an `∨` proposition into a disjunction.
"

/-- Or Introduction Right -/
Statement (O S : Prop)(s : S) : K ∨ S := by
  exact or_inr s

Conclusion "
Almost a repeat of level 1. That was fast.
"
