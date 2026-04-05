import 'package:execution_protocol/execution_protocol.dart';

import 'learning_refs.dart';
import 'param_schema.dart';

const OperationManifest vigenereManifest = OperationManifest(
  id: 'core.cipher.vigenere',
  version: '1.0.0',
  title: 'Vigenere Cipher',
  shortDescription: 'Applies a repeating alphabetic key across the input text.',
  category: 'Cipher',
  tags: <String>['vigenere', 'cipher', 'classical', 'polyalphabetic'],
  inputKinds: <PayloadKind>[PayloadKind.text],
  outputKinds: <PayloadKind>[PayloadKind.text],
  params: vigenereParams,
  capabilities: CapabilitySet(
    deterministic: true,
    reversible: true,
    previewSafe: true,
    supportsLargeInputs: true,
    supportsStreamingFuture: true,
    mayProduceBinary: false,
    requiresSecretParams: true,
    educational: true,
  ),
  stability: Stability.stable,
  backendKind: BackendKind.inlineDart,
  learning: vigenereLearningRef,
);
