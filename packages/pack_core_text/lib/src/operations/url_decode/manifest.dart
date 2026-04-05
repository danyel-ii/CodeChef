import 'package:execution_protocol/execution_protocol.dart';

import 'learning_refs.dart';
import 'param_schema.dart';

const OperationManifest urlDecodeManifest = OperationManifest(
  id: 'core.text.url.decode',
  version: '1.0.0',
  title: 'URL Decode',
  shortDescription: 'Decodes percent-encoded URL text.',
  category: 'Encoding',
  tags: <String>['url', 'decode', 'percent', 'query'],
  inputKinds: <PayloadKind>[PayloadKind.text],
  outputKinds: <PayloadKind>[PayloadKind.text],
  params: urlDecodeParams,
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
  learning: urlDecodeLearningRef,
);
