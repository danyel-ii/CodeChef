# Base64 Decode

## Slide deck

- [Base64 Decoding Mechanics](../../apps/mobile/assets/pdfs/operations/base64_decoding_mechanics.pdf)

## What it does

Base64 Decode turns Base64 text back into the original byte stream.

Depending on the selected output mode, the app then interprets those bytes either as:

- raw bytes
- UTF-8 text

## Core algorithm

1. Remove whitespace from the input.
2. Read Base64 characters in groups of 4.
3. Map each Base64 character back to a 6-bit value.
4. Combine four 6-bit values into 24 bits.
5. Split the 24 bits back into 3 bytes.
6. Use `=` padding to determine whether the original group represented 1, 2, or 3 bytes.

## Worked example

Input:

```text
SGVsbG8=
```

The reconstructed bytes are:

```text
48 65 6c 6c 6f
```

As UTF-8 text:

```text
Hello
```

## App-specific behavior

- The app removes all whitespace before decoding, so wrapped Base64 blocks are accepted.
- If `treatOutputAs=bytes`, the output remains a byte payload.
- If `treatOutputAs=text`, the app UTF-8 decodes the bytes.
- Invalid Base64 triggers a structured `invalidInput` error.

## Why decoding can fail

Base64 decode rejects malformed input such as:

- characters outside the Base64 alphabet
- invalid padding positions
- broken character group lengths

## Important limitation

Successful Base64 decoding only means the byte layout is valid. It does not guarantee the result is human-readable text.
