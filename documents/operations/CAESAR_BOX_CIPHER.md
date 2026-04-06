# Caesar Box Cipher

## Slide deck

- [Caesar Box Mechanics](../../apps/mobile/assets/pdfs/operations/caesar_box_mechanics.pdf)

## What it does

Caesar Box Cipher is a transposition cipher, not a substitution cipher.

Instead of shifting letters, it rearranges their positions by writing text row by row into a fixed-width box and reading it out column by column.

## Encoding algorithm in the app

Given a chosen column count:

1. Compute the number of rows needed:

```text
rows = ceil(length / columns)
```

2. Imagine writing the plaintext left to right, row by row.
3. Read the box top to bottom, column by column.
4. Skip cells that would fall past the end of the message.

## Decoding algorithm in the app

To decode, the app reverses that layout:

1. Compute the number of rows.
2. Determine how many columns are short because the final row is incomplete.
3. Slice the ciphertext into per-column strings of the correct lengths.
4. Read row by row across those reconstructed columns.

That step matters because the last few columns may contain one fewer character than the others.

## Important detail

If the input is empty or the column count is greater than or equal to the input length, the app returns the input unchanged.
