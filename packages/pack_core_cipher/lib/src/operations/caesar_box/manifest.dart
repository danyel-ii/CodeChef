import 'package:execution_protocol/execution_protocol.dart';

import 'learning_refs.dart';
import 'param_schema.dart';

const OperationManifest caesarBoxManifest = OperationManifest(
  id: 'core.cipher.caesar_box',
  version: '1.0.0',
  title: 'Caesar Box Cipher',
  shortDescription: 'Reorders text by writing it into a fixed-width box and reading it out by columns.',
  category: 'Cipher',
  tags: <String>['caesar box', 'cipher', 'transposition', 'classical'],
  inputKinds: <PayloadKind>[PayloadKind.text],
  outputKinds: <PayloadKind>[PayloadKind.text],
  params: caesarBoxParams,
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
  learning: caesarBoxLearningRef,
);
