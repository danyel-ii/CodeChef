import 'package:execution_protocol/execution_protocol.dart';

import 'param_schema.dart';

const OperationManifest jsonPrettyManifest = OperationManifest(
  id: 'core.format.json.pretty',
  version: '1.0.0',
  title: 'JSON Pretty',
  shortDescription: 'Formats valid JSON with indentation.',
  category: 'Formatting',
  tags: <String>['json', 'pretty', 'format'],
  inputKinds: <PayloadKind>[PayloadKind.text],
  outputKinds: <PayloadKind>[PayloadKind.text],
  params: jsonPrettyParams,
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
    operationId: 'core.format.json.pretty',
  ),
);
