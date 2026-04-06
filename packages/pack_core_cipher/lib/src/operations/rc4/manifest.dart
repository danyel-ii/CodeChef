import 'package:execution_protocol/execution_protocol.dart';

import 'learning_refs.dart';
import 'param_schema.dart';

const OperationManifest rc4Manifest = OperationManifest(
  id: 'core.cipher.rc4',
  version: '1.0.0',
  title: 'RC4',
  shortDescription:
      'Educational RC4 stream-cipher transform for legacy analysis; not for new secure designs.',
  category: 'Cipher',
  tags: <String>['rc4', 'cipher', 'stream', 'legacy'],
  inputKinds: <PayloadKind>[PayloadKind.text],
  outputKinds: <PayloadKind>[PayloadKind.text],
  params: rc4Params,
  capabilities: CapabilitySet(
    deterministic: true,
    reversible: true,
    previewSafe: true,
    supportsLargeInputs: true,
    supportsStreamingFuture: true,
    mayProduceBinary: true,
    requiresSecretParams: true,
    educational: true,
  ),
  stability: Stability.stable,
  backendKind: BackendKind.inlineDart,
  learning: rc4LearningRef,
);
