import Game.Metadata

World "AndIntro"
Level 3
Title "The Have Tactic"

NewDefinition Precedence

Introduction "
# Too Many Invites
You have invites for Jason, Justin, Jaime, and Jordan who all live together. Unfortunately, boxes only have space for two items, but you've thought up a clever solution!
1. You'll put Jason's and Jaime's invites in a box,
2. You'll put Jordan's and Justin's invites in another box.
3. You'll put both boxes in a final box.
### Nested Boxes!
Nesting boxes like this is a way to get around the \"two items per box\" rule. Ensure that everything is correctly labeled to guarantee each invite reaches the correct recipient.
# Proposition Key:
- A — J**a**son is invited to the party
- I — Ja**i**me is invited to the party
- O — J**o**rdan is invited to the party
- U — J**u**stin is invited to the party


# The `have` Tactic
You can complete this level with your knowledge from the previous level without using this new tactic. For example, any of these would work:
```
exact and_intro (and_intro a i) (and_intro o u)
exact {left := {left := a, right := i}, right := {left := o, right := u}}
exact ⟨⟨a,i⟩,⟨o,u⟩⟩
```
Instead of nesting this way, you can break the process down into steps using the `have` tactic. Enter \"`have h₁ := and_intro a i`\" to create your first box. After it's entered, it will appear under assumptions in the proof state. Now enter \"`have h₂ := and_intro o u`\" to create the second box.\\
\\
Finally, now you can place these two boxes into a third box and submit your answer using the `exact` tactic.
"

NewTactic «have»

/-- Three × and_intro. -/
Statement (A I O U : Prop)(a : A)(i : I)(o : O)(u : U) : (A ∧ I) ∧ O ∧ U := by
  have h₁ := and_intro a i
  have h₂ := and_intro o u
  exact and_intro h₁ h₂


Conclusion "
Great! Another 4 invites sent out. You're getting the hang of this.

----
````
-- 1. Jason and Jaime: A ∧ I
have h₁ := and_intro a i

-- 2. Jordan and Justin: O ∧ U
have h₂ := and_intro o u

-- 3. both boxes in a final box
exact and_intro h₁ h₂
````
"
