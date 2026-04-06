# XOR

## Slide deck

- [The XOR Transform](../../apps/mobile/assets/pdfs/operations/the_xor_transform.pdf)

## What it does

XOR is a byte-wise reversible transform based on the exclusive OR operation.

For each bit:

- `0 XOR 0 = 0`
- `0 XOR 1 = 1`
- `1 XOR 0 = 1`
- `1 XOR 1 = 0`

Its key property is reversibility:

```text
(data XOR key) XOR key = data
```

## Core algorithm in the app

1. Interpret the input as text, hex, or Base64.
2. Convert the key string into UTF-8 bytes.
3. Repeat the key bytes over the full input length.
4. XOR each input byte with the matching key byte.
5. Render the result as text, hex, or Base64.

## Precise byte logic

If the input bytes are:

```text
b0, b1, b2, ...
```

and the key bytes are:

```text
k0, k1, k2, ...
```

then the output byte at position `i` is:

```text
output[i] = input[i] XOR key[i mod keyLength]
```

That `mod` is what makes the key repeat.

## Input and output formats

The operation supports:

- input: `text`, `hex`, or `base64`
- output: `text`, `hex`, or `base64`

Input decoding behavior:

- `text` means UTF-8 bytes of the string
- `hex` must have an even number of digits
- `base64` must be valid Base64

## Example

Input text:

```text
hello
```

Key:

```text
key
```

Result in hex:

```text
030015070a
```

Applying the same XOR operation again with the same key returns `hello`.

## Security note

XOR is not modern secure encryption by itself. Repeating-key XOR is easy to analyze compared with real cryptographic schemes.
