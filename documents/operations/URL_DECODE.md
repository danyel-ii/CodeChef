# URL Decode

## What it is

URL Decode reverses percent escapes and reconstructs the original text.

## How it works

1. Walk left to right through the encoded text.
2. When a `%` appears, read the next two hex digits.
3. Convert that `%HH` sequence into one byte.
4. Copy ordinary characters through unchanged.
5. If form-style mode is enabled, turn `+` into a space.
6. Decode the recovered bytes into text.

## Example

Input:

```text
hello%20world
```

Output:

```text
hello world
```

Form-style example:

```text
hello+world
```

becomes:

```text
hello world
```

## Why decoding can fail

Decoding should reject malformed escapes such as:

- `%` not followed by two characters
- `%` followed by non-hex digits

Those are structural errors, not partial successes.
