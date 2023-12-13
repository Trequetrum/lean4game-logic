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
# The ∨ Tutorial World!
This world introduces disjunction. In sentences, the connective “or” is commonly employed, while in logical formulas, the symbol “`∨`” takes the stage. By now, you’re likely developing an understanding of the dynamics of the relationship between evidence and propositions.
1. Evidence for a conjunction `P ∧ Q` involves presenting a pair or tuple of evidence — one for `P` and another for `Q`.
2. Evidence for an implication like `P → Q` is a function from evidence of `P` to evidence of `Q`.
3. Evidence for a negation like `¬P` is a function from evidence of `P` to evidence of `False`.
### 4. Evidence for a disjunction
Evidence for `P ∨ Q` requires only evidence for either `P` or for `Q`. While simple at heart, this can lead to difficulties. Consider some expression that uses evidence for `P` to exhibit a proposition like `P ∨ Q` — because that expression requires only evidence for `P`, it could also be used for `P ∨ R`, or `P ∨ S`.\\
\\
While the correct proposition can often be inferred, there are times when you may see an error like: “failed to infer declaration type” or “don't know how to synthesize implicit argument”. Generally, this means that the proposition you're trying to exhibit needs to be made clear from the context or needs to be supplied directly as part of the expression.
```
Objects:
P Q : prop
Assumptions:
p : P
Goal: P ∨ Q
```
Because the goal knows what is required, the following will work.
```
exact or_inl p
```
When using the `have` tactic you can annotate the evidence you're introducing with the `:` operator. Then the correct proposition for the expression can be inferred. For example:
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
2. You can use the `:` “is evidence for” operator if you bracket appropriately. `:` has a low precedence, so you’ll need to bracket the expression in most cases.
```
have pvq := (or_inl p : P ∨ Q)
exact pvq
-- Nested `:` work as well...
have pvq := (or_inl (p : P) : P ∨ Q)
exact pvq
```
"
