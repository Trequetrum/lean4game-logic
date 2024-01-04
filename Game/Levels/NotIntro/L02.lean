import Game.Metadata

open GameLogic

World "NotIntro"
Level 2
Title "False implies anything"

NewTheorem GameLogic.false_elim

Introduction "
# Sybeth's Punctuality
Sybeth is never on time. Despite her assurances that she'll grace the party with her timely presence, past experiences have proven otherwise. It's almost become a running joke, so much so that you playfully quip, \"Yeah, if you arrive on time, then I'll eat my boots.\"
# Proposition Key:
- `B` — You eat your boots
- `S` — Sybeth is on time
# `false_elim`
You've unlocked the \"false implies anything\" function. `false_elim` will take evidence for `False` and produce evidence for **anything**.
# A Tip
Remember you can think of `h : ¬S` as `h : S → False`.\\
\\
Once you've started with `λ(s : S) ↦ `, you'll then see that the expression `h s` evaluates to evidence for `False`. If ever you have evidence for `False`, you should aways immediatly consider using `false_elim` to create evidence for anything — which in this case will be `B`.\\
\\
There is no proof that \"keeps going\" once you've created evidence for `False`. Some proofs have multiple parts, so you may close off one line of reasing and move on to another, but there can be no meaningfull logic in any context where evidence for `False` is present.
"

/-- ¬S is enough to show S → B -/
Statement (B S : Prop)(h : ¬S) : S → B := by
  Hint (hidden := true) "λs ↦ false_elim (h s)"
  exact imp_trans h false_elim

Conclusion "
You've made use of the concept that \"false implies anything\".

----
```
h           : S     → False
false_elim  : False → B
```
Because the righthand side of `h` and the lefthand side of `false_elim` match, you can use `imp_trans` to combine these:
```
imp_trans h false_elim
```
"
