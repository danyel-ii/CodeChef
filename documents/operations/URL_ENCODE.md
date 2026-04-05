# URL Encode

## What it is

URL Encode replaces characters that are unsafe or reserved in URL components with percent escapes.

A percent escape has this form:

```text
%HH
```

where `HH` is the hexadecimal byte value.

## How it works

1. Walk through the input text.
2. Leave URL-safe unreserved characters unchanged.
3. Convert characters that must be escaped into bytes.
4. Render each escaped byte as `%` plus two hex digits.
5. If form-style encoding is enabled, turn spaces into `+` instead of `%20`.

## Example

Input:

```text
hello world
```

Output:

```text
hello%20world
```

Form-style variant:

```text
hello+world
```

## Why it matters

URLs assign special meaning to characters such as:

- spaces
- `?`
- `&`
- `=`
- `%`

Encoding prevents those characters from being misread as structure instead of content.
