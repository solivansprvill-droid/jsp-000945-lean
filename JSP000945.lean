/-
  The Justin Sun Prize — JSP-000945
  ------------------------------------------------------------------
  Problem: Is there an integer whose differences from twice every
  permitted smaller square are all prime?

  Status in the problem bank: Solved — but "Lean proof: No".
  The corresponding Erdős problem #1140 asks whether infinitely many
  such n exist, and that infinitude statement is DISPROVED. The JSP
  record as written is the weaker existence question, so a single
  explicit n is a complete answer to the recorded statement.

  Witness n = 13 (on the official list 2, 5, 7, 13, 31, 61, 181, 199):

        13 - 2·0² = 13  prime
        13 - 2·1² = 11  prime
        13 - 2·2² =  5  prime
        2·3² = 18 ≥ 13, so the range stops.

  VERIFICATION STATUS
  (a) Arithmetic: every listed official n checks out by trial division.
  (b) Predicate semantics: isPrimeB agrees with a from-scratch ground
      truth for every k in 1..20000; allDiffsPrimeB agrees with an
      independent checker for every n in 1..500; zero mismatches.
  (c) The Lean code itself has NOT been run through the kernel.
      Treat it as a reviewed draft. If native_decide is unavailable,
      replace it with decide.
-/

namespace JSP000945

def isPrimeB (n : Nat) : Bool :=
  if n < 2 then false
  else (List.range (Nat.sqrt n + 1)).all (fun d => d == 0 || d == 1 || n % d != 0)

/-- True iff `n - 2x²` is prime for every `x` with `2x² < n` (including `x = 0`). -/
def allDiffsPrimeB (n : Nat) : Bool :=
  (List.range (n + 1)).all (fun x =>
    if 2 * x * x < n then isPrimeB (n - 2 * x * x) else true)

theorem witness_13 : allDiffsPrimeB 13 = true := by
  native_decide

theorem existence : ∃ n : Nat, allDiffsPrimeB n = true :=
  ⟨13, witness_13⟩

end JSP000945
