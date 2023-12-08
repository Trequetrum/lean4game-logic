import Game.Metadata

World "ImpIntro"
Level 3
Title "Cake Form Swap"

NewLemma identity

Introduction "
# Trouble with the cake
The baker from the bakery called, expressing confusion about your cake order. While he can bake a cake with icing and sprinkles, you've requested sprinkles and icing. You attempt to convey that every cake with sprinkles and icing is **also** at the same time a cake with icing and sprinkles. The baker doesn't believe you.\\
\\
If you assume an arbitrary cake that has icing and that has sprinkles, show that you also have a cake that has sprinkles and has icing!
# Proposition Key:
- `I` — The cake has **I**cing
- `S` — The cake has **S**prinkles
"

/-- Show that ∧ is commutative --/
Statement (I S: Prop) : I ∧ S → S ∧ I := by
  Hint (hidden := true) "`λ h : I ∧ S ↦ and_intro (and_right h) h.left`"
  exact λ(h : I ∧ S) ↦ and_intro (and_right h) h.left

Conclusion "
The bakery guy, upon reviewing your evidence, exclaims, \"Amazing! I never knew this. With this added knowledge, I'll be able to bake your cake!\"

----
In this level, as your goal is `I ∧ S → S ∧ I`, the game automatically recognizes the evidence you're assuming. You don't need to explicitly write it out. Therefore, you can use the following alternatives:
```
fun h => and_intro (and_right h) (and_left h)
fun h => and_intro h.right h.left
-- or with unicode
λh ↦ ⟨h.right, h.left⟩
```

"
