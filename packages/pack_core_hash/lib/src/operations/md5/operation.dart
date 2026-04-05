import 'package:crypto/crypto.dart';
import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_hash/src/operations/shared/hash_operation_base.dart';

import 'manifest.dart';

class Md5Operation extends HashOperationBase {
  const Md5Operation();

  @override
  OperationManifest get manifest => md5Manifest;

  @override
  String hash(List<int> bytes) => md5.convert(bytes).toString();
}
