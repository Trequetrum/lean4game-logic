import GameServer.Commands

/--
# Summary
The `exact` tactic is a means through which you give the game your answer. Many levels can be done in multiple steps. You'll use the `exact` tactic when you're ready to create the final expression. It will be evaluated to see weather it matches the goal.

`exact` will work with any expression and attempt to unify it with the current goal. The simplest such expression is just a name that — `:` — “is evidence for” the goal. More complicated expressions often make use of unlocked definitions and theorems as well as function abstraction and application.

# Errors
Because most of the starting levels use only the `exact` tactic and an expression, it's common to forget to specify the tactic. Sometimes this raises the error:
```
unknown tactic
```
and other times the much more ambiguous message:
```
no goals left
This probably means you solved the level with warnings or Lean encountered a parsing error.
```
Hopefully we'll have better error messages in the future ☺

### Example
```
Objects:
P : Prop
Assumptions:
h : P
Goal:
P
```
----
```
exact h
```

### Example
```
Objects:
P Q: Prop
Assumptions:
h : (P → Q) ∧ ¬Q
Goal:
¬P
```
----
```
exact λp ↦ and_right h (and_left h p)
```
-/
TacticDoc exact

/--
## Summary
`have` is used to add new assumptions to your proof state.

`have h : P := e` adds the assumption `h : P` to the current proof state if `e` is an expression that evaluates to evidence for `P`.

If `P` is omitted, the game will attempt to infer the proposition. Most tutorial worlds will introduce alternative expressions as a shorthand where you can omit parts of the expression if the proposition being introduced can be inferred.

`and_intro e₁ e₂`, and `iff_intro e₁ e₂` can both be written as `⟨e₁, e₂⟩` as long as the context makes the proposition being constructed clear. This will often mean using the long hand or including the `P` when using the `have` tactic.
```
-- Should h be inferred as P ∧ Q or P ↔ Q?
-- To be unambiguous
exact h := ⟨e₁, e₂⟩
-- must become
exact h : P ∧ Q := ⟨e₁, e₂⟩
-- or perhaps
exact h := (⟨e₁, e₂⟩ : P ∧ Q)
```

### Example
```
Objects:
P Q: Prop
Assumptions:
h : (P → Q) ∧ ¬Q
Goal:
¬P
```
---
```
have hpq := h.left
```
creates the new proof state where hpq is an assumption
```
Objects:
P Q: Prop
Assumptions:
h : (P → Q) ∧ ¬Q
hpq : P → Q
Goal:
¬P
```
-/
TacticDoc «have»

/--
## Summary

If `h₁` is a proof of an equivalence `P ↔ Q`, then `rw [h₁]` will change
all `P`s in the goal to `Q`s. It's the way to “substitute in”.

## Variants

* `rw [← h₁]` — changes `Q`s to `P`s; get the back arrow by typing `\left ` or `\l`.

* `rw [h₁, h₂, h₃, h₄]` — a sequence of rewrites

* `rw [h₁] at h₂` — changes `P`s to `Q`s in hypothesis `h₂`

* `rw [h₁] at h₂ h₃ ⊢` — changes `X`s to `Y`s in two hypotheses and the goal;
get the `⊢` symbol with `\|-`.

* `repeat rw [h₁]` — keep attempting to `rw` until there are no more matches. For example, if the goal is `¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬P` you can use `rw [not_not_not]` 9 times or just use `repeat rw [not_not_not]` once to get `¬P`

* `nth_rewrite 2 [h₁]` — will change only the second `P` in the goal to `Q`.
-/
TacticDoc rw

/--
## Summary
`repeat t` repeatedly applies the tactic `t` to the goal. You don't need to use this tactic, it just speeds things up sometimes.
-/
TacticDoc «repeat»

/--
## Summary

If `h : X = Y` and there are several `X`s in the goal, then
`nth_rewrite 3 [h]` will just change the third `X` to a `Y`.

## Example

If the goal is `2 + 2 = 4` then `nth_rewrite 2 [two_eq_succ_one]`
will change the goal to `2 + succ 1 = 4`. In contrast, `rw [two_eq_succ_one]`
will change the goal to `succ 1 + succ 1 = 4`.
-/
TacticDoc nth_rewrite

/--
assumption tries to solve the main goal by searching your the assumptions in your proof state for a hypothesis with a compatible proposition
-/
TacticDoc assumption

/--
# Constructor
Whenever there's a clear way to create new evidence **that matches the goal**, the constructor tactic will pick that for you. This replaces the current goal with one or more goals that together complete the construction.

For example, if your goal is `P ∧ Q` then the `constructor` tactic will replace that goal with two separate subgoals. First you'll need to show evidence for `P`, then you'll need to show evidence for `Q`.
-/
TacticDoc constructor

/--
# Conjunction/Biconditional
`cases` will deconstruct an `∧` or an `↔` into it's parts, removing the assumption and replacing it with two new assumptions.
# Disjunction
Used with an `∨` cases will split the main goal, replacing it with a goal for each of the two possibilities.
-/
TacticDoc cases

/--
# It suffices to show
To prove `Q` by `P → Q`, it suffices to show `P`.
### More Generally
To prove `Q` by `P₁ → P₂ → P₃ → ... → Q`, it suffices to show `P₁, P₂, P₃, ...`. One way to convince yourself this is true is to prove that `(P₁ → P₂ → Q) → (P₁ ∧ P₂ → Q)` and convince yourself there exists a procedure for any `(P₁ → P₂ → ... → Q) → (P₁ ∧ P₂ ∧ ... → Q)`
### In Practice
The `apply` tactic returns as many subgoals as the number of premises that have not been fixed by the Goal.
### Example:
If you have:
```
Assumptions:
h : P → Q
Goal : Q
```
then `apply h` will change your proof state to:
```
Assumptions:
h : P → Q
Goal : P
```
-/
TacticDoc apply

/--
# Sub-Proof
If your Goal is an implication, this tactic introduces one or more hypotheses, optionally naming and/or pattern-matching them.

The effect on a goal like `P → Q` is to add `P` as an assumption and change the Goal to `Q`. If the implication is already a part of a sub-proof, then once you show evidence for `Q`, the assumption `P` is discharged and can not be used for the rest of the proof.

This is is the interactive way of defining a function using tactics. You can think of discharging an assumption as the same as parameters being limited in scope to the function's body/definition.
-/
TacticDoc intro

/--
contradiction closes the current goal there are assumptions which are "trivially contradictory".

### Example
```
Assumptions:
h : False
```
### Example
```
Assumptions:
h₁ : P
h₂ : ¬P
```
-/
TacticDoc contradiction

/--
Change the goal to `False`. This is only helpful when there are assumptions which are in some way contradictory.
### Example
```
Assumptions
h : P ∧ ¬P
Goal: Q
```
I cannot show evidence for `Q` directly, but because `False → Q` is trivially true (False implies anything), I can use the tactic `exfalso` which changes the Goal:
```
Assumptions
h : P ∧ ¬P
Goal: Q
```
After which `exact h.right r.left` meets the current goal.
### Apply
`exfalso` is the same as `apply false_elim`.
∴ to show `Q` by `False → Q`, it suffices to show `False`.
-/
TacticDoc exfalso

/--
# Show a Disjunction
Evidence for `P ∨ Q` can be created in two ways. `left` changes the goal to `P` while `right` changes the goal to `Q`.
-/
TacticDoc left

/--
# Show a Disjunction
Evidence for `P ∨ Q` can be created in two ways. `left` changes the goal to `P` while `right` changes the goal to `Q`.
-/
TacticDoc right
