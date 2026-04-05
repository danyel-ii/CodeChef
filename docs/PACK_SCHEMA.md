# Pack Schema

Packs are the unit of modular expansion.

A pack bundles:
- operation manifests,
- operation implementations,
- learning content refs,
- examples,
- migrations,
- license/provenance notes.

## 1. Goals

A pack should let us:
- add grouped operations cleanly,
- version a set of operations together,
- control dependencies,
- preserve provenance and licensing,
- and keep startup lightweight.

## 2. Pack manifest shape

```json
{
  "packId": "core.text",
  "version": "1.0.0",
  "title": "Core Text Pack",
  "description": "Common text and encoding transforms.",
  "stability": "stable",
  "minProtocolVersion": "1.0.0",
  "dependencies": [],
  "operations": [],
  "learningBundleRef": "assets/learning/core_text.bundle.json",
  "licenseNotices": [],
  "deprecations": [],
  "searchKeywords": ["encoding", "text", "base64", "hex"],
  "maintainer": "internal",
  "signed": false
}
```

## 3. Field definitions

### `packId`
Stable namespaced identifier.

### `version`
Semver version for the pack.

### `minProtocolVersion`
Minimum execution protocol version supported.

### `dependencies`
List of required packs and version ranges.

### `operations`
Inline manifests or refs resolved during registration.

### `learningBundleRef`
Ref to the pack’s educational content bundle.

### `licenseNotices`
Notices for reused third-party code/assets.

### `deprecations`
Mappings for pack-level deprecations/replacements.

## 4. Dependency block

```json
{
  "dependencies": [
    { "packId": "core.text", "versionRange": "^1.0.0" }
  ]
}
```

Use pack dependencies sparingly.
Prefer keeping packs independently useful.

## 5. Operation list

Pack operations can be declared inline or referenced.

Inline example:

```json
{
  "operations": [
    {
      "id": "core.text.base64.decode",
      "version": "1.0.0",
      "title": "Base64 Decode"
    }
  ]
}
```

Implementation-wise, the registry should still resolve the full manifest and executable binding from package code.

## 6. Deprecation block

```json
{
  "deprecations": [
    {
      "operationId": "core.text.rot13",
      "replacementOperationId": "core.text.caesar",
      "reason": "ROT13 is now modeled as a Caesar shift preset."
    }
  ]
}
```

## 7. License notice block

```json
{
  "licenseNotices": [
    {
      "subject": "Adapted algorithm implementation",
      "spdx": "Apache-2.0",
      "noticeRef": "licenses/cyberchef_notice.txt",
      "sourceRef": "docs/provenance/core_text_base64_decode.md"
    }
  ]
}
```

## 8. Example pack manifest — `core.text`

```json
{
  "packId": "core.text",
  "version": "1.0.0",
  "title": "Core Text Pack",
  "description": "Common text and encoding transforms.",
  "stability": "stable",
  "minProtocolVersion": "1.0.0",
  "dependencies": [],
  "operations": [
    {
      "id": "core.text.base64.encode",
      "version": "1.0.0",
      "title": "Base64 Encode"
    },
    {
      "id": "core.text.base64.decode",
      "version": "1.0.0",
      "title": "Base64 Decode"
    },
    {
      "id": "core.text.hex.encode",
      "version": "1.0.0",
      "title": "Hex Encode"
    },
    {
      "id": "core.text.hex.decode",
      "version": "1.0.0",
      "title": "Hex Decode"
    },
    {
      "id": "core.text.url.decode",
      "version": "1.0.0",
      "title": "URL Decode"
    },
    {
      "id": "core.text.xor",
      "version": "1.0.0",
      "title": "XOR"
    },
    {
      "id": "core.text.caesar",
      "version": "1.0.0",
      "title": "Caesar Shift"
    }
  ],
  "learningBundleRef": "assets/learning/core_text.bundle.json",
  "licenseNotices": [],
  "deprecations": [],
  "searchKeywords": ["encoding", "text", "base64", "hex", "xor", "caesar"],
  "maintainer": "internal",
  "signed": false
}
```

## 9. Installation model

MVP recommendation:
- packs are compiled into the app,
- registry loads them lazily,
- manifests are discoverable at startup,
- heavy learning content may load on demand.

Do not support arbitrary runtime-downloaded executable code in MVP.

## 10. Validation rules

Pack load should fail if:
- pack id duplicates another installed pack version illegally
- protocol version is incompatible
- operation ids collide without a permitted upgrade path
- required learning refs are missing in production build
- provenance/license refs are malformed for reused code

## 11. Future extensions

Possible later fields:
- `featureFlags`
- `premiumTier`
- `signatureInfo`
- `platformSupport`
- `previewAssetRefs`
