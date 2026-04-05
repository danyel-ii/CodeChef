import 'package:execution_protocol/execution_protocol.dart';

import 'learning_refs.dart';

const OperationManifest atbashManifest = OperationManifest(
  id: 'core.cipher.atbash',
  version: '1.0.0',
  title: 'Atbash',
  shortDescription: 'Mirrors each letter across the alphabet so A becomes Z and B becomes Y.',
  category: 'Cipher',
  tags: <String>['atbash', 'cipher', 'classical', 'monoalphabetic'],
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
  learning: atbashLearningRef,
);
