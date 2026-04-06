# Base64 Encode

## Slide deck

- [Base64 Deconstructed](../../apps/mobile/assets/pdfs/operations/base64_deconstructed.pdf)

## What it does

Base64 Encode turns raw bytes into a restricted text alphabet made of:

- `A-Z`
- `a-z`
- `0-9`
- `+`
- `/`

with `=` used as padding.

It is an encoding format, not encryption.

## Core algorithm

1. Convert the input into bytes.
2. Read the bytes in groups of 3.
3. Treat each 3-byte group as 24 bits.
4. Split those 24 bits into 4 groups of 6 bits.
5. Map each 6-bit value to a Base64 character.
6. If the input length is not divisible by 3, pad the output with `=`.

## Bit layout example

Take the three ASCII bytes for `Man`:

```text
M = 01001101
a = 01100001
n = 01101110
```

Concatenate them:

```text
010011 010110 000101 101110
```

These 6-bit values are:

```text
19 22 5 46
```

Mapping those values into the Base64 alphabet gives:

```text
T W F u
```

So `Man` becomes `TWFu`.

## Why the output gets longer

Every 3 input bytes become 4 output characters.

That means Base64 increases size by roughly one third, not counting optional line breaks.

## Example

Input:

```text
Hello
```

UTF-8 bytes:

```text
48 65 6c 6c 6f
```

Encoded output:

```text
SGVsbG8=
```

## App-specific behavior

The app exposes one formatting parameter:

- `lineBreakInterval`

If that value is greater than zero, the encoded string is chunked into fixed-width segments and joined with newline characters after encoding.

## What the padding means

Padding exists because Base64 encodes complete 24-bit groups.

- 3 bytes need no padding
- 2 bytes need 1 `=`
- 1 byte needs 2 `=`

## Important limitation

Base64 hides nothing. Anyone can decode it back immediately.
