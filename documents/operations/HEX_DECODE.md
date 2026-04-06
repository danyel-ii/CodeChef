# Hex Decode

## Slide deck

- [Inside Hex Decode](/Users/danyel-ii/CodeChef/apps/mobile/assets/pdfs/operations/inside_hex_decode.pdf)

## What it does

Hex Decode converts hexadecimal text back into the original bytes.

## Core algorithm

1. Remove whitespace from the input.
2. Ensure the remaining string has an even number of characters.
3. Read the string in pairs.
4. Parse each pair as one byte in base 16.
5. Return the resulting byte array.

## Worked example

Input:

```text
48 65 6c 6c 6f
```

After whitespace removal:

```text
48656c6c6f
```

Byte pairs:

```text
48 65 6c 6c 6f
```

UTF-8 text:

```text
Hello
```

## App-specific behavior

- The app accepts embedded whitespace and strips it before decoding.
- If the compacted string length is odd, decoding fails.
- If any pair contains a non-hex character, decoding fails.
- `treatOutputAs=text` UTF-8 decodes the bytes.
- `treatOutputAs=bytes` leaves them as raw bytes.

## Important limitation

Hex only tells you how to rebuild bytes. It does not tell you what those bytes mean. Interpreting them as text only works if they actually encode text.
