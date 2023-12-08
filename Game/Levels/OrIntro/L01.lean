import Game.Metadata

World "OrIntro"
Level 1
Title "Left Evidence"

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
This says nothing about whether or not oranges are a vegetable. All we know is that at least one of `O` or `S` must be true.
"
