import Game.Metadata

World "OrIntro"
Level 4
Title "World 4, Level 4"

Introduction "
# Level 4
"

/-- ¬S is enough to show S → B -/
Statement (P Q : Prop)(p : P) : P ∨ Q := by
  exact or_inl p

Conclusion "
Concluded
"
