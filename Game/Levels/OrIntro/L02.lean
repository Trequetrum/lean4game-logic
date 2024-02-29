import Game.Metadata

open GameLogic

World "OrIntro"
Level 2
Title "Right Evidence"

NewTheorem GameLogic.or_inr
OnlyTactic
  exact
  «have»

Introduction "
# Or Introduction Right
You know that skittles are super colourful. Which means that either sprinkles are super colourful or skittles are super colourful.
# Proposition Key:
- `K` — sprinkles are super colourful
- `S` — skittles are super colourful
# New unlock
You've just unlocked `or_inr`. It turns evidence for the righthand of an `∨` proposition into a disjunction.
"

/-- Or Introduction Right -/
Statement (O S : Prop)(s : S) : K ∨ S := by
  exact or_inr s

Conclusion "
Almost a repeat of level 1. That was fast.

You'll notice that last time you showed evidence for a proposition involving “Oranges are a vegetable” even though you probably know that oranges are a fruit and not a vegitable. This time you did the same for “sprinkles are super colourful,” which you probably know is true.

What this demonstrates is that `∨` is an inclusive “or”, which means at least one of the propositions is true. It could be both or just one.
"
