import Game.Metadata

World "AndIntro"
Level 5
Title "And Elimination 2"

NewDefinition and_right

Introduction "
# No Flavor
You're too busy with invites to bother with flavor text. Can you beat this level using only the proof state provided?
"

/-- Both P and Q entails just Q as well! -/
Statement (P Q : Prop)(h: P ∧ Q) : Q := by
  exact h.right

Conclusion "
Nice. Onward!
"
