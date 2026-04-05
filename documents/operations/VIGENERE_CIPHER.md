# Vigenere Cipher

## What it is

The Vigenere cipher is a polyalphabetic substitution cipher.

Instead of using one fixed shift for the whole message, it uses a keyword. Each key letter produces a different alphabetic shift.

## How it works

1. Choose an alphabetic key such as `LEMON`.
2. Convert each key letter to a shift value:
   - `A = 0`
   - `B = 1`
   - ...
   - `Z = 25`
3. Walk through the plaintext one character at a time.
4. For each alphabetic character, apply the next key shift.
5. Advance the key only when a letter is processed.
6. For decoding, subtract the key shift instead of adding it.

## Precise shift derivation

For a key letter:

```text
shift = uppercaseKeyLetter - 'A'
```

So:

- `L = 11`
- `E = 4`
- `M = 12`
- `O = 14`
- `N = 13`

## Precise encoding rule

For uppercase letters:

```text
output = 'A' + ((input - 'A' + keyShift) mod 26)
```

For decoding:

```text
output = 'A' + ((input - 'A' - keyShift + 26) mod 26)
```

The lowercase version uses `'a'` as the base.

## Example

Plaintext:

```text
ATTACKATDAWN
```

Key:

```text
LEMON
```

Repeated key alignment:

```text
LEMONLEMONLE
```

Encoded output:

```text
LXFOPVEFRNHR
```

Decoding that ciphertext with the same key returns:

```text
ATTACKATDAWN
```

## Why it differs from Caesar

Caesar uses one shift everywhere.

Vigenere changes the shift from letter to letter, which makes simple frequency analysis harder than with Caesar.

## Important limitation

Vigenere is still a classical cipher, not modern secure cryptography. Repeating-key patterns can still be attacked.
