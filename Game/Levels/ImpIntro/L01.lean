import Game.Metadata

open GameLogic

World "ImpIntro"
Level 1
Title "Cake Delivery Service"

NewDefinition GameLogic.FunElim
NewTheorem GameLogic.modus_ponens
OnlyTactic
  exact
  «have»

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

You can read `h₁ a` as modus ponens. In fact, you've unlocked a theorem called `modus_ponens` that you could use here. Since modus ponens is implemented as function application, you can — and should — always just Juxtapose instead.
# A note
You'll often see assumptions given one or two letter names (`p`, `r`, `q`, `h₁`, `h₂`, `h₃`, etc). Assumptions are generally not long-lived. They are part of some expression, exhibit some implication, and then are discarded. Their names in this context don't need to be particularly memorable.\\
\\
Theorems — like those on the right side of the game screen — can be thought of as assumptions that are always available for every level (and therefore do not need to be listed under assumptions for any given level). They tend to have longer names because they will be available for all future levels.\\
\\
Name-length is not a hard and fast rule, just a common idiom. For a counter-example; this level gives the assumption `bakery_service` a longer name.

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
