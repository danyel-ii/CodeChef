import 'package:execution_protocol/execution_protocol.dart';

const OperationManifest linesTrimManifest = OperationManifest(
  id: 'core.format.lines.trim',
  version: '1.0.0',
  title: 'Trim Lines',
  shortDescription: 'Trims leading and trailing whitespace from every line.',
  category: 'Formatting',
  tags: <String>['lines', 'trim', 'whitespace'],
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
    operationId: 'core.format.lines.trim',
  ),
);
