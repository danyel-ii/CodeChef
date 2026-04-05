# Base64 Decode

## What it is

Base64 Decode reverses Base64 encoding and reconstructs the original bytes.

If those bytes represent text, they can then be interpreted using a character encoding such as UTF-8.

## How it works

1. Read the Base64 input in groups of 4 characters.
2. Convert each character back into its 6-bit numeric value.
3. Recombine 4 Base64 characters into a 24-bit block.
4. Split that 24-bit block back into the original 3 bytes.
5. Remove bytes that were only implied by `=` padding.
6. Interpret the resulting bytes as text or keep them as raw bytes.

## Example

Input:

```text
SGVsbG8=
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

Base64 decode should reject malformed input such as:

- characters outside the Base64 alphabet
- invalid padding positions
- broken character group lengths

## Important limitation

Successful Base64 decoding only means the byte layout is valid. It does not guarantee the result is human-readable text.
