import Game.Metadata

open GameLogic

World "IffTactic"
Level 5
Title "Rewriting"

OnlyTactic
  assumption
  cases
  «repeat»
  constructor
  intro
  apply
  left
  right
  exfalso

Introduction "
# A Longer Level
The `rw` tactic makes this level a cakewalk. For the redux version we're going to make this outright tedius, but this will show without a doubt that you've mastered simple propositional proofs.\\
\\
I suggest you finish the other redux worlds before doing this level.\\
\\
We're not allowing `have`, `exact`, or `rw` for this level. It's certainly doable this way... good luck.
"

/-- This one takes a while -/
Statement
  (P Q R S : Prop)
  (h1 : R ↔ S)
  (h2 : ¬((P → Q ∨ ¬S) ∧ (S ∨ P → ¬Q) → (S → Q)) ↔ P ∧ Q ∧ ¬S)
  : ¬((P → Q ∨ ¬R) ∧ (R ∨ P → ¬Q) → (R → Q)) ↔ P ∧ Q ∧ ¬R := by
    cases h1
    cases h2
    constructor
    intro h3
    constructor
    apply and_left
    apply mp_1
    intro x
    apply h3
    intro ⟨pqnr,rpnq⟩ r
    apply x
    constructor
    intro p
    cases pqnr p
    left
    assumption
    right
    intro s
    apply h
    apply mpr
    assumption
    intro
    intro q
    apply rpnq
    left
    repeat assumption
    apply mp
    assumption
    constructor
    apply and_left
    apply and_right
    apply mp_1
    intro x
    apply h3
    intro ⟨pqnr,rpnq⟩ r
    apply x
    constructor
    intro p
    cases pqnr p
    left
    assumption
    right
    intro s
    apply h
    apply mpr
    assumption
    intro sp
    apply rpnq
    cases sp
    left
    apply mpr
    assumption
    right
    assumption
    apply mp
    assumption
    apply modus_tollens
    assumption
    apply and_right
    apply and_right
    apply mp_1
    intro x
    apply h3
    intro ⟨pqnr, rpnq⟩ r
    apply x
    constructor
    intro p
    cases pqnr p
    left
    assumption
    right
    intro
    apply h
    assumption
    intro
    apply rpnq
    left
    assumption
    apply mp
    assumption
    intro ⟨p, q, nr⟩
    intro
    apply mpr_1
    constructor
    assumption
    constructor
    assumption
    apply modus_tollens
    repeat assumption
    intro
    intro
    assumption

example
  (P Q R S : Prop) (h1 : R ↔ S)
  (h2 : ¬((P → Q ∨ ¬S) ∧ (S ∨ P → ¬Q) → (S → Q)) ↔ P ∧ Q ∧ ¬S)
  : ¬((P → Q ∨ ¬R) ∧ (R ∨ P → ¬Q) → (R → Q)) ↔ P ∧ Q ∧ ¬R := by
    apply iff_intro (
      λh3 ↦ have ⟨p,q,ns⟩ := h2.mp (
        λh₄ ↦ h3 (λ⟨hl₅,hr₅⟩ r ↦ h₄ ⟨
          λp ↦ or_elim
            (hl₅ p)
            or_inl
            (imp_trans h1.mpr ≫ or_inr)
        ,
          λ_ ↦ hr₅ (or_inl r)
        ⟩ (h1.mp r))
      )
      ⟨p, q, h1.mp ≫ ns⟩
    ) (
      λ⟨p,q,nr⟩ _ ↦ false_elim (
        h2.mpr
          ⟨p, q, h1.mpr ≫ nr⟩
          λ_ _ ↦ q
      )
    )
