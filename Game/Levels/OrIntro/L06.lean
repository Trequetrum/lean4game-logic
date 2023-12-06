import Game.Metadata

World "OrIntro"
Level 6
Title "World 4, Level 6"

Introduction "
# Level 6
"

/-- ¬S is enough to show S → B -/
Statement (P Q : Prop)(p : P) : P ∨ Q := by
  exact or_inl p

Conclusion "
Concluded
"
