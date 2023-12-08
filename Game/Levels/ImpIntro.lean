import Game.Levels.ImpIntro.L01
import Game.Levels.ImpIntro.L02
import Game.Levels.ImpIntro.L03
import Game.Levels.ImpIntro.L04
import Game.Levels.ImpIntro.L05
import Game.Levels.ImpIntro.L06
import Game.Levels.ImpIntro.L07
import Game.Levels.ImpIntro.L08
import Game.Levels.ImpIntro.L09

World "ImpIntro"
Title "→ Tutorial: Party Snacks"

Introduction
"
# Snacks!
What's a birthday party without chips and cake?
# About Conditionals
This world teaches you about conditional statements. In every day sentences, you'll see such statements expressed as \"if [...], then [...]\" logic — \"If the sky is clear at night, then we will be able to see the stars.\".\\
\\
This game uses the implication arrow \" → \". \"If A, then B\" is the same as \"A implies B\" or \"`A → B`\".\\
\\
So far, we've been giving our evidence and propositions real-world analogues. What would constitute evidence for a conditional statement? For example; \"If we have gnocchi, butter, parmesan, and black pepper, then we can cook *gnocchi cacio e pepe*\". What would be evidence of such a statement? An example of evidence of that could be a recipe with cooking instructions. You can think of the recipe as an argument explaining that the given ingredients are sufficient to be able to cook the dish.\\
\\
Another example might be a safe's combination, as evidence that \"I can find the hidden safe\" → \"I can steal the contents of the safe\". Perhaps a certification is evidence that \"I won the contract\" → \"I will renovate the client's yard\".\\
\\
The concept behind an implication, such as `A → B`, is that there exists an explicit path starting from the truth of `A`, from which you can demonstrate the truth of `B`. \\
\\
Where this game abstracted the idea of `A ∧ B` into a tuple holding evidence for `A` and evidence for `B`. The way we store evidence like `A → B` is with a function that takes evidence for `A` and produces evidence for `B`.\\
\\
`h : A → B` reads `h` is evidence for `A → B`. While real-world analogues can be anything, the abstract machinery used in this game will always be a function.


# An Aside for Programmers
If you've done some programming, this might be interesting context. It won't be important for completing any levels.\\
\\
In the broader context of the Lean programming language, any function that returns evidence for a proposition, is itself also evidence for a proposition. We won't be building any other sort of function in this game.\\
\\
The function space constructor \"`→`\" is not overloaded. We won't get into the weeds; suffice it to say that the rules for implication in a proof system for natural deduction correspond exactly to the rules governing abstraction and application for functions.
"
