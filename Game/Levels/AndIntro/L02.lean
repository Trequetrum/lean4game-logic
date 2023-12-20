import Game.Metadata

open GameLogic

World "AndIntro"
Level 2
Title "And Introduction"

NewLemma GameLogic.and_intro

Introduction "
# Sending Invitations in a Single Package
You have two letters, one extending an invitation to Pippin and the other to Sybeth. Since they share a residence, you'd like to consolidate their invites into a single package for shipping. The box you're using has space for two items, one on the left and one on the right.\\
\\
You've labelled the box explicitly, specifying that Pippin's invitation is on the left and Sybeth's invitation is on the right. This ensures there's no confusion about the contents of the box. Upon opening it, they will easily locate their respective invites without the need to search the entire package.
# Proposition Key:
- P — “**P**ippin is invited to the party”
- S — “**S**ybeth is invited to the party”
# `∧`
The hat symbol “ ∧ ” is how logicians denote a conjunction — a logical “and”. `A ∧ B` means “A and B”. It works the way you would intuitively expect. Like a lot of math operators (`+,-,÷,×`,and others), the `∧` symbol is an infix operator. This means it has a left side and a right side. Looking at `A ∧ B`, you can see that `A` is on the left and `B` is on the right.\\
\\
In this game, that means anything operating as evidence for `A ∧ B` will have a left part and a right part as well. The box described in the intro works this way.
# Assumptions
- `p : P` — Your invitation for Pippin is evidence that Pippin is invited to the party
- `s : S` — Your invitation for Sybeth is evidence that Sybeth is invited to the party
# Goal
Use `p` and `s` to produce evidence that `P ∧ S`. Remember that you use evidence (generally lowercase letters), to deduce new propositions (generally uppercase letters)

# A new definition
This level has unlocked “∧ intro” under definitions. This has made the `and_intro` constructor available. You can use `and_intro` by giving it the two relevant pieces of evidence. The expression looks like: `and_intro e₁ e₂` where `e₁` and `e₂` are evidence.\\
\\
The help-page has even more detail about creating conjunctions like this.
# A reminder
Use the `exact` tactic to exhibit evidence for a goal
"

/-- Fill a box, label correctly -/
Statement (P S : Prop)(p: P)(s : S) : P ∧ S := by
  Hint (hidden := true) "exact and_intro p s"
  exact and_intro (left := p) (right := s)


Conclusion "
You've got evidence that Pippin and Sybeth are invited to the party.\\
\\
Here are some answers the game would have accepted:
```
exact and_intro p s
exact {left := p, right := s}
exact ⟨p,s⟩
```
"
