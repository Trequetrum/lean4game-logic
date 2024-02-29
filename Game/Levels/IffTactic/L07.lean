import Game.Metadata

namespace GameLogic

World "IffTactic"
Level 7
Title "IffBoss"

Introduction "
# BOSS LEVEL
This is an involved level. Tactics can be especially helpful in that much of the bookkeeping is done on your behalf. Good luck.

There are no restrictions this level. Use everything you've learned.
"

Statement (P Q R : Prop): (P ∧ Q ↔ R ∧ Q) ↔ Q → (P ↔ R) := by
  constructor
  intro ⟨pr, rp⟩
  intro
  constructor
  intro
  apply and_left
  apply pr
  constructor
  repeat assumption
  intro
  apply and_left
  apply rp
  constructor
  repeat assumption
  intro qpr
  constructor
  intro ⟨_,q⟩
  rw [← qpr q]
  constructor
  repeat assumption
  intro ⟨_,q⟩
  rw [qpr q]
  constructor
  repeat assumption
