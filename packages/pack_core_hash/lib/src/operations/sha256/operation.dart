import 'package:crypto/crypto.dart';
import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_hash/src/operations/shared/hash_operation_base.dart';

import 'manifest.dart';

class Sha256Operation extends HashOperationBase {
  const Sha256Operation();

  @override
  OperationManifest get manifest => sha256Manifest;

  @override
  String hash(List<int> bytes) => sha256.convert(bytes).toString();
}
