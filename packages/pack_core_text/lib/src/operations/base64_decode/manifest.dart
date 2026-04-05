import 'package:execution_protocol/execution_protocol.dart';

import 'learning_refs.dart';
import 'param_schema.dart';

const OperationManifest base64DecodeManifest = OperationManifest(
  id: 'core.text.base64.decode',
  version: '1.0.0',
  title: 'Base64 Decode',
  shortDescription: 'Decodes Base64 text into bytes or text.',
  category: 'Encoding',
  tags: <String>['base64', 'decode', 'b64', 'encoding', 'text', 'bytes'],
  inputKinds: <PayloadKind>[PayloadKind.text],
  outputKinds: <PayloadKind>[PayloadKind.bytes, PayloadKind.text],
  params: base64DecodeParams,
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
  learning: base64DecodeLearningRef,
);
