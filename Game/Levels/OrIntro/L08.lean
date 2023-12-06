import Game.Metadata

World "OrIntro"
Level 8
Title "World 4, Level 8"

Introduction "
# Level 8
"

/-- ¬S is enough to show S → B -/
Statement (P Q : Prop)(p : P) : P ∨ Q := by
  exact or_inl p

Conclusion "
Concluded
"
