import 'package:execution_protocol/execution_protocol.dart';

import 'learning_refs.dart';
import 'param_schema.dart';

const OperationManifest hexDecodeManifest = OperationManifest(
  id: 'core.text.hex.decode',
  version: '1.0.0',
  title: 'Hex Decode',
  shortDescription: 'Decodes hexadecimal text into bytes or text.',
  category: 'Encoding',
  tags: <String>['hex', 'decode', 'bytes', 'text'],
  inputKinds: <PayloadKind>[PayloadKind.text],
  outputKinds: <PayloadKind>[PayloadKind.bytes, PayloadKind.text],
  params: hexDecodeParams,
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
  learning: hexDecodeLearningRef,
);
