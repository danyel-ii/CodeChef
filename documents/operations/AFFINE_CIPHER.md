# Affine Cipher

## What it does

Affine Cipher is a substitution cipher that combines multiplication and addition modulo 26.

For plaintext letter value `x`:

```text
E(x) = (a*x + b) mod 26
```

To decode:

```text
D(x) = a_inverse * (x - b) mod 26
```

## Parameter meaning

- `a` is the multiplicative factor
- `b` is the additive shift

The key rule is that `a` must be coprime with 26, otherwise it has no modular inverse and decoding is impossible.

## Core algorithm in the app

1. Read `a`, `b`, and mode.
2. Compute the modular inverse of `a` by brute force over `1..25`.
3. For each letter:
   - convert it to `0..25`
   - apply the encoding or decoding formula
   - convert back to uppercase or lowercase
4. Leave non-letters unchanged.

## Failure mode

If `a` has no modular inverse modulo 26, the app throws:

```text
invalidParams:Affine multiplier must be coprime with 26.
```
