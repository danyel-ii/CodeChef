import 'package:execution_protocol/execution_protocol.dart';

const OperationManifest crc32Manifest = OperationManifest(
  id: 'core.hash.crc32',
  version: '1.0.0',
  title: 'CRC32',
  shortDescription: 'Computes a CRC32 checksum of text or bytes.',
  category: 'Hashing',
  tags: <String>['hash', 'crc32', 'checksum'],
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
  learning: LearningContentRef(bundleId: 'core.hash', operationId: 'core.hash.crc32'),
);
