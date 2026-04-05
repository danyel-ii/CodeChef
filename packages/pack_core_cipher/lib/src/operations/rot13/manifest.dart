import 'package:execution_protocol/execution_protocol.dart';

import 'learning_refs.dart';

const OperationManifest rot13Manifest = OperationManifest(
  id: 'core.cipher.rot13',
  version: '1.0.0',
  title: 'ROT13',
  shortDescription: 'Rotates each alphabetic character by 13 positions.',
  category: 'Cipher',
  tags: <String>['rot13', 'caesar', 'cipher', 'classical'],
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
  learning: rot13LearningRef,
);
