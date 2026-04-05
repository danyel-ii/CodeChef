# Base64 Encode

## What it is

Base64 Encode turns binary data or text bytes into a limited alphabet made of:

- `A-Z`
- `a-z`
- `0-9`
- `+`
- `/`

with `=` used as padding.

It is an encoding format, not encryption.

## How it works

1. Convert the input into bytes.
2. Read the bytes in groups of 3.
3. Treat each 3-byte group as 24 bits.
4. Split those 24 bits into 4 groups of 6 bits.
5. Map each 6-bit value to a Base64 character.
6. If the input length is not divisible by 3, pad the output with `=`.

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

## What the padding means

Padding exists because Base64 encodes complete 24-bit groups.

- 3 bytes need no padding
- 2 bytes need 1 `=`
- 1 byte needs 2 `=`

## When to use it

- transporting binary through text-only systems
- embedding binary data in JSON
- handling APIs that expect Base64 payloads

## Important limitation

Base64 hides nothing. Anyone can decode it back immediately.
