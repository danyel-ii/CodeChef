# JSON Validate

## What it does

JSON Validate checks whether the input parses as valid JSON.

If the parse succeeds, the operation returns the original text unchanged and attaches a `validJson` informational diagnostic.

## Core algorithm in the app

1. Run `jsonDecode` on the input text.
2. If parsing fails, surface the parser error.
3. If parsing succeeds:
   - keep the original input as output
   - attach the diagnostic `Input is valid JSON.`

## Why it returns the original text

This operation is a validator, not a formatter.

Returning the original text preserves:

- whitespace
- key order
- line layout

That makes it useful in a pipeline where the next step may want the original exact document if validation passes.

## Example

Valid input:

```json
{"ok":true,"items":[1,2,3]}
```

Output:

```json
{"ok":true,"items":[1,2,3]}
```

Diagnostic:

```text
validJson: Input is valid JSON.
```

## Failure mode

Malformed JSON fails fast and does not emit a partial output.
