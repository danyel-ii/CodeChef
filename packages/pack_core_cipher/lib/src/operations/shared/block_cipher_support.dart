import 'dart:typed_data';

import 'package:pointycastle/export.dart';

enum BlockCipherAlgorithm { aes }

Uint8List runCbcCipher({
  required BlockCipherAlgorithm algorithm,
  required bool encrypt,
  required Uint8List key,
  required Uint8List iv,
  required Uint8List input,
}) {
  final BlockCipher engine = switch (algorithm) {
    BlockCipherAlgorithm.aes => AESEngine(),
  };
  final PaddedBlockCipher cipher = PaddedBlockCipherImpl(
    PKCS7Padding(),
    CBCBlockCipher(engine),
  );
  cipher.init(
    encrypt,
    PaddedBlockCipherParameters<ParametersWithIV<KeyParameter>, Null>(
      ParametersWithIV<KeyParameter>(KeyParameter(key), iv),
      null,
    ),
  );
  return cipher.process(input);
}
