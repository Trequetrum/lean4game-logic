import GameServer.Commands

def and_left {P Q : Prop} (h : P ∧ Q) : P := And.left h

DefinitionDoc and_left as "∧-e left" "
# ∧ Elimination Left
### and_left : ∀P Q: Prop, P ∧ Q -> P`

If `h` is a term with a type like `A ∧ B`

`and_left h`, `h.left` or `h.1` are all expressions for denoting the left-hand side of the given evidence. In this case, the left side has a type of `A`.
"

def and_right {P Q : Prop} (h : P ∧ Q) : Q := And.right h

DefinitionDoc and_right as "∧-e right" "
# ∧ Elimination Right
### and_right : ∀P Q: Prop, P ∧ Q -> Q`

If `h` is a term with a type like `A ∧ B`

`and_right h`, `h.right` or `h.2` are all expressions for denoting the right-hand side of the given evidence. In this case, the left side has a type of `B`.
"

def and_intro {P Q : Prop} (left : P) (right : Q) : P ∧ Q := And.intro left right

DefinitionDoc and_intro as "∧ intro" "
# and_intro
### `and_intro : ∀P Q: Prop, P -> Q -> P ∧ Q`
`and_intro` take two disparate pieces of evidence and combines them into a single piece of evidence. If e₁ and e₂ are evidence, then
```
and_intro e₁ e₂
```
## Auxilliary:
Since this is done so often, here are a whole handfull of ways to combine evidence. They all build the same conjunction in the end, so you can use whichever suits you.
```
-- Assumptions
p : P
q : Q
-- Each new term is evidence for P ∧ Q
-- Explicit Constructer, no annotations needed
have h₁ := and_intro p q
have h₂ := and_intro (left := p) (right := q)
-- Implicit Structure, annotations based on context
have h₃ : P ∧ Q := {left := p, right := q}
have h₄ := ({left := p, right := q} : P ∧ Q)
have h₅ := {left := p, right := q : P ∧ Q}
-- Implicit Constructuer, annotations based on context
have h₆ : P ∧ Q := ⟨p,q⟩
have h₇ := (⟨p,q⟩ : P ∧ Q)
```
"

DefinitionDoc FunElim as "→ elim" "
# Function Application/Implication Elimination
`A → B` is type given to functions from elements of `A` to elements of `B`. When `A` and `B` are propositions, then it can be seen as either a function from evidence of `A` to evidence of `B` or as the logical implication `A → B`.

This is not an overloading of the → symbol, but rather a conflation. We've set up our logical system so that the rules of function application and the rules for → elim (Modus Ponens) are identicle.

```
-- Assumptions
a : A
h₁ : A → B
-- Goal B
exact h₁ a
```
"

DefinitionDoc FunIntro as "→ intro" "
# `fun _ => _`
You can create evidence for an implication by defining the appropriate function.
- `have h₁ : P → P := fun p : P => p`
- `have h₂ : P ∧ Q → P := fun h : P ∧ Q => h.left`

Generally, you don't need to repeat the types when they're obvious from the context.
- `have h₁ : P → P := fun p => p`
- `have h₂ : P ∧ Q → P := fun h => h.left`

# Unicode:
- `fun` can be written as `λ`
- `=>` can be written as `↦`
"

DefinitionDoc AsciiTable as "Symbol Table" "
### **Logic Constants & Operators**
| $Name~~~$ | $Ascii~~~$ | $Unicode$ | $Unicode Cmd$ |
| --- | :---: | :---: | --- |
| True | `True` |  |  |
| False | `False` |  |  |
| Not | `Not` | ¬ | `\\n` `\\not` `\\neg` `\\lnot` |
| And | `/\\` | ∧ | `\\and` `\\an` `\\wedge` |
| Or | `\\/` | ∨ | `\\v` `\\or` `\\vee` |
| Implies | `->` | → | `\\r` `\\imp` `\\\\->` `\\to` `\\r-` `\\rightarrow` |
| Iff | `<->` | ↔ | `\\iff` `\\lr-` `\\lr` `\\<->` `\\leftrightarrow` |
| For All | `foral` | ∀ | `\\all` `\\forall` |
| Exists | `exists` | ∃ | `\\ex` `\\exists` |

