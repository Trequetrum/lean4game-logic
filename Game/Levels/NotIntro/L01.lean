
import Game.Metadata

World "NotIntro"
Level 1
Title "False implies anything"

NewDefinition false_elim

Introduction "
# Sarah's Punctuality
Sarah is never on time. Despite her assurances that she'll grace the party with her timely presence, past experiences have proven otherwise. It's almost become a running joke, so much so that you playfully quip, \"Yeah, if you arrive on time, then I'll eat my boots.\"
# Proposition Key:
- `B` — You eat your boots
- `S` — Sarah is on time
# `false_elim`
You've unlocked the \"false implies anything\" function. `false_elim` will take evidence for `False` and produce evidence for **anything**.
# A Tip
Remember you can think of `h` as evidence for `S → False`
"

/-- ¬S is enough to show S → B -/
Statement (B S : Prop)(h : ¬S) : S → B := by
  Hint (hidden := true) "λs ↦ false_elim (h s)"
  exact λs ↦ false_elim (h s)

Conclusion "
You've made use of the concept that \"false implies anything\".
"
