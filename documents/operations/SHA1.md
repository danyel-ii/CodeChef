# SHA-1

## What it does

SHA-1 turns input bytes into a 160-bit digest, rendered as 40 lowercase hexadecimal characters.

It is stronger than MD5 historically, but it is also considered broken for serious security use because practical collisions exist.

## Core algorithm

SHA-1 also works on 512-bit blocks.

1. Convert the input to bytes.
2. Append a `1` bit.
3. Append enough `0` bits so the message ends 64 bits short of a 512-bit boundary.
4. Append the original length as a 64-bit big-endian integer.
5. Initialize five 32-bit state words.
6. For each block:
   - split it into 16 words
   - expand those 16 words into an 80-word schedule
   - run 80 rounds of mixing
7. Concatenate the five final state words to form the digest.

## Message schedule

Words `16` through `79` are derived from earlier words:

```text
W[t] = leftrotate1(W[t-3] XOR W[t-8] XOR W[t-14] XOR W[t-16])
```

## Round structure

The 80 steps are grouped into four 20-step segments, each using:

- a different nonlinear function
- a different additive constant

The state variables rotate and feed each other forward, so every block affects the final digest.

## Example

Input:

```text
hello
```

Digest:

```text
aaf4c61ddcc5e8a2dabede0f3b482cd9aea9434d
```

## How the app behaves

- The app hashes the exact input bytes.
- It returns the standard lowercase hex digest.
- The implementation uses Dart's `crypto` package.

## Security note

SHA-1 should be treated as a legacy compatibility hash, not a modern security primitive.
