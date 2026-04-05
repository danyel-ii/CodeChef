# Recipe Schema

Recipes are durable, versioned documents that must survive app upgrades.

## 1. Goals

A recipe format should:
- remain stable over time,
- avoid UI-only fields,
- support migration,
- be easy to save/share/test,
- and reference operations by stable ids.

## 2. Top-level document

```json
{
  "schemaVersion": "1.0.0",
  "recipeId": "01JXAMPLEA1B2C3D4E5F6G7H8",
  "title": "Decode JWT Payload",
  "description": "Split a JWT and pretty-print its payload.",
  "createdAt": "2026-04-05T10:00:00Z",
  "updatedAt": "2026-04-05T10:10:00Z",
  "tags": ["jwt", "json", "training"],
  "inputAssumptions": {
    "preferredKind": "text",
    "notes": "Expects a JWT string in compact serialization."
  },
  "compatibility": {
    "minAppProtocolVersion": "1.0.0",
    "requiredPacks": [
      { "packId": "core.format", "versionRange": "^1.0.0" }
    ]
  },
  "steps": [],
  "notes": [],
  "provenance": {
    "createdBy": "user",
    "source": "manual"
  }
}
```

## 3. Field definitions

### `schemaVersion`
Version of the recipe document format, not the app version.

### `recipeId`
Stable local identifier. Use ULID or UUID.

### `title`
User-facing recipe title.

### `description`
Optional longer summary.

### `tags`
Free-form tags for search and organization.

### `inputAssumptions`
Hints to the UI and executor about likely input type.

### `compatibility`
Declares required protocol and pack versions.

### `steps`
Ordered array of recipe steps.

### `notes`
Optional instructional notes, not required by the executor.

### `provenance`
Tracks where the recipe came from.

## 4. Step shape

```json
{
  "stepId": "01JXSTEPA1B2C3D4E5F6G7H8",
  "enabled": true,
  "operation": {
    "id": "core.format.jwt.parse",
    "versionRange": "^1.0.0"
  },
  "params": {
    "outputSection": "payload",
    "pretty": true
  },
  "assertions": [],
  "label": "Parse payload"
}
```

## 5. Step rules

- `stepId` must be stable within the recipe.
- `enabled=false` means skip step but preserve it.
- `operation.id` must be a stable operation id.
- `versionRange` uses semver range syntax.
- `params` must be validated against the operation schema.
- `assertions` are optional and mostly for future/test use.

## 6. Compatibility block

```json
{
  "compatibility": {
    "minAppProtocolVersion": "1.0.0",
    "requiredPacks": [
      { "packId": "core.text", "versionRange": "^1.0.0" },
      { "packId": "core.format", "versionRange": "^1.0.0" }
    ],
    "deprecatedOperationFallbacks": []
  }
}
```

Rules:
- If a required pack is missing, surface a structured error.
- If an operation is deprecated but has a migration path, attempt migration and store the result.

## 7. Notes block

Notes are informative only.

```json
{
  "notes": [
    {
      "type": "warning",
      "text": "JWT decode does not verify signatures."
    }
  ]
}
```

## 8. Assertions (future-friendly)

Assertions allow recipe validation later.

Examples:
- output must be valid JSON
- output text must contain a substring
- output size must be under N bytes

MVP may store assertions without enforcing all of them.

## 9. Example recipe — Base64 decode then pretty-print JSON

```json
{
  "schemaVersion": "1.0.0",
  "recipeId": "01JXEXAMPLEBASE64JSON",
  "title": "Base64 JSON Decode",
  "description": "Decode a Base64 string and format it as JSON.",
  "createdAt": "2026-04-05T10:00:00Z",
  "updatedAt": "2026-04-05T10:00:00Z",
  "tags": ["base64", "json"],
  "inputAssumptions": {
    "preferredKind": "text",
    "notes": "Input should be Base64-encoded JSON."
  },
  "compatibility": {
    "minAppProtocolVersion": "1.0.0",
    "requiredPacks": [
      { "packId": "core.text", "versionRange": "^1.0.0" },
      { "packId": "core.format", "versionRange": "^1.0.0" }
    ]
  },
  "steps": [
    {
      "stepId": "01JXSTEP1",
      "enabled": true,
      "operation": {
        "id": "core.text.base64.decode",
        "versionRange": "^1.0.0"
      },
      "params": {
        "treatOutputAs": "text"
      },
      "label": "Decode Base64"
    },
    {
      "stepId": "01JXSTEP2",
      "enabled": true,
      "operation": {
        "id": "core.format.json.pretty",
        "versionRange": "^1.0.0"
      },
      "params": {
        "indent": 2,
        "sortKeys": false
      },
      "label": "Pretty-print JSON"
    }
  ],
  "notes": [
    {
      "type": "info",
      "text": "Useful for decoding encoded API payloads."
    }
  ],
  "provenance": {
    "createdBy": "user",
    "source": "manual"
  }
}
```

## 10. Storage guidance

Store recipe documents as:
- normalized JSON in the database,
- plus selected indexed fields for search/list screens.

Recommended indexed fields:
- `recipeId`
- `title`
- `updatedAt`
- tags
- favorite flag
- pack dependency summary

## 11. Migration guidance

When `schemaVersion` changes:
1. detect old version on load,
2. run a pure migration function,
3. validate result,
4. store upgraded document if successful.

Migration must never depend on widget code.

## 12. What not to store in the recipe

Do not store:
- selected tab index
- scroll positions
- transient preview text
- device-specific UI layout
- ephemeral search query state
