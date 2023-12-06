import Game.Levels.NotIntro.L01
import Game.Levels.NotIntro.L02
import Game.Levels.NotIntro.L03
import Game.Levels.NotIntro.L04
import Game.Levels.NotIntro.L05
import Game.Levels.NotIntro.L06
import Game.Levels.NotIntro.L07
import Game.Levels.NotIntro.L08
import Game.Levels.NotIntro.L09
import Game.Levels.NotIntro.L10
import Game.Levels.NotIntro.L11

World "NotIntro"
Title "¬ Tutorial: Falsification"

Introduction "
# In this world
In this world, you'll be introduced to negation — which is written with the \"`¬`\" symbol.

This operator is really just syntactic sugar. `¬P` means `P → False`. It seamlessly integrates into all the scenarios where implications are used. It's also constructed using functions (`λ...↦...`) just like any other implication.

The new interesting element for this world is `False`. What is `False`? It's a proposition — part of the set of statements that can be either true or false. Importantly, however it's defined as a proposition which always happens to be false. By sheer force of definition — there can never exist any evidence supporting the veracity of `False`.

An interesting corollary arises: from the premise of False, any proposition becomes permissible.

Let's take a quick detour. Imagine you're signing a contract of utmost importance. The terms stipulate: \"Once per day, you will be given a whole number greater than 0. If the number falls below 100, you must gracefully wave your left hand; if it exceeds 90, your right hand should elegantly sway. Lastly, if the number plunges below 0, you must transform into a cucumber.\"

On casual scrutiny, one might naively conclude that adhering to this contract may involve turning into a cucumber. While that may seem impossible, a subtle loophole exists. By astutely arguing that the contract will never demand the impossible act of becoming a pickle, you effectively assure your compliance.

By signing the contract, you're effectively saying, \"If you can show evidence for a number that is both greater than 0 and less 0, then I will transform into a cucumber.\" Your grandiose claims remain secure as they hinge on an eventuality that defies logical possibility.
"
