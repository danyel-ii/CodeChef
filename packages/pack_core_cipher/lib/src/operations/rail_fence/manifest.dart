import 'package:execution_protocol/execution_protocol.dart';

import 'learning_refs.dart';
import 'param_schema.dart';

const OperationManifest railFenceManifest = OperationManifest(
  id: 'core.cipher.rail_fence',
  version: '1.0.0',
  title: 'Rail Fence Cipher',
  shortDescription: 'Writes text in a zig-zag across rails and then reads row by row.',
  category: 'Cipher',
  tags: <String>['rail fence', 'cipher', 'transposition', 'classical'],
  inputKinds: <PayloadKind>[PayloadKind.text],
  outputKinds: <PayloadKind>[PayloadKind.text],
  params: railFenceParams,
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
  learning: railFenceLearningRef,
);
