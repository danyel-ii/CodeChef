# Hex Decode

## Slide deck

 - [Inside Hex Decode](/Users/danyel-ii/CodeChef/apps/mobile/assets/pdfs/operations/inside_hex_decode.pdf)

## What it is

Hex Decode converts hexadecimal text back into the original bytes.

## How it works

1. Read the input two hex digits at a time.
2. Convert the first digit into the high 4 bits of a byte.
3. Convert the second digit into the low 4 bits of a byte.
4. Combine them into one byte.
5. Repeat for the whole input.

## Example

Input:

```text
48656c6c6f
```

Decoded bytes:

```text
48 65 6c 6c 6f
```

Text output:

```text
Hello
```

## Why decoding can fail

Hex Decode should reject:

- any non-hex character
- an odd number of digits

One byte always needs exactly two hex characters.
