# Caesar Cipher

## What it is

The Caesar cipher is a monoalphabetic substitution cipher.

Each letter is replaced by another letter a fixed number of positions away in the alphabet.

## How it works

1. Choose a shift value.
2. Walk through the text character by character.
3. For each letter, move forward by the shift when encoding.
4. Move backward by the same shift when decoding.
5. Wrap around when the alphabet boundary is crossed.
6. Leave non-letter characters unchanged.

## Precise rule

For uppercase letters:

```text
encode: 'A' + ((input - 'A' + shift) mod 26)
decode: 'A' + ((input - 'A' - shift + 26) mod 26)
```

The same pattern applies to lowercase letters using `'a'` as the base.

## Example

Input:

```text
Attack at dawn
```

Shift:

```text
3
```

Encoded:

```text
Dwwdfn dw gdzq
```

Decoding that output with the same shift returns:

```text
Attack at dawn
```

## What it teaches

The Caesar cipher is useful for understanding:

- substitution ciphers
- modular arithmetic
- the difference between reversible transformation and secure cryptography

## Security note

The Caesar cipher is trivially breakable because there are only 26 possible shifts.
