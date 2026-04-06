# Join Lines

## What it does

Join Lines replaces every newline boundary with a configurable separator.

It is a straightforward line-concatenation operation.

## Core algorithm in the app

1. Split the input string on `\n`.
2. Join the resulting list with the chosen separator.

Default separator:

```text
, 
```

## Example

Input:

```text
apple
banana
cherry
```

Default output:

```text
apple, banana, cherry
```

If the separator is ` | `, the output becomes:

```text
apple | banana | cherry
```

## Important detail

This operation does not trim lines automatically. If a line contains surrounding spaces, those spaces remain unless you run `Trim Lines` first.
