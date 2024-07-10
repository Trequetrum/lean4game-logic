import GameServer.Commands

namespace GameLogic

/--
# Conjunction
## Introduction
An “And” can be introduced with the `and_intro` theorem. Conjunctions and biconditionals can both be constructed using the angle bracket notation as well.
### Examples
```
-- Assumptions
p : P
q : Q
-- Each new term is evidence for P ∧ Q
-- Explicit Constructor, no annotations needed
have h₁ := and_intro p q
have h₂ := and_intro (left := p) (right := q)
-- Implicit Constructor, annotations based on context
-- Type these angle brackets with “\<” and “\>”
have h₆ : P ∧ Q := ⟨p,q⟩
have h₇ := (⟨p,q⟩ : P ∧ Q)
```
## Elimination
An “And” like `h : P ∧ Q` can be reduced in two ways:
1. Acquire evidence for `P` using `and_left h` or `h.left`
2. Acquire evidence for `Q` using `and_right` or `h.right`
-/
DefinitionDoc GameLogic.and_def as "∧"

/--
# Disjunction
## Introduction
An “Or” like `h : P ∨ Q` can be introduced in two ways:
1. If you have `p : P`, you can use `or_inl p`
2. If you have `q : Q`, you can use `or_inr q`

In either case, remember that the other type in your disjunction must be inferable in context or supplied as part of the expression. For example: `(or_inl p : P ∨ Q)`
## Elimination
An “Or” like `h : P ∨ Q` can be be eliminated if both P and Q imply the same proposition. In this example, P or Q implies R:
```
-- Assumptions
pvq: P ∨ Q
pr : P → R
qr : Q → R
-- Goal: R
exact or_elim pvq pr qr
```
-/
DefinitionDoc GameLogic.or_def as "∨"

/--
# False
This is a proposition for which there can never be any evidence. If your assumptions lead you to evidence for `False`, then your assumptions are inconsitent and you can use `false_elim` to deduce any proposition you like.
-/
DefinitionDoc GameLogic.false_def as "False"

/--
# Biconditional
## Introduction
An “If and only if” can be introduced with the `iff_intro` theorem. Biconditionals and conjunctions can both be constructed using the angle bracket notation as well.
### Examples
```
-- Assumptions
h₁ : P → Q
h₂ : Q → P
-- Each new term is evidence for P ↔ Q
-- Explicit Constructor, no annotations needed
have h₁ := iff_intro h₁ h₂
have h₂ := iff_intro (mp := h₁) (mpr := h₂)
-- Implicit Constructor, annotations based on context
-- Type these angle brackets with “\<” and “\>”
have h₆ : P ↔ Q := ⟨h₁, h₂⟩
have h₇ := (⟨h₁, h₂⟩ : P ↔ Q)
```
## Elimination
An “If and only if” like `h : P ↔ Q` can be reduced in two ways:
1. Acquire evidence for `P → Q` using `iff_mp h` or `h.mp`
2. Acquire evidence for `Q → P` using `iff_mpr h` or `h.mpr`
## Rewrite
Biconditionals let you use the `rewrite` tactic to change goals or assumptions.
-/
DefinitionDoc GameLogic.iff_def as "↔"

/--
# Function Application/Implication Elimination
`P → Q` is propostion given to functions from evidence of `P` to evidence of `Q`.
# Juxtaposition
Juxtaposition just means “to place next to each other,” which is what we'll do to give a parameter to a function.
### Example
```
-- Assumptions
e₁ : P
e₂ : Q
Goal:
P ∧ Q
```
----
```
exact (and_intro e₁ e₂)
```
### Example
```
-- Assumptions
a : A
h₁ : A → B
-- Goal
B
```
---
```
exact (h₁ a)
```
Takes `h₁` and applies `a` to it.
-/
DefinitionDoc GameLogic.FunElim as "→ elim"

/--
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
----
- `have h₁ : P → P := λp ↦ p`
- `have h₂ : P ∧ Q → P := λh ↦ h.left`
-/
DefinitionDoc GameLogic.FunIntro as "→ intro"

/--
### **Logic Constants & Operators**
| $Name~~~$ | $Ascii~~~$ | $Unicode$ | $Unicode Cmd$ |
| --- | :---: | :---: | --- |
| True | `True` |  |  |
| False | `False` |  |  |
| Not | `Not` | ¬ | `\n` `\not` `\neg` `\lnot` |
| And | `/\` | ∧ | `\and` `\an` `\wedge` |
| Or | `\/` | ∨ | `\v` `\or` `\vee` |
| Implies | `->` | → | `\r` `\imp` `\->` `\to` `\r-` `\rightarrow` |
| Iff | `<->` | ↔ | `\iff` `\lr-` `\lr` `\<->` `\leftrightarrow` |
| For All | `foral` | ∀ | `\all` `\forall` |
| Exists | `exists` | ∃ | `\ex` `\exists` |

### **Anonymous Function**
Example:
An anonymous function that swaps a conjunction
```
-- Ascii
fun h : P ∧ Q => and_intro (and_right h) (and_left h)
-- Unicode
λh : P ∧ Q ↦ ⟨h.right, h.left⟩
```
| $Ascii~~~$ | $Unicode~~~$ | $Unicode Cmd$ |
| --- | :---: | --- |
| `fun` | λ | `\fun` `\la` `\lambda` `\lamda` `\lam` `\Gl` |
| `=>` | ↦ | `\map` `\mapsto` |

### **Other Unicode**
| $Name$ | $Unicode~~~$ | $Unicode Cmd$ |
| --- | :---: | --- |
| Angle brackets | ⟨ ⟩ | `\<` `\>` `\langle` `\rangle` |
| Subscript Numbers | ₁ ₂ ₃ ... | `\1` `\2` `\3` ... |
| Left Arrow | ← | `\l` `\leftarrow` `\gets` `\<-` |
| Turnstyle | ⊢ | `\│-` `\entails` `\vdash` `\goal` |
-/
DefinitionDoc GameLogic.AsciiTable as "Unicode Table"

/--
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
### Propositional Operators
| $Operator$ | $~~~Precedence$ | |
| :---: | :---: | --- |
| ¬ | max | |
| ∧ | 35 | right-associative |
| ∨ | 30 | right-associative |
| → | 25 | right-associative |
| ↔ | 20 | non-associative |
| ∃ | __ | |
| ∀ | __ | |
### Expression Operators
| $Operator$ | $~~~Precedence$ | |
| :---: | :---: | --- |
| ≫ | 85 | left-associative |
| |> | min + 1 | right-associative |
| <| | min | left-associative |
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
-/
DefinitionDoc GameLogic.Precedence as "Precedence"
