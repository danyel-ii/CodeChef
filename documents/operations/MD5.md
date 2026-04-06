# MD5

## What it does

MD5 turns an arbitrary byte stream into a fixed 128-bit digest, which the app renders as 32 lowercase hexadecimal characters.

It is a cryptographic hash historically, but it is no longer considered secure for collision resistance.

## Core algorithm

MD5 processes the message in 512-bit blocks.

1. Convert the input to bytes.
2. Append a single `1` bit, then enough `0` bits so the length is 64 bits short of a full 512-bit block.
3. Append the original message length as a 64-bit little-endian integer.
4. Initialize four 32-bit state words usually called `A`, `B`, `C`, and `D`.
5. For each 512-bit block:
   - split the block into 16 little-endian 32-bit words
   - run 64 mixing steps grouped into 4 rounds
   - each round uses a different nonlinear function and rotation schedule
6. Add the block result back into the running state.
7. Output the final 128-bit state as hex.

## Mixing structure

The four MD5 round functions are:

- `F(X,Y,Z) = (X AND Y) OR ((NOT X) AND Z)`
- `G(X,Y,Z) = (X AND Z) OR (Y AND (NOT Z))`
- `H(X,Y,Z) = X XOR Y XOR Z`
- `I(X,Y,Z) = Y XOR (X OR (NOT Z))`

Each step adds:

- one state word
- one message word
- one round constant
- then rotates left and adds into another state word

## Example

Input:

```text
hello
```

Digest:

```text
5d41402abc4b2a76b9719d911017c592
```

## How the app behaves

- The app hashes the raw input bytes.
- It does not trim, normalize, or reinterpret text before hashing.
- The implementation delegates to Dart's `crypto` package and returns the digest string directly.

## Security note

MD5 is still useful for fingerprints, duplicate detection, and legacy compatibility, but it should not be used where collision resistance matters.
