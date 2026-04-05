# Operation Module Template

Use this document when adding a new algorithm or transform.

## 1. Folder template

Example for `core.text.base64.decode`:

```text
packages/pack_core_text/
  lib/
    pack_core_text.dart
    src/
      operations/
        base64_decode/
          manifest.dart
          operation.dart
          param_schema.dart
          learning_refs.dart
  assets/
    learning/
      base64_decode/
        what_it_does.md
        when_to_use.md
        gotchas.md
        examples.json
  test/
    operations/
      base64_decode_test.dart
      base64_decode_examples_test.dart
      base64_decode_preview_test.dart
```

## 2. Checklist

Before coding, answer:

- What is the stable operation id?
- What input kinds does it accept?
- What output kinds can it produce?
- Is it deterministic?
- Is it reversible?
- Is it preview-safe?
- Does it need secrets?
- What are the common user mistakes?
- What are the canonical example vectors?
- Does it replace or deprecate an older op?

## 3. Manifest template

```dart
final base64DecodeManifest = OperationManifest(
  id: 'core.text.base64.decode',
  version: '1.0.0',
  title: 'Base64 Decode',
  shortDescription: 'Decodes Base64 text into bytes or text.',
  category: 'Encoding',
  tags: ['base64', 'decode', 'encoding', 'text', 'bytes'],
  inputKinds: [PayloadKind.text],
  outputKinds: [PayloadKind.bytes, PayloadKind.text],
  params: base64DecodeParams,
  capabilities: CapabilitySet(
    deterministic: true,
    reversible: true,
    previewSafe: true,
    supportsLargeInputs: true,
    supportsStreamingFuture: true,
    mayProduceBinary: true,
    requiresSecretParams: false,
    educational: true,
  ),
  stability: Stability.stable,
  backendKind: BackendKind.inlineDart,
  learning: LearningContentRef(
    bundleId: 'core.text',
    operationId: 'core.text.base64.decode',
  ),
);
```

## 4. Param schema template

```dart
final base64DecodeParams = <ParamFieldSpec>[
  ParamFieldSpec(
    id: 'treatOutputAs',
    label: 'Treat output as',
    description: 'Choose whether the decoded bytes should be shown as text or kept as bytes.',
    type: ParamType.enumType,
    required: true,
    defaultValue: 'text',
    allowedValues: ['text', 'bytes'],
    example: 'text',
    validation: ValidationRuleSet.none(),
    uiHint: UiHint.segmentedChoice,
    secret: false,
  ),
];
```

## 5. Operation implementation template

```dart
class Base64DecodeOperation implements Operation {
  @override
  OperationManifest get manifest => base64DecodeManifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    // 1. Validate payload kind
    // 2. Validate params
    // 3. Perform transform
    // 4. Build diagnostics if needed
    // 5. Return normalized output
    throw UnimplementedError();
  }
}
```

## 6. Learning content template

Each operation should ship:

### `what_it_does.md`
- plain-language explanation
- mental model
- what changes between input and output

### `when_to_use.md`
- common use cases
- common false positives
- related operations

### `gotchas.md`
- encoding pitfalls
- invalid inputs
- security caveats
- large-output warnings

### `examples.json`
At least one runnable example:

```json
[
  {
    "title": "Decode simple text",
    "input": "SGVsbG8=",
    "params": { "treatOutputAs": "text" },
    "expectedOutputText": "Hello"
  }
]
```

## 7. Test requirements

Minimum tests:
- valid nominal input
- invalid input
- preview mode behavior
- example vectors
- output kind correctness
- large-input guard if relevant

## 8. Definition of done

An operation is ready only when:
- manifest is registered
- schema is generated/renderable
- tests pass
- learning content exists
- examples run
- search metadata is good
- docs note reversibility and safety
- provenance is recorded if code was adapted from elsewhere

## 9. Anti-patterns

Avoid:
- parsing params dynamically everywhere
- UI-specific logic inside the operation
- hidden coercions without diagnostics
- unclear ids like `decodeBase64`
- shipping operations without examples

## 10. Example acceptance criteria

For `core.text.base64.decode`:
- given valid Base64 text, output decodes correctly
- invalid Base64 surfaces a structured `invalidInput` error
- preview mode can still decode safely
- output can be rendered as text or bytes
- operation appears in search for “base64”, “decode”, and “b64”
