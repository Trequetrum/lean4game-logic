-- Here's the import to make Lean know about things called `Game`s
import GameServer.Commands

-- Here are the imports defining many worlds for the game `Game` (the natural number game,
-- in this case). Each world consists of a finite number of levels, and levels
-- are numbered 1,2,3,4... inside the level files.
import Game.Levels.AndIntro
import Game.Levels.ImpIntro
import Game.Levels.NotIntro
import Game.Levels.OrIntro
import Game.Levels.IffIntro

-- Here's where we show how to glue the worlds together
Dependency AndIntro → ImpIntro
Dependency ImpIntro → NotIntro
Dependency ImpIntro → OrIntro
Dependency ImpIntro → IffIntro

-- Here's what we'll put on the title screen
Title "A Lean Intro to Logic"
Introduction
"
# An Introduction to Constructive Logic
This is a game about evidence and propositions.

To play this puzzler you'll need to learn some notation. Unlike learning how to do a crossword or solve a Sudoku, the notation is a bit more involved. As the levels progress, you will — in effect — be learning a small part of a programming language. Just enough to prove (or construct evidence for) propositions and predicates.

Below, you're provided with whirlwind tour of the notation at play as well as a bit of motivation for why the notation looks the way it does. This is all done through a single example. Many of the details will seem lacking; The concepts covered here will be addressed with more detail during the tutorial worlds of this game.

# But first, a tip!
This introduction as well as some of the tutorial levels can get a bit wordy. The three column panels — text on the left, game worlds in the middle, and your inventory on the right — can all be expanded or shrunk as necessary. Every screen is different, so do feel encouraged to re-size these panels.

# Building some notation
Consider the following argument stated in natural language:

“Either cat fur or dog fur was found at the scene of the crime. If dog fur was found at the scene of the crime, Officer Thompson had an allergy attack. If cat fur was found at the scene of the crime, then Macavity is responsible for the crime. But Officer Thompson didn’t have an allergy attack, and so therefore Macavity must be responsible for the crime.” [¹]

Does this argument convince you? The validity of this argument can be made more obvious by representing the chain of reasoning leading from the premises to the conclusion:
1. Either cat fur was found at the scene of the crime, or dog fur was found at the scene of the crime. (Premise)
2. If dog fur was found at the scene of the crime, then Officer Thompson had an allergy attack. (Premise)
3. If cat fur was found at the scene of the crime, then Macavity is responsible for the crime. (Premise)
4. Officer Thompson did not have an allergy attack. (Premise)
5. Dog fur was not found at the scene of the crime. (Follows from 2 and 4)
6. Cat fur was found at the scene of the crime. (Follows from 1 and 5)
7. Therefore Macavity is responsible for the crime. (Follows from 3 and 6)

If you take a moment to re-read them again, lines 5, 6, & 7 are all slightly different styles of logical deductions.

- Line 5 is deducing the negation of the left-hand side of an \"if ... then ...\" statement. Just for references' sake, we'll give this style of reasoning a name: **modus tollens** (Feel free to search that name ☺ )
- Line 6 is using the process of elimination on two options. This is the style of reasoning responsible for Sherlock Holmes' most famous quote — \"When you have eliminated the impossible, whatever remains, however improbable, must be the truth\". We'll give this a name too: **modus tollendo ponens**
- Line 7 is the conclusion and is applying the \"if ... then ...\" statement on line 3. We'll call this one **modus ponens**.

We won't always be denoting these with Latin names, but the general process of being able to give some generically useful deductive reasoning a name is nice. It makes them easier to reference. During the course of this game some of your proofs will be given names and correspondingly unlocked in your inventory. Thus names are a way to avoid proving the same thing over and over again.

# Propositions
If we separate out the 4 true/false statements required for our line of reasoning and introduce some connectives, we can see the exact same argument in a more concise form. The numbers 1 - 7 here are meant to match exactly with the natural language above.

We're going to give our English connectives some symbols:
- \"and\" — \"∧\"
- \"implies\" — \"→\"
- \"not\" — \"¬\"
- \"or\" — \"∨\"

and we'll give our propositions some symbols:
- C — Cat fur was found at the scene
- D — Dog fur was found at the scene
- M — Macavity is responsible for the crime
- T — Officer Thompson had an allergy attack.

