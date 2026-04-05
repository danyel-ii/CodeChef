import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_hash/src/operations/shared/hash_operation_base.dart';

import 'manifest.dart';

class Crc32Operation extends HashOperationBase {
  const Crc32Operation();

  @override
  OperationManifest get manifest => crc32Manifest;

  @override
  String hash(List<int> bytes) {
    int crc = 0xffffffff;
    for (final int byte in bytes) {
      crc ^= byte;
      for (int i = 0; i < 8; i++) {
        final bool bit = (crc & 1) == 1;
        crc = crc >> 1;
        if (bit) {
          crc ^= 0xedb88320;
        }
      }
    }
    final int value = (crc ^ 0xffffffff) & 0xffffffff;
    return value.toRadixString(16).padLeft(8, '0');
  }
}
