import 'package:execution_protocol/execution_protocol.dart';

import 'learning_refs.dart';
import 'param_schema.dart';

const OperationManifest base64EncodeManifest = OperationManifest(
  id: 'core.text.base64.encode',
  version: '1.0.0',
  title: 'Base64 Encode',
  shortDescription: 'Encodes text or bytes as Base64.',
  category: 'Encoding',
  tags: <String>['base64', 'encode', 'b64', 'text', 'bytes'],
  inputKinds: <PayloadKind>[PayloadKind.text, PayloadKind.bytes],
  outputKinds: <PayloadKind>[PayloadKind.text],
  params: base64EncodeParams,
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
  learning: base64EncodeLearningRef,
);
