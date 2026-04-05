import 'package:execution_protocol/execution_protocol.dart';

import 'learning_refs.dart';
import 'param_schema.dart';

const OperationManifest baconManifest = OperationManifest(
  id: 'core.cipher.bacon',
  version: '1.0.0',
  title: 'Bacon Cipher',
  shortDescription: 'Maps each letter to a five-character A/B pattern.',
  category: 'Cipher',
  tags: <String>['bacon', 'cipher', 'classical', 'steganography'],
  inputKinds: <PayloadKind>[PayloadKind.text],
  outputKinds: <PayloadKind>[PayloadKind.text],
  params: baconParams,
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
  learning: baconLearningRef,
);
