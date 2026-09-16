# JSP-000945 — Lean formalization of an n-2x² prime witness

**Problem (Justin Sun Prize problem bank, JSP-000945):**
> Is there an integer whose differences from twice every permitted smaller square are all prime?

The problem bank records this as **Solved** with **Lean proof: No**. The corresponding Erdős problem #1140 asks whether infinitely many such `n` exist; that infinitude statement is **DISPROVED**. The JSP record as written is the weaker existence question, so a single explicit `n` is a complete answer to the recorded statement.

## The witness

Official list: `2, 5, 7, 13, 31, 61, 181, 199`. We use `n = 13`:

```
13 - 2·0² = 13  prime
13 - 2·1² = 11  prime
13 - 2·2² =  5  prime
```

and `2·3² = 18 ≥ 13`, so the range stops. We do **not** claim infinitude, uniqueness, or the classification theorems of Epure–Gica / Mollin–Williams.

## Contents

| File | Purpose |
| --- | --- |
| `JSP000945.lean` | The formalization. Lean core only, no Mathlib. |
| `lakefile.toml` | Library target. |
| `lean-toolchain` | Pins `leanprover/lean4:v4.34.0`. |

`allDiffsPrimeB n` checks `isPrimeB (n - 2x²)` for every `x` with `2x² < n` (including `x = 0`). `existence` then exhibits `n = 13`.

## Verification status

- Arithmetic: every official listed `n` checks out by trial division; `n = 13` is on that list.
- Predicate semantics: `isPrimeB` agrees with a from-scratch ground truth for every `k` in 1..20000; `allDiffsPrimeB` agrees with an independent checker for every `n` in 1..500; zero mismatches.
- **Lean kernel check: not yet performed.** If `native_decide` is unavailable, replace it with `decide`.

Run with `lake build`.
