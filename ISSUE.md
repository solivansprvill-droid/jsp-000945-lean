# [Recipient] JSP-000945 Lean formalization of an n-2x² prime witness

### Related problem or entry

JSP-000945

### Recipient placeholder or confirmed public ID

RECIPIENT-JSP-000945-A

### Contributions and evidence

Role claimed: formalizer only.

Problem (JSP-000945): Is there an integer whose differences from twice every permitted smaller square are all prime?

The problem bank records this as Solved with Lean proof: No. The corresponding Erdős problem #1140 asks whether infinitely many such n exist and is DISPROVED. The JSP record as written is the weaker existence question, so a single explicit n is a complete answer to the recorded statement.

Witness n = 13 (on the official list 2, 5, 7, 13, 31, 61, 181, 199):
- 13 − 2·0² = 13 prime
- 13 − 2·1² = 11 prime
- 13 − 2·2² = 5 prime
and 2·3² = 18 ≥ 13, so the range stops.

Lean source (core only, no Mathlib): to be filled after the public repo is created.
Pinned commit: to be filled.

We do not claim infinitude, uniqueness, or the classification theorems of Epure–Gica / Mollin–Williams. Mathematical ownership of the known list remains with the literature cited on the problem page.

Verification status:
- Arithmetic: every official listed n checks out by trial division.
- Predicate semantics: isPrimeB agrees with an independent ground truth for every k in 1..20000; allDiffsPrimeB agrees for every n in 1..500; the true-positives below 200 are exactly {2,5,7,13,31,61,181,199}.
- Lean kernel check: NOT yet performed. Please run `lake build` before treating this as a verified record. If native_decide is unavailable, replace it with decide.

### Confirmation status

pending

### Attribution questions and conflicts

No claim on the infinitude disproof of Erdős #1140. No claim on Epure–Gica or Mollin–Williams classification. Formalizer role only. Placeholder identity RECIPIENT-JSP-000945-A until written confirmation.
