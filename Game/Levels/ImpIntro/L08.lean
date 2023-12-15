import Game.Metadata

open GameLogic

World "ImpIntro"
Level 8
Title "Distribute"

Introduction "
# Go buy chips and dip!
- If you go shopping, then you'll buy chips.
- If you go shopping, then you'll buy dip.
- ∴ If you go shopping, you'll buy chips and dip
# Proposition Key:
- `C` — You buy chips
- `D` — You buy dip
- `S` — You go shopping
"

/-- → distributes over ∧ --/
Statement (R S : Prop) (h : (S → C) ∧ (S → D)) : S → C ∧ D := by
  exact λ(s : S) ↦ and_intro (h.left s) (h.right s)

-- Should this game try to teach destructuring? It's trying
-- to accomplish so much already.
example (R S : Prop) (h : (S → C) ∧ (S → D)) : S → C ∧ D := by
  have ⟨l,r⟩ := h
  exact λs ↦ ⟨l s, r s⟩

Conclusion "
You definitely have the knack of providing conditional arguements
"
