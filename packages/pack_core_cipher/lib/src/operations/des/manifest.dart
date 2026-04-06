import 'package:execution_protocol/execution_protocol.dart';

import 'learning_refs.dart';
import 'param_schema.dart';

const OperationManifest desManifest = OperationManifest(
  id: 'core.cipher.des',
  version: '1.0.0',
  title: 'DES',
  shortDescription:
      'Educational legacy DES transform with PKCS7 padding; not suitable for modern protection.',
  category: 'Cipher',
  tags: <String>['des', 'cipher', 'block', 'legacy', 'ecb'],
  inputKinds: <PayloadKind>[PayloadKind.text],
  outputKinds: <PayloadKind>[PayloadKind.text],
  params: desParams,
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
  learning: desLearningRef,
);
