import Game.Metadata

World "OrIntro"
Level 1
Title "World 4, Level 1"

NewDefinition or_inl

Introduction "
# Or Introduction Left
You know that skittles are super colourful. Which means that either skittles are super colourful or oranges are a vegetable.
# Proposition Key:
- `O` — Oranges are a vegetable
- `S` — skittles are super colourful
"

/-- Or Introduction Left -/
Statement (O S : Prop)(s : S) : S ∨ O := by
  exact or_inl s

Conclusion "
Concluded
"
