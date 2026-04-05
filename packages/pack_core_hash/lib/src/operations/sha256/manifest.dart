import 'package:execution_protocol/execution_protocol.dart';

const OperationManifest sha256Manifest = OperationManifest(
  id: 'core.hash.sha256',
  version: '1.0.0',
  title: 'SHA-256',
  shortDescription: 'Computes the SHA-256 digest of text or bytes.',
  category: 'Hashing',
  tags: <String>['hash', 'sha256', 'digest'],
  inputKinds: <PayloadKind>[PayloadKind.text, PayloadKind.bytes],
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
  learning: LearningContentRef(bundleId: 'core.hash', operationId: 'core.hash.sha256'),
);
