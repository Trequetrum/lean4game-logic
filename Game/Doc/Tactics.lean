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

* `rw [← h₁]` — changes `Q`s to `P`s; get the back arrow by typing `\\left ` or `\\l`.

* `rw [h₁, h₂, h₃, h₄]` — a sequence of rewrites

* `rw [h₁] at h₂` — changes `P`s to `Q`s in hypothesis `h₂`

* `rw [h₁] at h₂ h₃ ⊢` — changes `X`s to `Y`s in two hypotheses and the goal;
get the `⊢` symbol with `\\|-`.

* `repeat rw [h₁]` — keep attempting to `rw` until there are no more matches. For example, if the goal is `¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬P` you can use `rw [not_not_not]` 9 times or just use `repeat rw [not_not_not]` once to get `¬P`

* `nth_rewrite 2 [h₁]` — will change only the second `P` in the goal to `Q`.
-/
TacticDoc rw

/--
## Summary

`repeat t` repeatedly applies the tactic `t`
to the goal. You don't need to use this
tactic, it just speeds things up sometimes.

## Example

`repeat rw [add_zero]` will turn the goal
`a + 0 + (0 + (0 + 0)) = b + 0 + 0`
into the goal
`a = b`.
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
