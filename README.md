# Lean 4 Logic Game

This is a game about propositional logic as expressed in the Lean Theorem Prover. It uses the [Lean4 Game Engine](https://github.com/leanprover-community/lean4game) and is running live at [adam.math.hhu.de](https://adam.math.hhu.de/#/g/Trequetrum/lean4game-logic)

# A Lean Intro to Logic

Highschool math and zero programming background? Mostly not a problem, the idea of this game is to be extremely approachable. That said, this is a work in progress, so there's some rough edges that need rounding off. Feel free to open an issue to leave feedback of any sort.

Here looking for answers to any of the levels? You can look under `Game/Levels/`. Each statement has a proof that uses only the tools the game has taught so far.

# Discussion

This game is currently in its initial development phase, designed to be largely self-contained and accessible without requiring a programming or math background to navigate. Feedback about meeting that goal is welcome!

While self-contained; in many ways, this game is targeted more at programmers than mathematicians. It doesn't use classical reasoning, sticking instead to constructive logic. The emphasis for most of the theorem proving is on writting proof terms — rather than using tactics. In fact, logic proof automation is such that the tactic **`tauto`** can solve any propositional logic theorem (Though possible, that's an NP-Complete problem).

The main thrust of this game is to create puzzles that are fun to think through on your own.
