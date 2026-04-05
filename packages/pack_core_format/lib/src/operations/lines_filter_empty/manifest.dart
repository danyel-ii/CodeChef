import 'package:execution_protocol/execution_protocol.dart';

const OperationManifest linesFilterEmptyManifest = OperationManifest(
  id: 'core.format.lines.filter_empty',
  version: '1.0.0',
  title: 'Filter Empty Lines',
  shortDescription: 'Removes empty and whitespace-only lines.',
  category: 'Formatting',
  tags: <String>['lines', 'filter', 'empty'],
  inputKinds: <PayloadKind>[PayloadKind.text],
  outputKinds: <PayloadKind>[PayloadKind.text],
  params: <ParamFieldSpec>[],
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
    operationId: 'core.format.lines.filter_empty',
  ),
);
