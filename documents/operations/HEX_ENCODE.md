# Hex Encode

## What it is

Hex Encode turns each byte into two hexadecimal digits.

Hexadecimal uses base 16:

- `0-9`
- `a-f`

## How it works

1. Convert the input into bytes.
2. For each byte, take the upper 4 bits and lower 4 bits.
3. Convert each 4-bit value into one hex digit.
4. Emit exactly two hex digits per byte.

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

## Why hex is useful

Hex preserves byte boundaries clearly:

- one byte always equals two hex digits
- packet fields and binary structures are easier to inspect

## Tradeoff

Hex doubles the character length of the data.
