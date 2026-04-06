# JSON Minify

## What it does

JSON Minify parses JSON and writes it back with all unnecessary whitespace removed.

The result is still valid JSON, just more compact.

## Core algorithm in the app

1. Parse the input with `jsonDecode`.
2. Optionally sort object keys recursively.
3. Re-encode the parsed structure with `jsonEncode`.

Because the app parses first, it does not blindly strip spaces character by character. It rebuilds the JSON from its parsed structure.

## Why that matters

Whitespace inside JSON strings must be preserved.

For example:

```json
{"msg":"a b"}
```

The space in `"a b"` is part of the string value, so a correct minifier must keep it.

Parsing then re-encoding does that safely.

## Optional sorting

If `sortKeys` is enabled, the app recursively sorts object keys before minifying. That changes ordering, not meaning.

## Example

Input:

```json
{
  "name": "Ada",
  "roles": [
    "writer",
    "mathematician"
  ]
}
```

Output:

```json
{"name":"Ada","roles":["writer","mathematician"]}
```

## Failure mode

Invalid JSON throws during parsing, so the operation stops instead of trying to guess intent.