These symbols let us write out the argument from above as follows:
1. C ∨ D (Premise)
2. D → T (Premise)
3. C → M (Premise)
4. ¬T (Premise)
5. ¬D (Modus tollens on 2 and 4)
6. C (Modus tollendo ponens on 1 and 5)
7. M (Modus ponens on 3 and 6)
8. Therefore M (The Conclusion)

Take a moment to see if you can match up the propositions and their meanings with the natural language versions above. If it feels unnatural right now, don't worry too much. This will become more natural as you progress.

# Evidence
The argument above is pretty similar to a full formalization of the chain of reasoning. This game doesn't reference line numbers and doesn't allow free-floating hypothesis. Instead everything is given a name. The justification for introducing a new name will be an expression.

Here's how this example might be expressed in the language of this game. It's a little different, but see if you can match this up with the argument as expressed above:

```lean
-- Objects
C, D, M, T : Prop
-- Assumptions
h₁ : C ∨ D
h₂ : D → T
h₃ : C → M
h₄ : ¬T
```
----
```lean
-- Chain of reasoning
have h₅ : ¬D := modus_tollens h₂ h₄
have h₆ : C := modus_tollendo_ponens h₁ h₅
have h₇ : M := modus_ponens h₃ h₆
-- Goal (Conclusion)
exact h₇
```

You'll notice I have given each assumption and each step in the chain of reasoning names like `h♯` where `♯` matches up with the line numbers from before. That's just to put the example here in easy correspondence with the examples above.

`h₁ : C ∨ D` is read out in english as `h₁` is evidence for the proposition `C ∨ D`. In this case, `h₁` is evidence given as part of the premise, so there's no `:= ...` expression afterwards.

To introduce new evidence — such as `h₅` — you need to write out an expression that the game can evaluate as evidence of the correct proposition. We'll introduce how to write these expressions throughout the tutorial worlds.

`h₅` is evidence of `¬D` (that \"Dog fur was not found at the scene of the crime.\") and we know this by the expression `(modus_tollens h₂ h₄)`.

# To start

In this game, each level will ask you to provide evidence of some proposition. This will often involve using the evidence you already have in some way.

Click on the first world — **Party Invites** — to get started.

----

[¹]Logic example taken from [IEP](https://iep.utm.edu/propositional-logic-sentential-logic/#H5) entry: *Propositional Logic*.
"

Info "
*Game version: 0.1.0*

# Discussion

This game is currently in its initial development phase, designed to be largely self-contained and accessible without requiring a programming or math background to navigate. Feedback about meeting that goal is welcome!

While self-contained; in many ways, this game is targeted more at programmers than mathematicians. It doesn't use classical reasoning, sticking instead to constructive logic. The emphasis for most of the theorem proving is on writing proof terms — rather than using tactics. In fact, logic proof automation is such that if you use the tactic **`tauto`**, you can prove any propositional logic theorem.

Constructive propositional logic is effectively decidable, in the sense that a finite constructive process applies uniformly to every propositional formula, either producing a proof of the formula or demonstrating that no such proof can exist. The fun is in thinking your way through a puzzle with the tools made available to you.

Please feel encouraged to visit the game's GitHub repository and initiate a discussion on any topic regarding this game. Just open a new issue or comment on an existing one.
Github: [A Lean Intro to Logic](https://github.com/Trequetrum/lean4game-logic)

## Progress saving

The game stores your progress in your local browser storage.
If you delete it, your progress will be lost!

Warning: In most browsers, deleting cookies will also clear the local storage
(or \"local site data\"). Make sure to download your game progress first!

## Credits

* **Game Author:** Mark Fischer
* **Game Engine:** Alexander Bentkamp, Jon Eugster, Patrick Massot

## Resources

* The [Lean Zulip chat](https://leanprover.zulipchat.com/) forum
* Github: [A Lean Intro to Logic](https://github.com/Trequetrum/lean4game-logic)
"

/-! Information to be displayed on the servers landing page. -/
Languages "English"
CaptionShort "Lean intro to Logic"
CaptionLong "Self-contained friendly introduction to constructive logic"
-- CoverImage "images/cover.png"

/-! Build the game. Show's warnings if it found a problem with your game. -/
MakeGame
