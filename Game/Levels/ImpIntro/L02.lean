import Game.Metadata

open GameLogic

World "ImpIntro"
Level 2
Title "Identity"

NewDefinition GameLogic.FunIntro
OnlyTactic
  exact
  «have»

Introduction "
# Is it Cake!?
There's a show on TV about cake. It asks bakers to distinguish between every-day objects and cakes. This seems silly, because a cake is a cake.
# Proposition Key:
- `C` — This object is a Cake
# Implication “ → ”
You'll notice that this time you don't have any assumptions. Fortunately, `C → C` is a tautology which means you can create an expression for the goal without any assumptions.\\
\\
In this game, when you need to show an implication, you write a function. Creating a function requires an assumption and an expression. The assumption is introduced with two parts: `(n : P)` where `n` is any name of your choosing and the `P` is a well formed proposition.\\
\\
It looks like this:
```
fun <name> : <Prop> => <expr>
λ <name> : <Prop> ↦ <expr>
```
Often, when you're writing a function, the game will already know what proposition it's expecting. In such cases, the `<Prop>` becomes an optional part of the function.

# A hint
Just fill in the `<expr>` below:
```
-- Assuming h is evidence for C,
-- write an expression for evidence of C
exact λ h : C ↦ <expr>
```
"

/-- Common! Cake is Cake -/
Statement (C: Prop) : C → C := by
  exact λ(h: C) ↦ h

example (C: Prop) : C → C := by
  exact λh ↦ h


Conclusion "
Once you've gathered evidence confirming that the object is a cake, the game becomes straightforward. The show's appeal lies not in the simple truism that a cake is a cake but rather in the contestants' skill to compile credible evidence. Typically, the most compelling evidence is presented by the host when he cuts into the object, unveiling its contents.

----
# A Tip
Moreover, since the goal already specifies the expected type of evidence, you can streamline your function without explicitly writing out the assumed proposition.
```
exact λ(h : C) ↦ h
-- can be written
exact λh ↦ h
```
"
