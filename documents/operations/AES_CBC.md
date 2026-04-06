# AES (CBC)

## Slide deck

- [AES-CBC Engineering Blueprint](../../apps/mobile/assets/pdfs/operations/aes_cbc_engineering_blueprint.pdf)

## What it does

This operation performs AES encryption or decryption in CBC mode with PKCS7 padding.

That means:

- AES is the block cipher
- CBC is the chaining mode
- PKCS7 is the padding scheme

## Required parameters

- key: must decode to 16, 24, or 32 bytes
- IV: must decode to exactly 16 bytes
- mode: encrypt or decrypt
- input format: text, hex, or Base64
- output format: text, hex, or Base64

## Core algorithm

### AES block cipher

AES operates on 16-byte blocks and runs a sequence of substitution, permutation, row shifting, and column mixing rounds under a key schedule.

The exact number of rounds depends on key length:

- 10 rounds for 128-bit keys
- 12 rounds for 192-bit keys
- 14 rounds for 256-bit keys

### CBC mode

For encryption:

1. Pad the plaintext to a multiple of 16 bytes with PKCS7.
2. XOR the first plaintext block with the IV.
3. Encrypt that block with AES.
4. For every later block, XOR it with the previous ciphertext block before encrypting.

For decryption:

1. Decrypt a ciphertext block with AES.
2. XOR the result with the IV for the first block or the previous ciphertext block for later blocks.
3. Remove PKCS7 padding at the end.

## How the app behaves

- It decodes key, IV, and input bytes using the selected formats.
- It validates key and IV lengths before running.
- It uses Pointy Castle's AES engine wrapped in CBC with PKCS7 padding.
- It encodes the output in the selected output format.

## Security note

AES is real cryptography, but CBC by itself does not provide integrity. In modern systems, authenticated modes like GCM are usually preferred.
