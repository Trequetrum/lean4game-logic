import Game.Metadata

open GameLogic

World "IffIntro"
Level 1
Title "Iff_Intro"

NewTactic rw
NewHiddenTactic «repeat» nth_rewrite
NewTheorem GameLogic.iff_intro
NewDefinition GameLogic.iff_def

Introduction "
# Coupled Conditionals
Sybeth and Alarfil are a couple. In effect, this means that if Sybeth is playing a party game, then Alarfil is playing too and vise versa. Therefore Sybeth is playing Charades if and only if Alarfil playing.
# Proposition Key:
- J — Alarfil is playing Charades
- S — Sybeth is playing Charades
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
