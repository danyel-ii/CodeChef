import 'package:execution_protocol/execution_protocol.dart';

import 'learning_refs.dart';
import 'param_schema.dart';

const OperationManifest aesManifest = OperationManifest(
  id: 'core.cipher.aes',
  version: '1.0.0',
  title: 'AES (CBC)',
  shortDescription: 'Encrypts or decrypts bytes with AES-CBC and PKCS7 padding.',
  category: 'Cipher',
  tags: <String>['aes', 'cipher', 'block', 'cbc', 'crypto'],
  inputKinds: <PayloadKind>[PayloadKind.text],
  outputKinds: <PayloadKind>[PayloadKind.text],
  params: aesParams,
  capabilities: CapabilitySet(
    deterministic: true,
    reversible: true,
    previewSafe: true,
    supportsLargeInputs: true,
    supportsStreamingFuture: false,
    mayProduceBinary: true,
    requiresSecretParams: true,
    educational: true,
  ),
  stability: Stability.stable,
  backendKind: BackendKind.inlineDart,
  learning: aesLearningRef,
);
