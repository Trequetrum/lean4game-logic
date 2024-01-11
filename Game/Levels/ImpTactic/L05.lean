import Game.Metadata

open GameLogic

World "ImpTactic"
Level 5
Title "Apply Backwards"

OnlyTactic
  assumption
  apply
  intro

Introduction "
# Follow the Graph Backwards
$$
\\begin{CD}
  P  @>{h₁}>> Q       @>{h₂}>> R \\\\
  @.         @VV{h₃}V           \\\\
  S  @>>{h₄}> T       @>>{h₅}> U
\\end{CD}
$$
"

/-- Think before you act :) -/
Statement (P Q R S T U: Prop) (h1 : P → Q) (h2 : Q → R) (h3 : Q → T) (h4 : S → T) (h5 : T → U) : P → U := by
  intro
  apply h5
  apply h3
  apply h1
  assumption
