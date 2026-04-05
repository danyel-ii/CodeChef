import 'package:execution_protocol/execution_protocol.dart';

import 'param_schema.dart';

const OperationManifest linesJoinManifest = OperationManifest(
  id: 'core.format.lines.join',
  version: '1.0.0',
  title: 'Join Lines',
  shortDescription: 'Joins lines together with a chosen separator.',
  category: 'Formatting',
  tags: <String>['lines', 'join', 'separator'],
  inputKinds: <PayloadKind>[PayloadKind.text],
  outputKinds: <PayloadKind>[PayloadKind.text],
  params: linesJoinParams,
  capabilities: CapabilitySet(
    deterministic: true,
    reversible: false,
    previewSafe: true,
    supportsLargeInputs: true,
    supportsStreamingFuture: true,
    mayProduceBinary: false,
    requiresSecretParams: false,
    educational: true,
  ),
  stability: Stability.stable,
  backendKind: BackendKind.inlineDart,
  learning: LearningContentRef(
    bundleId: 'core.format',
    operationId: 'core.format.lines.join',
  ),
);
