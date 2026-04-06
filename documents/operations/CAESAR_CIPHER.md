# Caesar Cipher

## What it does

Caesar Cipher shifts letters by a fixed number of positions through the alphabet.

## Core algorithm in the app

1. Choose a shift value.
2. For encoding, add the shift.
3. For decoding, subtract the shift.
4. Wrap around inside the 26-letter alphabet.
5. Preserve case.
6. Leave non-letter characters unchanged.

For uppercase letters:

```text
encode: 'A' + ((input - 'A' + shift) mod 26)
decode: 'A' + ((input - 'A' - shift + 26) mod 26)
```

The same pattern applies to lowercase letters using `'a'` as the base.

## Example

Input:

```text
Attack at dawn
```

Shift:

```text
3
```

Encoded:

```text
Dwwdfn dw gdzq
```

Decoding that output with the same shift returns:

```text
Attack at dawn
```

## App-specific behavior

- `mode=encode` applies the shift as given
- `mode=decode` negates the shift
- the helper normalizes the shift modulo 26
- non-alphabetic characters stay unchanged

## Security note

The Caesar cipher is trivially breakable because there are only 26 possible shifts.
