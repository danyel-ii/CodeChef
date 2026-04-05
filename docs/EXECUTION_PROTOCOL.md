# Execution Protocol

This document defines the contract for adding and running operations.

## 1. Goals

The protocol must let us:
- add operations without editing the workbench screen,
- route operations across different execution backends,
- version operations safely,
- render parameter editors from metadata,
- validate and test behavior consistently.

## 2. Terms

- **Operation**: one transform or analysis step
- **Pack**: a versioned bundle of operations and learning content
- **Recipe**: an ordered list of steps
- **Payload**: typed data moving through a recipe
- **Manifest**: metadata contract describing an operation or pack
- **Executor**: runtime that performs the operation
- **Diagnostic**: warning, info, or error associated with execution

## 3. Stable ids

Operation ids must be stable, lowercase, and namespaced.

Examples:
- `core.text.base64.decode`
- `core.text.base64.encode`
- `core.hash.sha256`
- `core.format.json.pretty`

Pack ids follow a similar pattern:
- `core.text`
- `core.hash`
- `core.format`

## 4. Payload model

## 4.1 Payload envelope

```dart
enum PayloadKind { text, bytes, json, lines }

class PayloadEnvelope {
  final PayloadKind kind;
  final String? mediaType;       // e.g. text/plain, application/json
  final String? characterEncoding; // e.g. utf-8
  final int sizeBytes;
  final Object data;             // typed by kind in implementation
  final Map<String, Object?> meta;
}
```

## 4.2 Rules

- Every operation must declare accepted input kinds.
- Every operation must declare produced output kinds.
- An operation may accept multiple kinds.
- If the operation performs coercion, it must document it.
- Large outputs may be truncated for preview, but full results must remain obtainable unless explicitly blocked.

## 5. Parameter schema

Operations declare a typed parameter schema.
The UI renders editors from this schema.

## 5.1 Supported parameter types

- `string`
- `int`
- `double`
- `bool`
- `enum`
- `string_list`
- `bytes`
- `json`
- `duration_ms`

## 5.2 Parameter field spec

```dart
class ParamFieldSpec {
  final String id;
  final String label;
  final String description;
  final ParamType type;
  final bool required;
  final Object? defaultValue;
  final List<Object>? allowedValues;
  final String? example;
  final ValidationRuleSet validation;
  final UiHint uiHint;
  final bool secret; // e.g. keys
}
```

## 5.3 UI hints

Examples:
- `singleLineText`
- `multiLineText`
- `toggle`
- `segmentedChoice`
- `dropdown`
- `chips`
- `numericStepper`
- `secretText`
- `byteModePicker`

The UI may refine presentation, but must respect validation and defaults.

## 6. Operation manifest

```dart
class OperationManifest {
  final String id;
  final String version;
  final String title;
  final String shortDescription;
  final String category;
  final List<String> tags;
  final List<PayloadKind> inputKinds;
  final List<PayloadKind> outputKinds;
  final List<ParamFieldSpec> params;
  final CapabilitySet capabilities;
  final Stability stability;
  final BackendKind backendKind;
  final LicenseRef? provenanceLicense;
  final LearningContentRef? learning;
  final DeprecationNotice? deprecation;
}
```

## 6.1 Required manifest fields

Every operation must define:
- stable id
- semver version
- user-facing title
- category
- input/output kinds
- parameter schema
- capability declaration
- backend kind
- learning ref or explicit reason why absent in development-only builds

## 7. Capability model

```dart
class CapabilitySet {
  final bool deterministic;
  final bool reversible;
  final bool previewSafe;
  final bool supportsLargeInputs;
  final bool supportsStreamingFuture;
  final bool mayProduceBinary;
  final bool requiresSecretParams;
  final bool educational;
}
```

Notes:
- `deterministic` means same input + params gives same output.
- `reversible` means a corresponding reverse path exists, not that this exact operation self-reverses.
- `previewSafe` means running in preview mode is acceptable.
- `requiresSecretParams` signals special UI handling.

## 8. Execution request

```dart
class ExecutionRequest {
  final String requestId;
  final PayloadEnvelope input;
  final RecipeDocument recipe;
  final bool previewMode;
  final int? previewOutputByteLimit;
  final ExecutionPolicy policy;
}
```

## 8.1 Execution policy

```dart
class ExecutionPolicy {
  final bool allowExperimentalOps;
  final bool allowDeprecatedOps;
  final bool failFast;
  final bool collectStepTraces;
  final bool sanitizeDiagnostics;
}
```

## 9. Execution context

The executor constructs a context for each step.

