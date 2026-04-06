# XOR Brute Force

## What it does

XOR Brute Force tries every one-byte XOR key in a selected range, scores each candidate as likely text, and returns the highest-ranked results.

It is an analysis tool rather than a direct encode/decode transform.

## Core algorithm in the app

1. Decode the input bytes from text, hex, or Base64.
2. Choose a key range, normally `0` to `255`.
3. For each candidate key byte:
   - XOR every input byte with that key
   - interpret the result as text
   - score the result for “English-like” readability
4. Sort candidates by score descending.
5. Return the top `candidateCount` lines.

## Scoring model

The app uses a simple heuristic:

- printable ASCII adds `2`
- very common letters and spaces from `etaoinshrdlu` add another `1.5`
- tab, line feed, and carriage return add `0.5`
- non-printable bytes subtract `4`

This is not cryptanalysis in the formal sense. It is a readability heuristic.

## Output format

Each candidate line is rendered like:

```text
0x4B | score=23.50 | candidate text here
```

Newlines inside a candidate are escaped as `\n`.

## Limitation

This operation only tests single-byte XOR keys. It does not recover repeating multi-byte XOR keys.
