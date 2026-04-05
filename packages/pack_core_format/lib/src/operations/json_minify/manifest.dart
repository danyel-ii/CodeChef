import 'package:execution_protocol/execution_protocol.dart';

import 'param_schema.dart';

const OperationManifest jsonMinifyManifest = OperationManifest(
  id: 'core.format.json.minify',
  version: '1.0.0',
  title: 'JSON Minify',
  shortDescription: 'Compacts valid JSON into a single line.',
  category: 'Formatting',
  tags: <String>['json', 'minify', 'format'],
  inputKinds: <PayloadKind>[PayloadKind.text],
  outputKinds: <PayloadKind>[PayloadKind.text],
  params: jsonMinifyParams,
  capabilities: CapabilitySet(
    deterministic: true,
    reversible: false,
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
    operationId: 'core.format.json.minify',
  ),
);
