import 'package:execution_protocol/execution_protocol.dart';

import 'learning_refs.dart';
import 'param_schema.dart';

const OperationManifest xorBruteForceManifest = OperationManifest(
  id: 'core.cipher.xor_bruteforce',
  version: '1.0.0',
  title: 'XOR Brute Force',
  shortDescription: 'Tests a single-byte XOR key range and ranks likely plaintext candidates.',
  category: 'Cipher',
  tags: <String>['xor', 'bruteforce', 'cipher', 'ctf'],
  inputKinds: <PayloadKind>[PayloadKind.text],
  outputKinds: <PayloadKind>[PayloadKind.text],
  params: xorBruteForceParams,
  capabilities: CapabilitySet(
    deterministic: true,
    reversible: false,
    previewSafe: true,
    supportsLargeInputs: false,
    supportsStreamingFuture: false,
    mayProduceBinary: false,
    requiresSecretParams: false,
    educational: true,
  ),
  stability: Stability.stable,
  backendKind: BackendKind.inlineDart,
  learning: xorBruteForceLearningRef,
);
