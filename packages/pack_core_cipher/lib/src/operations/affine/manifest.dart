import 'package:execution_protocol/execution_protocol.dart';

import 'learning_refs.dart';
import 'param_schema.dart';

const OperationManifest affineManifest = OperationManifest(
  id: 'core.cipher.affine',
  version: '1.0.0',
  title: 'Affine Cipher',
  shortDescription: 'Applies the affine formula a*x+b modulo 26 to each letter.',
  category: 'Cipher',
  tags: <String>['affine', 'cipher', 'classical', 'substitution'],
  inputKinds: <PayloadKind>[PayloadKind.text],
  outputKinds: <PayloadKind>[PayloadKind.text],
  params: affineParams,
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
  learning: affineLearningRef,
);
