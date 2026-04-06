# XOR

## Slide deck

- [The XOR Transform](/Users/danyel-ii/CodeChef/apps/mobile/assets/pdfs/operations/The_XOR_Transform.pdf)

## What it is

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

## How it works in the app

1. Interpret the input as text, hex, or Base64.
2. Convert the key into bytes.
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

## Why it is educational

XOR is useful for teaching:

- reversible bitwise operations
- repeating-key transforms
- why "obfuscated" does not mean "secure"

## Security note

XOR is not modern secure encryption by itself. Repeating-key XOR is easy to analyze compared with real cryptographic schemes.
