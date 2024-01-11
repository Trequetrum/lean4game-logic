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
This world teaches you about conditional statements. In every day sentences, you'll see such statements expressed as “if [...], then [...]” logic — “If the sky is clear at night, then we will be able to see the stars.”.\\
\\
This game uses the implication arrow “ → ”. “If A, then B” is the same as “A implies B” or “`A → B`”.\\
\\
So far, we've been giving our evidence and propositions real-world analogues. Doing this is a bit less desirable with conditionals as real-world evidence is often based on our understanding and not some tangible object. For example; the evidence that “If it rained, then the driveway is wet” generally doesn't come in the form of peer-reviewed physics papers. You should be thinking of the flavour text for each level as an unrefined embellishment of the symbols you're actually concerned with.\\
\\
That said, at the level the favour text works on, what would constitute evidence for a conditional statement? Well, for example; “If we have gnocchi, butter, parmesan, and black pepper, then we can cook *gnocchi cacio e pepe*”. An example of evidence for such a conditional could be a recipe with cooking instructions. You can think of the recipe as an argument explaining that the given ingredients are sufficient to be able to cook the dish.\\
\\
Another example might be a safe's combination, as evidence that “I can find the hidden safe” → “I can steal the contents of the safe”. Perhaps a certification is evidence that “I won the contract” → “I will renovate the client's yard”.\\
\\
The concept behind an implication, such as `A → B`, is that there exists an explicit path starting from the truth of `A`, from which you can demonstrate the truth of `B`. \\
\\
Where this game abstracted the idea of `A ∧ B` into a tuple holding evidence for `A` and evidence for `B`. The way we store evidence like `A → B` is with a function that takes evidence for `A` and produces evidence for `B`.\\
\\
`h : A → B` reads `h` is evidence for `A → B`. While real-world analogues can be anything, the formalization used in this game will always be a function.
"
