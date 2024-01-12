import Game.Metadata

open GameLogic

World "IffTactic"
Level 1
Title "Iff_Intro"

OnlyTactic
  assumption
  constructor
  «repeat»

Introduction "
# Using Tactics
The tactics available to you should provide a hint for what to do. You'll be using a tactic in a context you havn't tried before, but the result should make sense once you try it and see what happens.
"

Statement (P Q : Prop) (hsj: Q → P) (hjs: P → Q) : Q ↔ P := by
  constructor
  repeat assumption
