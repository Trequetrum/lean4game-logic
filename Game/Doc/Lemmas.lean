import GameServer.Commands

namespace GameLogic

def and_left {P Q : Prop} (h : P ∧ Q) : P := And.left h

/--
# ∧ Elimination Left
### and_left : P ∧ Q -> P`

If `h` is a term with a type like `AP∧ Q`

`and_left h`, `h.left` or `h.1` are all expressions for denoting the left-hand side of the given evidence. In this case, the left side has a type of `P`.
-/
TheoremDoc GameLogic.and_left as "and_left" in "∧"

def and_right {P Q : Prop} (h : P ∧ Q) : Q := And.right h

/--
# ∧ Elimination Right
### and_right : P ∧ Q -> Q`

If `h` is a term with a type like `P ∧ Q`

`and_right h`, `h.right` or `h.2` are all expressions for denoting the right-hand side of the given evidence. In this case, the left side has a type of `Q`.
-/
TheoremDoc GameLogic.and_right as "and_right" in "∧"

def and_intro {P Q : Prop} (left : P) (right : Q) : P ∧ Q := And.intro left right

/--
# and_intro
### `and_intro : P -> Q -> P ∧ Q`
`and_intro` is a function with two parameters. It takes two disparate pieces of evidence and combines them into a single piece of evidence. If `(e₁ : P)` and `(e₂ : Q)` are evidence, then
```
have h : P ∧ Q := and_intro e₁ e₂
```
-/
TheoremDoc GameLogic.and_intro as "and_intro" in "∧"

def false_elim {P : Prop} (h : False) : P := h.rec

/--
If
```
-- Assumptions
h : False
```
then
```
have t : T := false_elim h
```
will allow you to write any well formed proposition in place of `T`. This makes `false_elim` the \"From `False`, anything goes\" function. **Ex falso quodlibet**.
-/
TheoremDoc GameLogic.false_elim as "false_elim" in "¬"

def or_inl {P Q : Prop} (p : P) : Or P Q := Or.inl p

/--
# Or Introduction Left
Turns evidence for the lefthand of an `∨` proposition into a disjunction. The context must supply what the righthand side of the disjunction is.
```
-- Objects
P Q : Prop
-- Assumptions
p : P
```
allows:
```
have h : P ∨ Q := or_inl p
have h := (or_inl p : P ∨ Q)
have h := show P ∨ Q from or_inl p
```
-/
TheoremDoc GameLogic.or_inl as "or_inl" in "∨"

def or_inr {P Q : Prop} (q : Q) : Or P Q := Or.inr q

/--
# Or Introduction Right
Turns evidence for the righthand of an `∨` proposition into a disjunction. The context must supply what the lefthand side of the disjunction is.
```
-- Objects
P Q : Prop
-- Assumptions
q : Q
```
allows:
```
have h : P ∨ Q := or_inr q
have h := (or_inl q : P ∨ Q)
have h := show P ∨ Q from or_inl q
```
"
-/
TheoremDoc GameLogic.or_inr as "or_inr" in "∨"

def or_elim
  {P Q R : Prop}
  (h : P ∨ Q)
  (left : P → R)
  (right : Q → R) : R :=
    Or.elim h left right

/--
# Or Elimination
If you can conclude something from `A` and you can conclude the same thing from `B`, then if you know `A ∨ B` it won't matter which of the two happens as you can still guarentee something.

