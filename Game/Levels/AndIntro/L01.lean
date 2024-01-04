import Game.Metadata

open GameLogic

World "AndIntro"
Level 1
Title "Exactly! It's in the premise"

NewTactic exact
NewDefinition GameLogic.AsciiTable

Introduction "
# Introduction
You've made a todo list, so you've begun to plan your party. Exhibit evidence that you're planning the party.
## Proposition Key:
`P` — You're **P**lanning a party
## Assumptions
`todo_list : P` — Can be read as `todo_list` “is evidence for” `P`
# The Exact Tactic
The Exact tactic is — for now — the means through which you give the game your answer. It's your way of declaring that you're done. In this level, you're just going to be using one of the premises directly, but as you learn how to form expressions the `exact` tactic will accept those too.\\
\\
It's entered like this:
```
Goal: P
exact <<expression that evaluates to evidence for P>>
```
You can use the `exact` tactic to give `todo_list` as your answer.\\
\\
⋆Spoilers!⋆ If you enter “`exact todo_list`,” you will have completed this level.

# Become Familiar with the User Interface!

# Proof State
Found in the middle bottom of the screen, the proof state tells you what objects exist, what assumptions are available, and what goal proposition you're trying to exhibit evidence for. Find the area of the screen with **Objects**, **Assumptions**, and **Goal**. I'll describe each shortly here.
## 1. Objects:
In this level, you'll notice that there is only one proposition. `P : Prop` is the game's way of telling you that it knows that `P` is a proposition. You can check out the **Proposition Key** above to learn what it's denoting in this level if you're interested.
## 2. Assumptions:
Most levels will give you some starting assumptions that take the form of evidence for some propositions. The shorthand for a proposition traditionally starts with a capital letter and the shorthand for evidence traditionally starts with a lowercase letter.
## 3. Goal:
The goal is always a proposition that you want to exhibit some evidence for. In this level, one of your assumptions already contains evidence for the goal. That will certainly not always be the case.
# Inventory
On the right of the screen is your inventory of tactics, definitions, and theorems. Once unlocked, you can click them to read about what they do.
"

/-- Exhibit evidence that you're planning a party. -/
Statement (P : Prop)(todo_list : P) : P := by
  exact todo_list

Conclusion "
Congratulations, not only have you started your todo list, you've learned how to exhibit the list as evidence that you've started planning the party.
"