```dart
class OperationContext {
  final String requestId;
  final bool previewMode;
  final bool cancelled;
  final Clock clock;
  final RandomSource? randomSource;
  final Logger? logger; // debug/dev only
  final Map<String, Object?> environment;
}
```

Rules:
- The context must not expose Flutter UI objects.
- Cancellation must be observable.
- Production logging must never include raw payload data by default.

## 10. Operation interface

```dart
abstract class Operation {
  OperationManifest get manifest;
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  );
}
```

## 11. Step result

```dart
class StepExecutionResult {
  final PayloadEnvelope output;
  final List<Diagnostic> diagnostics;
  final StepMetrics metrics;
}
```

## 11.1 Diagnostics

```dart
enum DiagnosticSeverity { info, warning, error }

class Diagnostic {
  final String code;
  final DiagnosticSeverity severity;
  final String message;
  final String? detail;
  final Map<String, Object?> meta;
}
```

Examples:
- invalid Base64 padding
- input normalized from CRLF to LF
- output truncated in preview mode
- deprecated operation used

## 11.2 Metrics

```dart
class StepMetrics {
  final int elapsedMs;
  final int inputBytes;
  final int outputBytes;
}
```

## 12. Whole-recipe result

```dart
class ExecutionResult {
  final bool success;
  final PayloadEnvelope? output;
  final List<StepTrace> traces;
  final ExecutionError? error;
  final ExecutionMetrics metrics;
}
```

Where each `StepTrace` includes:
- step index
- operation id
- success/failure
- diagnostics
- metrics

## 13. Error model

```dart
enum ExecutionErrorCode {
  invalidParams,
  invalidInput,
  unsupportedPayloadKind,
  deprecatedBlocked,
  experimentalBlocked,
  cancelled,
  backendUnavailable,
  operationCrashed,
  outputTooLarge,
  migrationRequired,
  internal,
}
```

```dart
class ExecutionError {
  final ExecutionErrorCode code;
  final String userMessage;
  final String? developerMessage;
  final int? stepIndex;
  final String? operationId;
}
```

## 14. Backend routing

`BackendKind`:
- `inlineDart`
- `backgroundIsolate`
- `ffi`
- `reserved`

Rules:
- UI does not choose the runtime directly.
- The manifest declares a preferred backend kind.
- The broker may override based on policy/device capability later.

## 15. Versioning and migration

## 15.1 Operation versioning
- Use semver.
- Backward-compatible param additions are minor releases.
- Breaking param changes require migration support or a new operation id.

## 15.2 Param migration
Operations may implement migration hooks:

```dart
abstract class OperationMigration {
  String get fromVersion;
  String get toVersion;
  Map<String, Object?> migrateParams(Map<String, Object?> oldParams);
}
```

## 15.3 Pack migration
Packs may ship deprecation and replacement maps.

## 16. Test contract

Every operation must ship:

- nominal case tests
- edge case tests
- failure-mode tests
- example vector tests
- preview-mode tests if preview-safe
- large input guard tests where relevant
- migration tests if params evolved

## 17. Learning contract

Every production operation should ship:

- `what_it_does.md`
- `when_to_use.md`
- `gotchas.md`
- at least one runnable example

## 18. Security contract

If an operation touches keys/secrets:
- mark secret params in schema
- avoid storing secret defaults
- redact diagnostics
- explain whether the algorithm is educational or security-sensitive

## 19. Extension rules

A new operation should never require:
- editing a switch statement in the workbench screen
- custom serialization logic in recipe storage
- manual search-index edits outside pack registration

## 20. Example manifest snippet

```json
{
  "id": "core.text.base64.decode",
  "version": "1.0.0",
  "title": "Base64 Decode",
  "shortDescription": "Decodes Base64 text into bytes or text.",
  "category": "Encoding",
  "tags": ["base64", "decode", "text", "bytes"],
  "inputKinds": ["text"],
  "outputKinds": ["bytes", "text"],
  "params": [
    {
      "id": "treatOutputAs",
      "label": "Treat output as",
      "type": "enum",
      "required": true,
      "defaultValue": "text",
      "allowedValues": ["text", "bytes"],
      "uiHint": "segmentedChoice"
    }
  ],
  "capabilities": {
    "deterministic": true,
    "reversible": true,
    "previewSafe": true,
    "supportsLargeInputs": true,
    "supportsStreamingFuture": true,
    "mayProduceBinary": true,
    "requiresSecretParams": false,
    "educational": true
  },
  "stability": "stable",
  "backendKind": "inlineDart"
}
```
