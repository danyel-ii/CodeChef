import 'package:execution_protocol/execution_protocol.dart';

import 'learning_refs.dart';
import 'param_schema.dart';

const OperationManifest urlEncodeManifest = OperationManifest(
  id: 'core.text.url.encode',
  version: '1.0.0',
  title: 'URL Encode',
  shortDescription: 'Percent-encodes text for URLs and query fragments.',
  category: 'Encoding',
  tags: <String>['url', 'encode', 'percent', 'query'],
  inputKinds: <PayloadKind>[PayloadKind.text],
  outputKinds: <PayloadKind>[PayloadKind.text],
  params: urlEncodeParams,
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
  learning: urlEncodeLearningRef,
);
