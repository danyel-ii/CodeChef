# Filter Empty Lines

## What it does

Filter Empty Lines removes any line whose trimmed content is empty.

That means it removes:

- fully empty lines
- lines containing only spaces or tabs

## Core algorithm in the app

1. Split the input on `\n`.
2. For each line, compute `line.trim()`.
3. Keep the line only if the trimmed result is not empty.
4. Join the remaining lines with `\n`.

## Example

Input:

```text
alpha

   
beta

gamma
```

Output:

```text
alpha
beta
gamma
```

## Important detail

The original line contents are kept for non-empty lines. The operation uses `trim()` only for the emptiness test, not for rewriting the kept line text.
