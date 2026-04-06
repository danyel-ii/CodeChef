# RC4

## What it does

RC4 is a stream cipher. It turns a key into a pseudo-random keystream and XORs that keystream with the input bytes.

Encryption and decryption are the same operation:

```text
ciphertext = plaintext XOR keystream
plaintext = ciphertext XOR keystream
```

## Formats supported by the app

- key input: text, hex, or Base64
- message input: text, hex, or Base64
- output: text, hex, or Base64

## Core algorithm

RC4 has two stages.

### 1. Key Scheduling Algorithm

1. Initialize a 256-byte state array `S` with values `0..255`.
2. Walk through the array and swap entries based on the key bytes.

### 2. Pseudo-Random Generation Algorithm

1. Repeatedly permute `S`.
2. Emit one keystream byte per input byte.
3. XOR that byte with the message byte.

## How the app behaves

- The app decodes the key and message into bytes.
- It initializes `RC4Engine` from Pointy Castle.
- It processes the entire input byte array once.
- It renders the result in the selected output format.

## Security note

RC4 is deprecated and should be treated as legacy material for education and compatibility only.