### **Anonymous Function**
Example:\\
An anonymous function that swaps a conjunction
```
-- Ascii
fun h : P ∧ Q => and_intro (and_right h) (and_left h)
-- Unicode
λh : P ∧ Q ↦ ⟨h.right, h.left⟩
```
| $Ascii~~~$ | $Unicode~~~$ | $Unicode Cmd$ |
| --- | :---: | --- |
| `fun` | λ | `\\fun` `\\la` `\\lambda` `\\lamda` `\\lam` `\\Gl` |
| `=>` | ↦ | `\\map` `\\mapsto` |

### **Other Unicode**
| $Name$ | $Unicode~~~$ | $Unicode Cmd$ |
| --- | :---: | --- |
| Angle brackets | ⟨ ⟩ | `\\<` `\\>` `\\langle` `\\rangle` |
| Subscript Numbers | ₁ ₂ ₃ ... | `\\1` `\\2` `\\3` ... |
"

DefinitionDoc Precedence as "Precedence" "
# Remembering Algebra
In math class, you may have learned an acronym like BEDMAS or PEMDAS to remember the precedence of operators in your math expressions:
1. Brackets (or Parentheses)
2. Exponents
3. Division or Multiplication
4. Addition or Subtraction

These rules exist for the logical operators as well.
# Brackets
Brackets group or disambiguate expressions. You can think of precedence rules as deciding where brackets belong. If an operator is an infix operator, then it has an associativity as well.
- right-associative: `P ∧ Q ∧ R` ≡ `P ∧ (Q ∧ R)`
- left-associative: `1 + 2 + 3` ≡ `(1 + 2) + 3`
- non-associative: `P ↔ Q ↔ R` is an error
# High to low Precedence
Function application doesn't have an operator, it's just `function <space> argument`. It has max precedence and is left associative (meaning `and_intro p q` ≡ `(and_intro p) q`).
| $Operator$ | $~~~Precedence$ | |
| :---: | :---: | --- |
| ¬ | max | |
| ∧ | 35 | right-associative |
| ∨ | 30 | right-associative |
| → | 25 | right-associative |
| ↔ | 20 | non-associative |
| ∃ | _10_ | |
| ∀ | _05_ | |
### Example:
```
¬P ∨ Q ∧ P → Q ↔ Q ∨ R ∨ ¬S
-- ¬ binds the tightest:
(¬P) ∨ Q ∧ P → Q ↔ Q ∨ R ∨ (¬S)
-- Next is ∧
(¬P) ∨ (Q ∧ P) → Q ↔ Q ∨ R ∨ (¬S)
-- Next is ∨, associated right
(¬P) ∨ (Q ∧ P) → Q ↔ Q ∨ (R ∨ (¬S))
-- The rest of ∨
((¬P) ∨ (Q ∧ P)) → Q ↔ (Q ∨ (R ∨ (¬S)))
-- Next is →
(((¬P) ∨ (Q ∧ P)) → Q) ↔ (Q ∨ (R ∨ (¬S)))
-- No more steps as this is fully disambiguated
```
Here's a version where you can see it aligned
```
   ¬P  ∨  Q ∧ P   → Q  ↔  Q ∨  R ∨  ¬S
  (¬P) ∨  Q ∧ P   → Q  ↔  Q ∨  R ∨ (¬S)
  (¬P) ∨ (Q ∧ P)  → Q  ↔  Q ∨  R ∨ (¬S)
  (¬P) ∨ (Q ∧ P)  → Q  ↔  Q ∨ (R ∨ (¬S))
 ((¬P) ∨ (Q ∧ P)) → Q  ↔ (Q ∨ (R ∨ (¬S)))
(((¬P) ∨ (Q ∧ P)) → Q) ↔ (Q ∨ (R ∨ (¬S)))
```
"

def false_elim {P : Prop} (h : False) : P := h.rec

DefinitionDoc false_elim as "false_elim" "
TODO
"

def or_inl {P Q : Prop} (p : P) : Or P Q :=
  Or.inl p

DefinitionDoc or_inl as "or_inl" "
TODO
"

def or_inr {P Q : Prop} (q : Q) : Or P Q :=
  Or.inr q

DefinitionDoc or_inr as "or_inr" "
TODO
"

def or_elim
  {P Q R : Prop}
  (h : P ∨ Q)
  (left : P → R)
  (right : Q → R) : R :=
    Or.elim h left right

DefinitionDoc or_elim as "or_elim" "
TODO
"
