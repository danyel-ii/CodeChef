import 'package:execution_protocol/execution_protocol.dart';

const OperationManifest jsonValidateManifest = OperationManifest(
  id: 'core.format.json.validate',
  version: '1.0.0',
  title: 'JSON Validate',
  shortDescription: 'Validates JSON and passes it through unchanged if valid.',
  category: 'Formatting',
  tags: <String>['json', 'validate', 'check'],
  inputKinds: <PayloadKind>[PayloadKind.text],
  outputKinds: <PayloadKind>[PayloadKind.text],
  params: <ParamFieldSpec>[],
  capabilities: CapabilitySet(
    deterministic: true,
    reversible: true,
    previewSafe: true,
    supportsLargeInputs: true,
    supportsStreamingFuture: false,
    mayProduceBinary: false,
    requiresSecretParams: false,
    educational: true,
  ),
  stability: Stability.stable,
  backendKind: BackendKind.inlineDart,
  learning: LearningContentRef(
    bundleId: 'core.format',
    operationId: 'core.format.json.validate',
  ),
);
