import Game.Metadata

open GameLogic

World "NotIntro"
Level 3
Title "Double False!"

Introduction "
# The Ambiguous Celebration Response
Your somewhat bothersome cousin just called and is asking if you're throwing your annual soirée this year. You don't want to outright lie, so you say \"I'm not not throwing the party.\"
# Proposition Key:
- `P` — You're throwing a party'
"

/-- not not introduction. -/
Statement (P : Prop)(p : P) : ¬¬P := by
  exact λ(np : ¬P) ↦ np p

Conclusion "
You've made use of the concept that \"false implies anything\".
"
