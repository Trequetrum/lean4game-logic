import Game.Metadata

open GameLogic

World "AndIntro"
Level 7
Title "More Elimination"

OnlyTactic
  exact
  «have»
TheoremTab "∧"

Introduction "
# An Emergency!
Stop with the invites! Coco, your cat is stuck up a tree.\\
\\
The firefighters are here but they need your help figuring if they can get to the branch with Coco. They can see the entire tree and they know how to follow the branches by going left or right at each intersection. If they can do that, then they must be able to get to Coco.
# Proposition Key:
- C — The firefighters can get to Coco
- L — The firefighters can get to some leaves
# Goal
Show evidence that the firefighters can get to Coco

# `∧` associates to the right
Check out the definition page for \"Precedence\" to learn a bit more.
# Hint # 1
If you hover your mouse over an operator in the proof state it will highlight the part of the expression that it operates **on**. Find the one that highlights the entire expression to see where the trunk of the tree is.\\
\\
Another approach is trial and error. Enter `have h₁ := h.right` to see `h₁: (L ∧ L) ∧ L` appear in your assumptions, which doesn't have `C` anywhere, indicating that this isn't the correct part of the tree. You can hit retry, then change that line to have `h₁ := h.left`. Then your assumptions will have `h₁: L ∧ ((L ∧ C) ∧ L) ∧ L ∧ L ∧ L`, which has the `C` somewhere.
# Hint # 2
The |**Show more help!**| button below will display the expression for you. Beware, the boss level will not come with this option.
"

/-- Navigate the tree -/
Statement (C L : Prop)(h: (L ∧ (((L ∧ C) ∧ L) ∧ L ∧ L ∧ L)) ∧ (L ∧ L) ∧ L) : C := by
  Hint (hidden := true) "h.left.right.left.left.right"
  exact h.left.right.left.left.right

Conclusion "
Amazing! You've helped save your cat!

----
Here are three solutions, are you able to follow each of them?
```
have h₁ := and_left h
have h₂ := and_right h₁
have h₃ := and_left h₂
have h₄ := and_left h₃
have h₅ := and_right h₄
exact h₅
```
or
```
exact and_right (and_left (and_left (and_right (and_left h))))
```
or
```
exact h.left.right.left.left.right
```
"
