import 'package:execution_protocol/execution_protocol.dart';

const OperationManifest md5Manifest = OperationManifest(
  id: 'core.hash.md5',
  version: '1.0.0',
  title: 'MD5',
  shortDescription: 'Computes the MD5 digest of text or bytes.',
  category: 'Hashing',
  tags: <String>['hash', 'md5', 'digest', 'checksum'],
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
  learning: LearningContentRef(bundleId: 'core.hash', operationId: 'core.hash.md5'),
);
