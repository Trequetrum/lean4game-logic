import Game.Levels.OrIntro.L01
import Game.Levels.OrIntro.L02
import Game.Levels.OrIntro.L03
import Game.Levels.OrIntro.L04
import Game.Levels.OrIntro.L05
import Game.Levels.OrIntro.L06
import Game.Levels.OrIntro.L07
import Game.Levels.OrIntro.L08

World "OrIntro"
Title "∨ Tutorial"

Introduction "
# The ∨ Tutotial World!
This world introduces the logical \"or\" — which looks like \"∨\". By now you've hopefully started to understand some of the interplay between evidence and propositions.
1. Evidence for a conjunction `P ∧ Q` is a pair — or tuple — of evidence, one for `P` and another for `Q`.
2. Evidence for an implication like `P → Q` is a function from evidence of `P` to evidence of `Q`.
3. Evidence for a negation like `¬P` is a function from evidence of `P` to evidence of `False`.
### 4. Evidence for a disjunction
Evidence for `P ∨ Q` requires only evidence for either `P` or for `Q`. This creates a problem; consider that `or_inl p` is an example of the sort of expression that can exhibit a proposition like `P ∨ Q`. Because that expression requires only evidence for `P`, it could also be used for `P ∨ R`, or `P ∨ S`.\\
\\
What this means is that the proposition you're trying to exibit needs to be clear from the context or needs to be supplied directly as part of the expression.
```
Objects:
P Q : prop
Assumptions:
p : P
Goal: P ∨ Q
```
Becuase the goal knows what is required, the following will work.
```
exact or_inl p
```
When using the `have` tactic you can annotate the evidence you're introducing with the `:` operator. So for example:
```
have pvq : P ∨ Q := or_inl p
exact pvq
```
Another option is to provide a proposition directly inside an expression. This becomes helpful in large expressions that have many parts. Even if it's often redundant, any expression can be annotated in this way
1. You can use a `show ... from ...` expression
```
have pvq := show P ∨ Q from or_inl p
exact pvq
-- Nested show statements work too...
have pvq := show P ∨ Q from or_inl (show P from p)
exact pvq
```
2. You can use the `:` \"is evidence for\" operator if you bracket appropriately.
```
have pvq := (or_inl p : P ∨ Q)
have pvq := ((or_inl p) : (P ∨ Q))
have pvq := (or_inl (p : P) : P ∨ Q)
```
"
