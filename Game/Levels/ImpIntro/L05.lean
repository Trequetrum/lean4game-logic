import Game.Metadata

World "ImpIntro"
Level 5
Title "Robbie Snacks"

NewLemma imp_trans

Introduction "
# Is Robbie bringing something?
Robbie is an artsy, but rather eccentric friend of yours.\\
\\
Ever since you asked Robbie to bring something to your party, he's been sending you rather cryptic emails. Initially, these emails seemed to have nothing to do with the party. However, after receiving the 5th email, you believe you might be able to use them to create evidence that Robbie is bringing something to the party.\\
\\
These are the emails you received:
1. If you're planning a party then the quest has begun
2. If the quest has begin then the road to victory is long and winding
3. If the quest has begun then it's time to get serious
4. If the starting gun has fired then it's time to get serious
5. If it's time to get serious then I'll bring a unicorn snack to the party

You still have your todo list as evidence that you're planning a party. Will it be enough?
# Proposition Key:
- `P` — You're **P**lanning a party
- `Q` — The **Q**uest has begun
- `R` — The **R**oad to victory is long and winding
- `S` — The **S**tarting gun has fired
- `T` — It's **T**ime to get serious
- `U` — Robbie is bringing a **U**nicorn snack
# Evidence
Sometimes visuals can make a logical arguement much easier to digest. Here is a diagram you've drawn depicting Robbie's notes so far.
$$
\\begin{CD}
  P  @>{h₁}>> Q       @>{h₂}>> R \\\\
  @.         @VV{h₃}V           \\\\
  S  @>>{h₄}> T       @>>{h₅}> U
\\end{CD}
$$
# Reminder
The Precedence definition page explains that function application is left-associative. So these 2 are the same:
- `h₁ h₂ h₃ h₄ h₅`
- `((((h₁ h₂) h₃) h₄) h₅)`
"

/-- Robbie is bringing a unicorn snack -/
Statement (P Q R S T U: Prop) (p : P) (h₁ : P → Q) (h₂ : Q → R) (h₃ : Q → T) (h₄ : S → T) (h₅ : T → U) : U := by
  have hpt := imp_trans h₁ h₃
  have hpu := imp_trans hpt h₅
  exact hpu p

Conclusion "
Amazing! He is bringing a snack and you have evidence to prove it too!

----
Here are two solutions to Robbie's puzzle. Sometimes it's helpful to see the same puzzles solved in more than one way.
```
have q := h₁ p
have t := h₃ q
have u := h₅ t
exact u
```
or nest them together:
```
exact h₅ (h₃ (h₁ p))
```
or use the `imp_trans` theorem from the previous world:
```
have hpt := imp_trans h₁ h₃
have hpu := imp_trans hpt h₅
exact hpu p
```
"
