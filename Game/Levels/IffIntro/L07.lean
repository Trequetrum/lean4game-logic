import Game.Metadata

namespace GameLogic

World "IffIntro"
Level 7
Title "IffBoss"

OnlyTactic
  exact
  «have»

Introduction "
# BOSS LEVEL
This is an involved level. It doesn't require you to do anything tricky, but there are a lot of moving parts and it is easy to lose track of what you're doing.\\
\\
I recommend editor mode. Think about what this is asking you to prove and use `have` to give yourself any auxillary facts that don't exist under your theorems.
"

Statement (P Q R : Prop): (P ∧ Q ↔ R ∧ Q) ↔ Q → (P ↔ R) := by
  exact ⟨
    λ⟨pr,rp⟩ q ↦ ⟨λp ↦ (pr ⟨p,q⟩).left, λr ↦ (rp ⟨r,q⟩).left⟩,
    λqpr ↦ ⟨λ⟨p,q⟩ ↦ ⟨(qpr q).mp p, q⟩, λ⟨r,q⟩ ↦ ⟨(qpr q).mpr r, q⟩⟩
  ⟩
