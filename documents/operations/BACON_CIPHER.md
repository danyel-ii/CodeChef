# Bacon Cipher

## What it does

Bacon Cipher encodes letters as five-character groups made from `A` and `B`.

It is a binary-style classical encoding system, not a modern encryption scheme.

## Alphabet variants in the app

The app supports two variants:

- `modern26`: a 26-letter alphabet `A-Z`
- `classical24`: a historical 24-letter alphabet where:
  - `I` and `J` share a slot
  - `U` and `V` share a slot

## Encoding algorithm in the app

1. Convert input to uppercase.
2. Ignore any character outside `A-Z`.
3. For `classical24`, map:
   - `J` to `I`
   - `V` to `U`
4. Find the letter index in the selected alphabet.
5. Convert that index to a 5-bit binary number.
6. Replace `0` with `A` and `1` with `B`.
7. Optionally separate groups with spaces.

## Decoding algorithm in the app

1. Remove every character that is not `A` or `B`.
2. Ensure the remaining length is a multiple of 5.
3. Read 5-character groups.
4. Convert `A` to `0` and `B` to `1`.
5. Interpret the result as a binary number.
6. Look up the letter in the selected alphabet.

## Failure modes

- If the cleaned input length is not divisible by 5, the app errors.
- If a decoded group points outside the selected alphabet variant, the app errors.
