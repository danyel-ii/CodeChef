# JSON Pretty

## What it does

JSON Pretty parses JSON and writes it back in a human-readable layout with indentation and line breaks.

It is a structure-preserving transform, not a semantic change.

## Core algorithm in the app

1. Parse the input with `jsonDecode`.
2. Optionally sort object keys recursively.
3. Serialize the parsed structure with `JsonEncoder.withIndent('  ')`.
4. If the requested indentation is not 2 spaces, rewrite each indentation prefix to the requested width.

## Key sorting behavior

When `sortKeys` is enabled:

- every JSON object is converted into a new map whose entries are sorted alphabetically by key
- nested objects are sorted recursively
- arrays keep their original order, but each element is normalized recursively

That means key sorting changes presentation order, but not values.

## Indentation remapping

The pretty encoder always starts from a 2-space indentation base.

The app then:

- counts leading spaces on each line
- divides that count by 2 to get the nesting level
- rewrites the leading spaces as `level * requestedIndent`

If the indent is `0` or negative, all leading indentation spaces are stripped.

## Example

Input:

```json
{"b":2,"a":{"z":1,"y":2}}
```

Pretty output with `indent=2` and `sortKeys=true`:

```json
{
  "a": {
    "y": 2,
    "z": 1
  },
  "b": 2
}
```

## Failure mode

If the input is not valid JSON, parsing fails and the operation errors immediately.
