import Game.Metadata

World "OrIntro"
Level 7
Title "World 4, Level 7"

Introduction "
# Level 7
"

/-- ¬S is enough to show S → B -/
Statement (P Q : Prop)(p : P) : P ∨ Q := by
  exact or_inl p

Conclusion "
Concluded
"
