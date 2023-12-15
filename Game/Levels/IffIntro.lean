import Game.Levels.IffIntro.L01
import Game.Levels.IffIntro.L02

World "IffIntro"
Title "↔ Tutorial"

Introduction "
# Propositional Equivalence
## Biconditional: If and only if
The `↔` operator doesn't introduce anything new. `P ↔ Q` can be constructed whenever evidence for both `P → Q` and `Q → P` is available. In general, if `h₁` and `h₂` are evidence as follows:
```
h₁ : P ↔ Q
h₂ : (P → Q) ∧ (Q → P)
```
Then `h₁` and `h₂` have roughly the same capabilities. Also, proof of either P or Q or ¬P or ¬Q, immediately translates to the same proof for the logically equivalent proposition. The following levels will explain the details.\\
\\
The main new idea introduced in this tutorial world is the `rw` tactic. The *rewrite* tactic offers a principled way to alter the current goal or available hypotheses of your current proof state.
"