or_elim is also evidence:
```
or_elim : (P ∨ Q) → (P → R) → (Q → R) → R`
```
# Parameters
`or_elim` has three parameters:
1. takes evidence for a disjunction,
2. evidence an implication on the left,
3. evidence for an implication on the right.
# Example
`or_elim` is your first 3-paramater function.
```
pvq: P ∨ Q
pr : P → R
qr : Q → R
have r : R := or_elim pvq pr qr
```
-/
TheoremDoc GameLogic.or_elim as "or_elim" in "∨"

def iff_intro
  {P Q : Prop}
  (mp: P → Q)
  (mpr: Q → P) : P ↔ Q :=
    Iff.intro mp mpr

/--
TODO
-/
TheoremDoc GameLogic.iff_intro as "iff_intro" in "↔"

def iff_mp {P Q : Prop} (h : P ↔ Q) : P → Q := h.mp

/--
TODO
-/
TheoremDoc GameLogic.iff_mp as "iff_mp" in "↔"

def iff_mpr {P Q : Prop} (h : P ↔ Q) : Q → P := h.mpr

/--
TODO
-/
TheoremDoc GameLogic.iff_mpr as "iff_mpr" in "↔"

def modus_ponens {P Q : Prop} (hpq: P → Q) (p: P) : Q := hpq p

/--
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

You should never use this style of prefix `modus_ponens` and just use function application instead as that will generally be clearer.

----
# Infix Modus Ponens
There is are infix operators for function application; they look like `|>` and `<|`. `f <| x`, and `x |> f` means the same as the same as `f x`.

`<|` parses `x` with lower precedence, which means that `f <| g $ <|` is interpreted as `(f (g x))` rather than `((f g) x)`.

It's twin, `|>` chains such that `x |> f |> g` is interpreted as `g (f x)`.

What makes the infix operators usefull is that they can often replace a pair of brackets `(...)` making expressions easier to read.
-/
TheoremDoc GameLogic.modus_ponens as "modus_ponens" in "→"

def and_comm {P Q : Prop}: P ∧ Q ↔ Q ∧ P :=
  ⟨ λ⟨l,r⟩ ↦ ⟨r,l⟩,
    λ⟨l,r⟩ ↦ ⟨r,l⟩
  ⟩

/--
# ∧ is commutative

`and_comm` is evidence that `P ∧ Q ↔ Q ∧ P`
-/
TheoremDoc GameLogic.and_comm as "and_comm" in "∧"

def and_assoc {P Q R : Prop}: P ∧ Q ∧ R ↔ (P ∧ Q) ∧ R :=
  ⟨ λ⟨p,q,r⟩ ↦ ⟨⟨p,q⟩,r⟩,
    λ⟨⟨p,q⟩,r⟩ ↦ ⟨p,q,r⟩
  ⟩

/--
# ∧ is Associative

`and_assoc` is evidence that `P ∨ Q ∨ R ↔ (P ∨ Q) ∨ R`
-/
TheoremDoc GameLogic.and_assoc as "and_assoc" in "∧"

def or_comm {P Q : Prop}: P ∨ Q ↔ Q ∨ P :=
  ⟨ (Or.elim · Or.inr Or.inl),
    (Or.elim · Or.inr Or.inl)
  ⟩

/--
# ∨ is commutative

`or_comm` is evidence that `P ∨ Q ↔ Q ∨ P`
-/
TheoremDoc GameLogic.or_comm as "or_comm" in "∨"

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

/--
# ∨ is Associative

`or_assoc` is evidence that `P ∨ Q ∨ R ↔ (P ∨ Q) ∨ R`
-/
TheoremDoc GameLogic.or_assoc as "or_assoc" in "∨"

def imp_trans {P Q R : Prop} (hpq : P → Q) (hqr : Q → R) (p : P): R := hqr (hpq p)

/--
# → is transitive
`P → Q` and `Q → R` implies `P → R`
```
imp_trans : (P → Q) → (Q → R) → P → R
```

Of course, because of `and_comm`, you know you can flip this around too.
`Q → R` and `P → Q` implies `P → R` has a near-identical proof.

### Infix Operator:
`imp_trans` has an infix operator. This looks like `≫` (which is written as “`\\gg`”).

For the math-inclined, because the expression for an implication is a function, you can also use function composition for the same purpose (`∘` is written as “`\\o`”). Just remember that `∘` has the parameters swapped from the way `imp_trans` is defined.
-/
TheoremDoc GameLogic.imp_trans as "imp_trans" in "→"

infixl:85 " ≫ " => λa b ↦ Function.comp b a  -- type as \gg

def not_not_not {P : Prop}: ¬¬¬P ↔ ¬P := ⟨
  (λh p ↦ h (λnp ↦ np p)),
  (λnp nnp ↦ nnp $ np)
⟩

/--
# Negation is stable
A nice result of this theorem is that any more than 2 negations can be simplified down to 1 or 2 negations.
```
not_not_not : ¬¬¬P ↔ ¬P
```
-/
TheoremDoc GameLogic.not_not_not as "not_not_not" in "↔ extra"

def modus_tollens {P Q : Prop} (h: P → Q) (nq: ¬Q) : ¬P := h ≫ nq

/--
# Modus Tollens
Denying the consequent.

If P, then Q.\\
Not Q.\\
Therefore, not P.
```
mt : (P → Q) → ¬Q → ¬P
```

### Infix Operator:
`modus_tollens` is a specialized version of `imp_trans`, which makes it possible to use `≫` (which is written as “`\\gg`”) as an infix operator for `modus_tollens`.
-/
TheoremDoc GameLogic.modus_tollens as "modus_tollens" in "→"

def identity {P : Prop}(p : P) : P := p

/--
# Propositional Identity
This is the \"I think therefore I am\" of propositional logic. Like `True` it is a simple tautology whose truth requires no premises or assumptions — only reason alone.
```
identity : P → P
```
-/
TheoremDoc GameLogic.identity as "identity" in "→"
