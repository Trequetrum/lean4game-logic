import Game.Metadata

namespace GameLogic

World "IffTactic"
Level 7
Title "IffBoss"

Introduction "
# BOSS LEVEL
This is an involved level. Tactics can be especially helpful in that much of the bookkeeping is done on your behalf. Good luck.
"

Statement (P Q R : Prop): (P ∧ Q ↔ R ∧ Q) ↔ Q → (P ↔ R) := by
  constructor
  intro ⟨pr, rp⟩
  intro q
  constructor
  intro p
  apply and_left
  apply pr
  constructor
  repeat assumption
  intro r
  apply and_left
  apply rp
  constructor
  repeat assumption
  intro qpr
  constructor
  intro ⟨p,q⟩
  rw [← qpr q]
  constructor
  repeat assumption
  intro ⟨r,q⟩
  rw [qpr q]
  constructor
  repeat assumption
