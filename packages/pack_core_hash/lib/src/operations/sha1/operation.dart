import 'package:crypto/crypto.dart';
import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_hash/src/operations/shared/hash_operation_base.dart';

import 'manifest.dart';

class Sha1Operation extends HashOperationBase {
  const Sha1Operation();

  @override
  OperationManifest get manifest => sha1Manifest;

  @override
  String hash(List<int> bytes) => sha1.convert(bytes).toString();
}
