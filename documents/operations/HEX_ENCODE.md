# Hex Encode

## Slide deck

- [Hexadecimal Encoding Mechanics](../../apps/mobile/assets/pdfs/operations/hexadecimal_encoding_mechanics.pdf)

## What it does

Hex Encode turns each byte into two hexadecimal digits.

Hexadecimal uses base 16:

- `0-9`
- `a-f`

## Core algorithm

1. Convert the input into bytes.
2. For each byte, take the upper 4 bits and lower 4 bits.
3. Convert each 4-bit value into one hex digit.
4. Emit exactly two hex digits per byte.

## Byte-level view

Suppose a byte is:

```text
01101100
```

Split it into two 4-bit nibbles:

```text
0110 1100
```

These nibbles are:

```text
6 C
```

So the byte becomes:

```text
6c
```

## Example

Input:

```text
Hello
```

Bytes:

```text
48 65 6c 6c 6f
```

Hex output:

```text
48656c6c6f
```

## App-specific behavior

The app writes lowercase hex by default and has one formatting toggle:

- `uppercase=true` converts the final string to uppercase after encoding

## Tradeoff

Hex preserves byte boundaries clearly, but it doubles the visible character length of the data.
