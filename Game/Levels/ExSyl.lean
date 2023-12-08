-- import Game.Metadata
-- import GameServer.Commands

-- import Game.Doc.Lemmas
-- import Game.Doc.Definitions
-- import Game.Doc.Tactics


theorem imp_imp_imp {a b c d : Prop} (h₀ : c → a) (h₁ : b → d) : (a → b) → (c → d) := (h₁ ∘ · ∘ h₀)

theorem imp.swap : (a → b → c) ↔ (b → a → c) := ⟨flip, flip⟩

theorem imp_not_comm : (a → ¬b) ↔ (b → ¬a) := imp.swap

theorem And.imp (f : a → c) (g : b → d) (h : a ∧ b) : c ∧ d := ⟨f h.1, g h.2⟩

theorem and_congr_right (h : a → (b ↔ c)) : a ∧ b ↔ a ∧ c :=
⟨fun ⟨ha, hb⟩ => ⟨ha, (h ha).1 hb⟩, fun ⟨ha, hb⟩ => ⟨ha, (h ha).2 hb⟩⟩


theorem and_left_comm : a ∧ (b ∧ c) ↔ b ∧ (a ∧ c) := by
  -- rw [← and_assoc, ← and_assoc, @and_comm a b]
  sorry

theorem and_right_comm : (a ∧ b) ∧ c ↔ (a ∧ c) ∧ b := by
  simp only [and_left_comm, and_comm]

theorem and_rotate : a ∧ b ∧ c ↔ b ∧ c ∧ a := by
  simp only [and_left_comm, and_comm]

theorem and_not_self : ¬(a ∧ ¬a) | ⟨ha, hn⟩ => hn ha


theorem not_not_em (a : Prop) : ¬¬(a ∨ ¬a) := fun h => h (.inr (h ∘ .inl))

theorem Or.symm : a ∨ b → b ∨ a := .rec .inr .inl

theorem Or.imp (f : a → c) (g : b → d) (h : a ∨ b) : c ∨ d := h.elim (inl ∘ f) (inr ∘ g)

theorem Or.imp_left (f : a → b) : a ∨ c → b ∨ c := .imp f id

theorem Or.imp_right (f : b → c) : a ∨ b → a ∨ c := .imp id f

theorem or_congr (h₁ : a ↔ c) (h₂ : b ↔ d) : (a ∨ b) ↔ (c ∨ d) := ⟨.imp h₁.1 h₂.1, .imp h₁.2 h₂.2⟩

theorem or_congr_left (h : a ↔ b) : a ∨ c ↔ b ∨ c := or_congr h .rfl

theorem or_congr_right (h : b ↔ c) : a ∨ b ↔ a ∨ c := or_congr .rfl h

theorem Or.comm : a ∨ b ↔ b ∨ a := ⟨Or.symm, Or.symm⟩

theorem or_comm : a ∨ b ↔ b ∨ a := Or.comm

theorem or_assoc : (a ∨ b) ∨ c ↔ a ∨ (b ∨ c) :=
  ⟨.rec (.imp_right .inl) (.inr ∘ .inr), .rec (.inl ∘ .inl) (.imp_left .inr)⟩

-- OR

theorem Or.resolve_left {a b : Prop} (h: a ∨ b) (na : ¬a) : b := h.elim (absurd · na) id

theorem Or.neg_resolve_left (h : ¬a ∨ b) (ha : a) : b := h.elim (absurd ha) id

theorem Or.resolve_right {a b : Prop} (h: a ∨ b) (nb : ¬b) : a := h.elim id (absurd · nb)

theorem Or.neg_resolve_right (h : a ∨ ¬b) (nb : b) : a := h.elim id (absurd nb)

theorem or_left_comm : a ∨ (b ∨ c) ↔ b ∨ (a ∨ c) := by rw [← or_assoc, ← or_assoc, @or_comm a b]

theorem or_right_comm : (a ∨ b) ∨ c ↔ (a ∨ c) ∨ b := by rw [or_assoc, or_assoc, @or_comm b]

theorem or_iff_right_of_imp (ha : a → b) : (a ∨ b) ↔ b := ⟨Or.rec ha id, .inr⟩

theorem not_or_intro {a b : Prop} (ha : ¬a) (hb : ¬b) : ¬(a ∨ b) := (·.elim ha hb)

theorem or_iff_left_iff_imp : (a ∨ b ↔ a) ↔ (b → a) :=
  ⟨fun h hb => h.1 (Or.inr hb), or_iff_left_of_imp⟩

-- distributivity

theorem and_imp : (a ∧ b → c) ↔ (a → b → c) :=
  ⟨fun h ha hb => h ⟨ha, hb⟩, fun h ⟨ha, hb⟩ => h ha hb⟩

@[simp] theorem not_and : ¬(a ∧ b) ↔ (a → ¬b) := and_imp
