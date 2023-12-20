import Game.Metadata

open GameLogic

World "IffIntro"
Level 3
Title "Rewriting"

Introduction "
# Rewrite the goal
## To an extreme
You're playing a round of *The Resistance*. You've been diligently figuring out who is a member of the resistance and who is a spy. It's a bit complicated, but you've reasoned that the current state of affairs is possible if and only if Alarfil and Cyna are members of the resistance and Pippin is a spy. You also know from an earlier reveal that Pippin and Lippa must be on the same team. Therefore, the same argument applies to Lippa as well.
# Proposition Key:
- A — Alarfil is a member of the resistance
- C — Cyna is a member of the resistance
- L — Lippa is a member of the resistance
- P — Pippin is a member of the resistance
# The `rw` tactic
Depending on the order you've chosen to do the tutorial worlds, you may not yet be familiar with all the symbols in the current proof state. In fact, you may not even have unlocked the tools in your inventory necessary to complete this level. Don't worry, the rewrite tactic makes this level a breeze.\\
\\
First, take a look at the proof state and notice that `h₂` and the Goal are extremely similar. In fact, if you replace every occurrence of `L` with `P`, then the two would be identical. That's where `rw` comes in.
\\
If you have `hpq : P ↔ Q` then `rw [hpq]` will change all `P`s in the goal to `Q`s. It's the way to “substitute in”.\\
\\
The `rw` tactic is an automation tool. It does the rote work of taking apart an expression, looking for a matching sub-expression, swapping in the equivalent sub-expression and then constructing the new equivalent term from there.\\
\\
Try it out!
"

/-- Who is loyal, who is a spy? -/
Statement
  (A C L P : Prop)
  (h₁ : L ↔ P)
  (h₂ : ¬((A → C ∨ ¬P) ∧ (P ∨ A → ¬C) → (P → C)) ↔ A ∧ C ∧ ¬P)
  : ¬((A → C ∨ ¬L) ∧ (L ∨ A → ¬C) → (L → C)) ↔ A ∧ C ∧ ¬L := by
    rw [h₁]
    exact h₂

example
  (A C L P : Prop)
  (h₁ : L ↔ P)
  (h₂ : ¬((A → C ∨ ¬P) ∧ (P ∨ A → ¬C) → (P → C)) ↔ A ∧ C ∧ ¬P)
  : ¬((A → C ∨ ¬L) ∧ (L ∨ A → ¬C) → (L → C)) ↔ A ∧ C ∧ ¬L := by
    rw [← h₁] at h₂
    exact h₂

example
  (A C L P : Prop) (h₁ : L ↔ P)
  (h₂ : ¬((A → C ∨ ¬P) ∧ (P ∨ A → ¬C) → (P → C)) ↔ A ∧ C ∧ ¬P)
  : ¬((A → C ∨ ¬L) ∧ (L ∨ A → ¬C) → (L → C)) ↔ A ∧ C ∧ ¬L :=
    ⟨
      λh₃ ↦ have ⟨a,c,np⟩ := h₂.mp (
        λh₄ ↦ h₃ (λ⟨hl₅,hr₅⟩ l ↦ h₄ ⟨
          λa ↦ or_elim
            (hl₅ a)
            or_inl
            (imp_trans h₁.mpr ≫ or_inr)
        ,
          λ_ ↦ hr₅ (or_inl l)
        ⟩ (h₁.mp l))
      )
      ⟨a, c, h₁.mp ≫ np⟩
    ,
      λ⟨a,c,nl⟩ _ ↦ false_elim (
        h₂.mpr
          ⟨a, c, h₁.mpr ≫ nl⟩
          λ_ _ ↦ c
      )
    ⟩

Conclusion "
Oh, how nice! A fast solution to a complex problem.

----
If you've read the inventory page for `rw`, you may have seen another solution too. You can use the backwards arrow “`←`” to change `P`s to `L`s instead of `L`s to `P`s. Also, you can change a hypothesis instead of the goal.
```
rw [← h₁] at h₂
exact h₂
```

Here's an example of what this looks like without the `rw` tactic — if you want to try this solution, copy & paste the following text to the editor input mode.
```
exact ⟨
  λh₃ ↦ have ⟨a,c,np⟩ := h₂.mp (
    λh₄ ↦ h₃ (λ⟨hl₅,hr₅⟩ l ↦ h₄ ⟨
      λa ↦ or_elim
        (hl₅ a)
        or_inl
        (imp_trans h₁.mpr ≫ or_inr)
    ,
      λ_ ↦ hr₅ (or_inl l)
    ⟩ (h₁.mp l))
  )
  ⟨a, c, h₁.mp ≫ np⟩
,
  λ⟨a,c,nl⟩ _ ↦ false_elim (
    h₂.mpr
      ⟨a, c, h₁.mpr ≫ nl⟩
      λ_ _ ↦ c
  )
⟩
```
The thing to notice here is that this long-form solution needs both `h₁.mp` and `h₁.mpr`. Keep in mind that though it’s often tempting to try to use conditionals (`→`), rewrite **requires** a biconditional (`↔`) to work.
"
