# CRC32

## Slide deck

- [CRC32 Mechanics](/Users/danyel-ii/CodeChef/apps/mobile/assets/pdfs/operations/crc32_mechanics.pdf)

## What it does

CRC32 computes a 32-bit checksum for an input stream and renders it as 8 hexadecimal characters.

It is designed for accidental error detection, not for cryptographic security.

## Core algorithm in the app

The implementation uses the standard reflected CRC32 polynomial `0xEDB88320`.

1. Start with `crc = 0xffffffff`.
2. For each input byte:
   - XOR the byte into the low end of the running CRC
   - repeat 8 bit-steps:
     - inspect the lowest bit
     - shift the CRC right by one
     - if that bit was `1`, XOR in the polynomial `0xedb88320`
3. After all bytes, XOR the result with `0xffffffff`.
4. Mask to 32 bits and print as hex.

## Bit-step intuition

CRC32 is effectively polynomial division over GF(2), but implemented with shifts and XOR.

At each step:

- right shift means “move to the next bit”
- XOR with the polynomial means “reduce by the generator polynomial” when needed

## Example

Input:

```text
hello
```

Checksum:

```text
3610a686
```

## How the app behaves

- The app hashes the raw input bytes.
- It does not uppercase the result.
- The output is always exactly 8 hex digits because the string is left-padded with zeros if needed.

## Safety note

CRC32 catches many accidental changes, but it is trivial to forge intentionally. It should never be treated as a security hash.
