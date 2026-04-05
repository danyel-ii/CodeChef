import 'package:execution_protocol/execution_protocol.dart';

import 'learning_refs.dart';
import 'param_schema.dart';

const OperationManifest caesarManifest = OperationManifest(
  id: 'core.cipher.caesar',
  version: '1.0.0',
  title: 'Caesar Cipher',
  shortDescription: 'Shifts alphabetic characters by a configurable amount.',
  category: 'Cipher',
  tags: <String>['caesar', 'rot', 'cipher', 'classical'],
  inputKinds: <PayloadKind>[PayloadKind.text],
  outputKinds: <PayloadKind>[PayloadKind.text],
  params: caesarParams,
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
  learning: caesarLearningRef,
);
