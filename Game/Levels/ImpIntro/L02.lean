import Game.Metadata

World "ImpIntro"
Level 2
Title "Identity"

NewDefinition FunIntro

Introduction "
# Is it Cake!?
There's a show on TV about cake. It asks bakers to distinguish between every-day objects and cakes. This seems silly, because a cake is a cake.
# Proposition Key:
- `C` — This object is a Cake
# Implication \" → \"
You'll notice that this time you don't have any assumptions. Fortunatly, `C → C` is a tautology which means you can create an expression for the goal without any assumptions.\\
\\
In this game, when you need to show an implication, you write a function. For the function, you can assume the lefthand side of the implication and then potentially use that assumption to show the righthand side.
```
fun <name> : <Prop> => <expr>
λ <name> : <Prop> ↦ <expr>
```
In general, you can use whatever you like for the **name** and **proposition**. In this case, you want to show evidence that `C → C`. Below is a hint (just fill in the **expression**):
```
-- Assuming h is evidence for C,
-- write an expression for evidence of C
λ h : C ↦ <expr>
```
### Another reminder
Exhibit evidence using the exact tactic.
"

/-- Common! Cake is Cake --/
Statement (C: Prop) : C → C := by
  exact λ(h: C) ↦ h

Conclusion "
Once you've gathered evidence confirming that the object is a cake, the game becomes straightforward. The show's appeal lies not in the simple truism that a cake is a cake but rather in the contestants' skill to compile credible evidence. Typically, the most compelling evidence is presented by the host when he cuts into the object, unveiling its contents.

----
# A Tip
Moreover, since the goal already specifies the expected type of evidence, you can streamline your function without explicitly writing out the assumed proposition.
```
exact λh ↦ h
```
"
