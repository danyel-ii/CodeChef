# ROT47

## What it does

ROT47 rotates printable ASCII characters by 47 positions within the range `!` through `~`.

Like ROT13, it is self-inverse: applying it twice returns the original text.

## Core algorithm in the app

For each character:

1. Check whether its code point is between `33` and `126`.
2. If yes, remap it with:

```text
33 + ((code - 33 + 47) mod 94)
```

3. If not, leave it unchanged.

The printable ASCII range contains 94 characters, so a rotation by 47 is exactly half a full cycle.

## Example

Input:

```text
Hello!
```

ROT47 output:

```text
w6==@P
```

Applying ROT47 again to `w6==@P` returns `Hello!`.

## Difference from ROT13

- ROT13 only affects alphabetic letters.
- ROT47 affects digits, punctuation, and symbols too, as long as they are in printable ASCII.
