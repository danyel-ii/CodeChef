# Atbash

## What it does

Atbash mirrors the alphabet:

- `A` becomes `Z`
- `B` becomes `Y`
- `C` becomes `X`

and so on.

It is a classical monoalphabetic substitution cipher and it is self-inverse.

## Core algorithm in the app

For each character:

1. If it is uppercase `A-Z`, compute:

```text
'Z' - (rune - 'A')
```

2. If it is lowercase `a-z`, compute:

```text
'z' - (rune - 'a')
```

3. If it is not alphabetic, leave it unchanged.

## Example

Input:

```text
Attack at Dawn!
```

Output:

```text
Zggzxp zg Wzdm!
```

Running Atbash again on that output restores the original.

## Important detail

Atbash does not need a key and does not shift letters cyclically. It directly reflects each letter across the center of the alphabet.
