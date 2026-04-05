import 'package:execution_protocol/execution_protocol.dart';

import 'learning_refs.dart';

const OperationManifest rot47Manifest = OperationManifest(
  id: 'core.cipher.rot47',
  version: '1.0.0',
  title: 'ROT47',
  shortDescription: 'Rotates printable ASCII characters by 47 positions.',
  category: 'Cipher',
  tags: <String>['rot47', 'cipher', 'ascii', 'classical'],
  inputKinds: <PayloadKind>[PayloadKind.text],
  outputKinds: <PayloadKind>[PayloadKind.text],
  params: <ParamFieldSpec>[],
  capabilities: CapabilitySet(
    deterministic: true,
    reversible: true,
    previewSafe: true,
    supportsLargeInputs: true,
    supportsStreamingFuture: true,
    mayProduceBinary: false,
    requiresSecretParams: false,
    educational: true,
  ),
  stability: Stability.stable,
  backendKind: BackendKind.inlineDart,
  learning: rot47LearningRef,
);
