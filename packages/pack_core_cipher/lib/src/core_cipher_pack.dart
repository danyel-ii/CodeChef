import 'package:execution_protocol/execution_protocol.dart';

import 'operations/caesar/manifest.dart';
import 'operations/caesar/operation.dart';
import 'operations/rot13/manifest.dart';
import 'operations/rot13/operation.dart';
import 'operations/vigenere/manifest.dart';
import 'operations/vigenere/operation.dart';
import 'operations/xor/manifest.dart';
import 'operations/xor/operation.dart';

class CoreCipherPack implements OperationPack {
  const CoreCipherPack();

  @override
  PackManifest get manifest => PackManifest(
        packId: 'core.cipher',
        version: '1.0.0',
        title: 'Core Cipher Pack',
        description: 'Foundational educational cipher transforms.',
        stability: Stability.stable,
        minProtocolVersion: kProtocolVersion,
        dependencies: const <PackDependency>[],
        operations: const <OperationManifest>[
          xorManifest,
          rot13Manifest,
          caesarManifest,
          vigenereManifest,
        ],
        learningBundleRef: 'assets/learning/core_cipher.bundle.json',
        licenseNotices: const <LicenseRef>[],
        deprecations: const <PackDeprecation>[],
        searchKeywords: const <String>[
          'cipher',
          'xor',
          'rot13',
          'caesar',
          'vigenere',
          'classical',
        ],
        maintainer: 'internal',
        signed: false,
      );

  @override
  List<Operation> get operations => const <Operation>[
        XorOperation(),
        Rot13Operation(),
        CaesarOperation(),
        VigenereOperation(),
      ];
}
