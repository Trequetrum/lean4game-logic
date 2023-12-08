import Game.Metadata

World "OrIntro"
Level 5
Title "World 4, Level 5"

Introduction "
# Level 5
"

/-- ¬S is enough to show S → B -/
Statement (P Q : Prop)(p : P) : P ∨ Q := by
  exact or_inl p

Conclusion "
Concluded
"
