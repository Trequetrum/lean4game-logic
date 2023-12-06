import GameServer.Commands

def modus_ponens {P Q : Prop} (hpq: P → Q) (p: P) : Q := hpq p

LemmaDoc modus_ponens as "modus_ponens" in "→" "
In this game, the deductive rule *modus_ponens* is just function application.
```
intro h : A ∧ B
have a : A := and_left h
-- could be written as
have a : A := modus_ponens and_left h
```
and
```
intro a : A
intro b : B
have h : A ∧ B := and_intro a b
-- could be written as
have h : A ∧ B := modus_ponens (modus_ponens and_intro a) b
```

You should never use this lemma and just use function application instead as that will generally be clearer.
"

def and_comm {P Q : Prop}: P ∧ Q ↔ Q ∧ P :=
  ⟨ λ⟨l,r⟩ ↦ ⟨r,l⟩,
    λ⟨l,r⟩ ↦ ⟨r,l⟩
  ⟩

LemmaDoc and_comm as "and_comm" in "↔" "
# ∧ is commutative

`and_comm` is evidence that `P ∧ Q ↔ Q ∧ P`
"

def and_assoc {P Q R : Prop}: P ∧ Q ∧ R ↔ (P ∧ Q) ∧ R :=
  ⟨ λ⟨p,q,r⟩ ↦ ⟨⟨p,q⟩,r⟩,
    λ⟨⟨p,q⟩,r⟩ ↦ ⟨p,q,r⟩
  ⟩

def or_comm {P Q : Prop}: P ∨ Q ↔ Q ∨ P :=
  ⟨ (Or.elim · Or.inr Or.inl),
    (Or.elim · Or.inr Or.inl)
  ⟩

LemmaDoc or_comm as "or_comm" in "↔" "
# ∨ is commutative

`or_comm` is evidence that `P ∨ Q ↔ Q ∨ P`
"

-- or_assoc
def or_assoc {P Q R : Prop}: P ∨ Q ∨ R ↔ (P ∨ Q) ∨ R :=
  have mp := (Or.elim ·
    (Or.inl ∘ Or.inl)
    (Or.elim · (Or.inl ∘ Or.inr) Or.inr))
  have mpr := (Or.elim ·
    (Or.elim · Or.inl (Or.inr ∘ Or.inl))
    (Or.inr ∘ Or.inr))
  ⟨mp,mpr⟩

-- or_assoc expanded
example {P Q R : Prop}: P ∨ Q ∨ R ↔ (P ∨ Q) ∨ R :=
  have mp := (λh ↦ Or.elim h
    (λp ↦ Or.inl (Or.inl p))
    (λh₂ ↦ Or.elim h₂
      (λq ↦ Or.inl (Or.inr q))
      (λr ↦ Or.inr r)))
  have mpr := (λh ↦ Or.elim h
    (λh₂ ↦ Or.elim h₂
        (λp ↦ Or.inl p)
        (λq ↦ Or.inr (Or.inl q)))
    (λr ↦ Or.inr (Or.inr r)))
  Iff.intro mp mpr

example {P Q R : Prop}: P ∨ Q ∨ R ↔ (P ∨ Q) ∨ R := by
  have mp : P ∨ Q ∨ R → (P ∨ Q) ∨ R := (Or.elim ·
    (Or.inl ∘ Or.inl)
    (Or.elim · (Or.inl ∘ Or.inr) Or.inr))
  have mpr : (P ∨ Q) ∨ R → P ∨ Q ∨ R := (Or.elim ·
    (Or.elim · Or.inl (Or.inr ∘ Or.inl))
    (Or.inr ∘ Or.inr))
  exact ⟨mp,mpr⟩

def imp_trans {P Q R : Prop} (hpq : P → Q) (hqr : Q → R) (p : P): R := hqr (hpq p)
LemmaDoc imp_trans as "imp_trans" in "→" "
# → is transitive
`P → Q` and `Q → R` implies `P → R`
```
imp_trans : (P → Q) → (Q → R) → P → R
```
"

def not_not_not {P : Prop}: ¬¬¬P ↔ ¬P := ⟨
  (λh p ↦ h (λnp ↦ np p)),
  (λh np ↦ np h)
⟩

LemmaDoc not_not_not as "not_not_not" in "↔" "
# Negation is stable
```
not_not_not : ¬¬¬P ↔ ¬P
```
"

LemmaDoc mt as "mt" in "→" "
# Modus Tollens
Denying the consequent. We've given this theorem an extra short name because it appears so often.

If P, then Q.\\
Not Q.\\
Therefore, not P.
```
mt : (P → Q) → ¬Q → ¬P
```
"
