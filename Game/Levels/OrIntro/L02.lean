import Game.Metadata

World "OrIntro"
Level 2
Title "World 4, Level 2"

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
Concluded
"
