import 'package:execution_protocol/execution_protocol.dart';

import 'learning_refs.dart';
import 'param_schema.dart';

const OperationManifest hexEncodeManifest = OperationManifest(
  id: 'core.text.hex.encode',
  version: '1.0.0',
  title: 'Hex Encode',
  shortDescription: 'Encodes text or bytes as hexadecimal text.',
  category: 'Encoding',
  tags: <String>['hex', 'encode', 'bytes', 'text'],
  inputKinds: <PayloadKind>[PayloadKind.text, PayloadKind.bytes],
  outputKinds: <PayloadKind>[PayloadKind.text],
  params: hexEncodeParams,
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
  learning: hexEncodeLearningRef,
);
