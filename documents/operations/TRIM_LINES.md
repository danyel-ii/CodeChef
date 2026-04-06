# Trim Lines

## What it does

Trim Lines removes leading and trailing whitespace from every line independently.

It does not remove blank lines; it only trims each line's edges.

## Core algorithm in the app

1. Split the input on newline characters.
2. Call `trim()` on each line.
3. Join the lines back together with `\n`.

## Important detail

Because the split uses the literal newline character:

- each line is treated independently
- interior spaces inside a line remain untouched
- a line containing only spaces becomes an empty line

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

## When to use it

- cleaning copy-pasted lists
- normalizing line-oriented input before other text operations
- preparing data before `Filter Empty Lines` or `Join Lines`
