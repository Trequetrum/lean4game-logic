import Game.Metadata

World "OrIntro"
Level 2
Title "Right Evidence"

NewDefinition or_inr

Introduction "
# Or Introduction Right
You know that skittles are super colourful. Which means that either sprinkles are are colourful or skittles are super colourful.
# Proposition Key:
- `K` — sprinkles are are colourful
- `S` — skittles are super colourful
"

/-- Or Introduction Left -/
Statement (O S : Prop)(s : S) : K ∨ S := by
  exact or_inr s

Conclusion "
Almost a repeat of level 1. That was fast.
"
