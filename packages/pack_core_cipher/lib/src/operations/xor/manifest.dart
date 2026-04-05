import 'package:execution_protocol/execution_protocol.dart';

import 'learning_refs.dart';
import 'param_schema.dart';

const OperationManifest xorManifest = OperationManifest(
  id: 'core.cipher.xor',
  version: '1.0.0',
  title: 'XOR',
  shortDescription: 'Applies repeating-key XOR to the input.',
  category: 'Cipher',
  tags: <String>['xor', 'cipher', 'repeating-key', 'binary'],
  inputKinds: <PayloadKind>[PayloadKind.text],
  outputKinds: <PayloadKind>[PayloadKind.text],
  params: xorParams,
  capabilities: CapabilitySet(
    deterministic: true,
    reversible: true,
    previewSafe: true,
    supportsLargeInputs: true,
    supportsStreamingFuture: true,
    mayProduceBinary: true,
    requiresSecretParams: false,
    educational: true,
  ),
  stability: Stability.stable,
  backendKind: BackendKind.inlineDart,
  learning: xorLearningRef,
);
