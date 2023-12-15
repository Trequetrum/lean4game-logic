import Game.Metadata

open GameLogic

World "IffIntro"
Level 1
Title "Iff_Intro"

NewTactic rw
NewHiddenTactic «repeat» nth_rewrite
NewDefinition GameLogic.iff_intro

Introduction "
# Coupled Conditionals
Sarah and Jason are a couple. In effect, this means that if Sarah is attending the party, then Jason is attending and vise versa. Therefore Sarah is attending if and only if Jason is attending.
# Proposition Key:
- J — Jason is attending
- S — Sarah is attending
# Unlocked `↔ intro`
Assuming `e₁ : P → Q` and `e₂ : Q → P`, you can introduce a biconditional with `have h := iff_intro e₁ e₂`, though the anonymous constructor syntax works just like it does for conjunctions: `have h : P ↔ Q := ⟨e₁, e₂⟩`
"

/-- Statement -/
Statement (J S : Prop) (hsj: S → J) (hjs: J → S) : S ↔ J := by
  exact iff_intro hsj hjs

example (J S : Prop) (hsj: S → J) (hjs: J → S) : S ↔ J := by
  exact ⟨hsj, hjs⟩

Conclusion "
Onward and upward

----
```
exact iff_intro hsj hjs
```
---
```
exact ⟨hsj, hjs⟩
```
"

-- example (P Q : Prop): (P ∧ Q) ∨ (¬P ∧ ¬Q) → (P → Q) ∧ (Q → P) := by tauto
