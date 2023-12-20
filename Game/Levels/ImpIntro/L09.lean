import Game.Metadata

open GameLogic

World "ImpIntro"
Level 9
Title "Uncertain Snacks"

Introduction "
# BOSS LEVEL!!!
# Uncertain Snacks
Sybeth wants to know whether Riffin will still bring a snack, regardless of whether she brings one herself or not.\\
\\
She's asked you for evidence that:
- **If** Riffin is bringing a snack **then**
  1. Her bringing a snack **implies** Riffin is bringing a snack
  2. Her not bringing a snack **implies** Riffin is bringing a snack

That's a bit convoluted, but you should be able to produce some evidence of this!
# Proposition Key:
- `R` — Riffin is bringing a snack
- `S` — Sybeth is bringing a snack
"

/-- Write the nessesary nested function(s)! --/
Statement (R S : Prop) : R → (S → R) ∧ (¬S → R) := by
  exact λ(r : R) ↦ and_intro (λ(_ : S) ↦ r) (λ(_ : ¬S) ↦ r)

example (R S : Prop) : R → (S → R) ∧ (¬S → R) := by
  exact λr ↦ and_intro (λ_ ↦ r) λ_ ↦ r

example (R S : Prop) : R → (S → R) ∧ (¬S → R) := by
  have sr := λ(r: R)(_ : S) ↦ r
  have nsr := λ(r: R)(_ : ¬S) ↦ r
  exact λr ↦ ⟨sr r, nsr r⟩

example (R S : Prop) : R → (S → R) ∧ (¬S → R) := by
  exact λr ↦ ⟨λ_ ↦ r, λ_ ↦ r⟩

Conclusion "
You're very convincing, and now Sybeth can see that if Riffin is bringing a snack, he'll be bringing it regardless of what she does.\\
\\
On to the next world!

----
# Hint
If you're not going to use some evidence, then you don't need to name it. You can write an underscore as a placeholder. For example, my solution looked like this:
```
exact λ r : R ↦ ⟨λ _ : S ↦ r, λ _ : ¬S ↦ r⟩
-- which can be abbreviated
exact λr ↦ ⟨λ_ ↦ r, λ_ ↦ r⟩
```
"
