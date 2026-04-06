# URL Encode

## What it does

URL Encode percent-escapes characters that are unsafe or reserved inside URI components.

## Core algorithm in the app

1. Treat the input as text.
2. Run `Uri.encodeComponent(...)` on the string.
3. Optionally replace `%20` with `+` if `spaceAsPlus=true`.

## Percent-encoding mechanics

URL encoding works on bytes. A byte with hexadecimal value `HH` is represented as:

```text
%HH
```

For example:

- space is byte `0x20`, so it becomes `%20`
- `&` is byte `0x26`, so it becomes `%26`
- `!` is byte `0x21`, so it becomes `%21`

## Example

Input:

```text
A value with spaces & symbols!
```

Output:

```text
A%20value%20with%20spaces%20%26%20symbols%21
```

With `spaceAsPlus=true`, the output becomes:

```text
A+value+with+spaces+%26+symbols%21
```

## Important note

This operation targets URI component encoding, which is correct for individual values. It is not intended to escape an already structured full URL verbatim.
