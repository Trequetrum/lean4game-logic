import Game.Levels.AndIntro.L01
import Game.Levels.AndIntro.L02
import Game.Levels.AndIntro.L03
import Game.Levels.AndIntro.L04
import Game.Levels.AndIntro.L05
import Game.Levels.AndIntro.L06
import Game.Levels.AndIntro.L07
import Game.Levels.AndIntro.L08

World "AndIntro"
Title "∧ Tutorial: Party Invites"

Introduction
"
# Let the festivities commence!
You're hosting your yearly soirée, and it's time to start planning! Last year your planning went so poorly that nobody showed up. Not for lack of trying though, they just wound up at a number of bewildering addresses. The silver lining was that all your friends were safe from the fire when, accidentally, you burned down your entire apartment building.\\
\\
This year will be different‼ This year, if you want to be sure that there will be fancy cheeses, you had better have evidence that somebody is bringing the cheese platter.

World 1: **Party Invites** is a tutorial world that is meant to introduce you to conjunction — the logical “and”. The symbol used to denote an “and” looks like “`∧`”. You'll learn to how to use evidence to create an `∧` and also how to get evidence out when it's been `∧`ed together.\\
\\
The real-world analogues for evidence of `A ∧ B` might be a box with evidence for `A` and evidence for `B`, an audio recording with both pieces of evidence, or a tree with evidence in its branches.\\
\\
While real-world analogues can be anything, the abstract machinery used in this game will always be the same. In the case of the `∧` operator, the game stores the associated evidence in a tuple data structure.\\
\\
The details aren't important. Each level will be encoded for you into the symbols of a proof state. The puzzle, at its core, will be about symbol manipulation. Much of the text is there for added fun and flair.

# **Aside**: Expressions
If you're coming at this as a puzzle, part of the goal of the tutotial worlds is to teach you how to form expressions and to think about what they evaluate to. Consider how how these expressions all evaluate to the same number:
```
4 + 6
(4) + 6
(4) + (6)
3 + 1 + 6
3 + (1 + 6)
4 + 4 + 2
(4 * 2) + 2
```
and how some things which may look like expressions really are not:
```
4 6
4 +
4 (++) 6
(4 +) 6
```
The expressions that this game is asking you to form are mostly in prefix form. In context, this means the operation is given a textual name instead of a symbol and the parameters are separated by spaces **after** the name. For example, the above expressions may look like:
```
add 4 6
add (4) 6
add (4) (6)
add (add 3 1) 6
add 3 (add 1 6)
add (add 4 4) 2
add (mul 4 2) 2
```
We're not using expressions to express numbers, but many of the concepts do carry over. Instead of numbers, we're working with logical inferences.
"
