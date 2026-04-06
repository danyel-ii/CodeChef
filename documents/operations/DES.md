# DES

## What it does

This operation performs DES encryption or decryption using an 8-character key through the `dart_3des` package wrapper used by the app.

DES is a legacy block cipher with a 56-bit effective key size and should be treated as historical or compatibility-only.

## Parameter behavior in the app

- key: must be exactly 8 characters
- mode: encrypt or decrypt
- input format for decrypt: text or Base64
- output format: text or Base64

## Core algorithm

DES is a 16-round Feistel network operating on 64-bit blocks.

At a high level:

1. Apply an initial permutation to the 64-bit block.
2. Split the block into left and right 32-bit halves.
3. Repeat 16 rounds:
   - expand the right half
   - mix it with a round key
   - pass through S-boxes
   - permute the result
   - XOR it with the left half
   - swap sides
4. Recombine halves and apply a final permutation.

## How the app behaves

- For encryption, the app passes plaintext to the DES wrapper and receives a text result.
- If the chosen output format is Base64, it Base64-encodes the wrapper output as Latin-1 bytes.
- For decryption, the app either decodes Base64 first and then decrypts or decrypts raw text directly.

## Important limitation

This operation follows the library behavior exposed in the current app. It is useful for legacy exercises, but DES should not be presented as secure modern encryption.
