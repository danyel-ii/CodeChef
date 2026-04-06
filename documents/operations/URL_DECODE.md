# URL Decode

## What it does

URL Decode reverses percent-encoded URI component text back into normal characters.

## Core algorithm in the app

1. Optionally rewrite `+` as `%20` if `plusAsSpace=true`.
2. Pass the prepared string into `Uri.decodeComponent(...)`.
3. Let the URI decoder turn each `%HH` byte escape back into the original characters.

## Example

Input:

```text
A%20value%20with%20spaces%20%26%20symbols%21
```

Output:

```text
A value with spaces & symbols!
```

## Why the `+` option exists

In strict URI component encoding, a literal plus sign is just `+`.

In HTML form encoding, `+` is often used as a shorthand for space.

The app defaults `plusAsSpace=true`, so:

```text
a+b
```

becomes:

```text
a b
```

unless you turn that behavior off.

## Failure mode

Malformed percent escapes fail during decoding rather than producing guessed output.
