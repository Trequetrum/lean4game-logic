import Game.Metadata

open GameLogic

World "ImpIntro"
Level 1
Title "Cake Delivery Service"

NewDefinition GameLogic.FunElim
NewLemma GameLogic.modus_ponens

Introduction "
# Let there be cake!
You've found an online bakery service. Their website details how the cake delivery service works.\\
\\
If you send them evidence of payment, then you'll receive an email detailing when the cake will be delivered. The system is automated for you, so you can send it evidence of payment as often as you like and it'll always instantly return the same evidence that the cake will be delivered.
# Proposition Key:
- `P` — You've **P**aid for the cake
- `C` — The **C**ake will be delivered
# Implication \" → \"
You use an implication the same way you've been using `and_intro`, `and_left`, and `and_right`. You write out the name of the implication and then write the name of the evidence required for the left side of the \" → \" next to it. Juxtaposition just means “to place next to each other,” which is what this is style of function application is called.
- assumption `a : A`
- assumption `h₁ : A → B`
- have `b : B := h₁ a`

You can read `h₁ a` as modus ponens. In fact, you've unlocked a theorem called modus_ponens that you could use here. Since modus ponens is implemented as function application, you can — and should — always just Juxtapose instead.
# A retrospective
You've already been using functions. When you wrote `and_intro p s` in **World 1, Level 2**, you gave the the function `and_intro` two parameters `p : P` and `s : S` and then it returned evidence for `P ∧ S`. \\
\\
In World 1, level 7 when you wrote:
```
have h₁ := and_left h
have h₂ := and_right h₁
have h₃ := and_left h₂
have h₄ := and_left h₃
have h₅ := and_right h₄
exact h₅
-- or
exact and_right (and_left (and_left (and_right (and_left h))))
-- or
exact h.left.right.left.left.right
```
You were actually treating `and_left` as evidence of `P ∧ Q → P` and you were treating `and_right` as evidence of `P ∧ Q → Q`. Using the game's notation: `and_left : P ∧ Q → P` and `and_right : P ∧ Q → Q`
# A note
You'll often see assumptions given one or two letter names (`p`, `r`, `q`, `h₁`, `h₂`, `h₃`, etc). Assumptions are generally not long-lived. They are part of some expression, exhibit some implication, and then are discarded. Their names in this context don't need to be particularly memorable. Theorems — like those on the right side of the game screen — are not fundamentally different from assumptions, but they tend to have longer names because they will be available for all future levels. This level gives an assumption a longer name just for the sake of it.

# Reminder
Exhibit evidence for the goal using the `exact` tactic.
"

/-- Exhibit evidence that cake will be delivered to the party -/
Statement (P C: Prop)(p: P)(bakery_service : P → C) : C := by
  have c := bakery_service p
  exact c

example (P C: Prop)(p: P)(bakery_service : P → C) : C := by
  exact bakery_service p

example (P C: Prop)(p: P)(bakery_service : P → C) : C := by
  exact modus_ponens bakery_service p

Conclusion "
Congratulations. You have evidence that your party will have cake!

----
1:
```
have c := bakery_service p
exact c
```
2:
```
exact bakery_service p
```
3:
```
exact modus_ponens bakery_service p
```
"
