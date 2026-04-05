import 'package:execution_protocol/execution_protocol.dart';

import 'operations/aes/manifest.dart';
import 'operations/aes/operation.dart';
import 'operations/affine/manifest.dart';
import 'operations/affine/operation.dart';
import 'operations/atbash/manifest.dart';
import 'operations/atbash/operation.dart';
import 'operations/bacon/manifest.dart';
import 'operations/bacon/operation.dart';
import 'operations/caesar/manifest.dart';
import 'operations/caesar/operation.dart';
import 'operations/caesar_box/manifest.dart';
import 'operations/caesar_box/operation.dart';
import 'operations/des/manifest.dart';
import 'operations/des/operation.dart';
import 'operations/rail_fence/manifest.dart';
import 'operations/rail_fence/operation.dart';
import 'operations/rc4/manifest.dart';
import 'operations/rc4/operation.dart';
import 'operations/rot13/manifest.dart';
import 'operations/rot13/operation.dart';
import 'operations/rot47/manifest.dart';
import 'operations/rot47/operation.dart';
import 'operations/vigenere/manifest.dart';
import 'operations/vigenere/operation.dart';
import 'operations/xor/manifest.dart';
import 'operations/xor/operation.dart';
import 'operations/xor_bruteforce/manifest.dart';
import 'operations/xor_bruteforce/operation.dart';

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
          xorBruteForceManifest,
          rot13Manifest,
          rot47Manifest,
          caesarManifest,
          caesarBoxManifest,
          atbashManifest,
          railFenceManifest,
          affineManifest,
          baconManifest,
          vigenereManifest,
          rc4Manifest,
          aesManifest,
          desManifest,
        ],
        learningBundleRef: 'assets/learning/core_cipher.bundle.json',
        licenseNotices: const <LicenseRef>[],
        deprecations: const <PackDeprecation>[],
        searchKeywords: const <String>[
          'cipher',
          'xor',
          'rot47',
          'rot13',
          'caesar',
          'caesar box',
          'atbash',
          'rail fence',
          'affine',
          'bacon',
          'vigenere',
          'rc4',
          'aes',
          'des',
          'classical',
        ],
        maintainer: 'internal',
        signed: false,
      );

  @override
  List<Operation> get operations => const <Operation>[
        XorOperation(),
        XorBruteForceOperation(),
        Rot13Operation(),
        Rot47Operation(),
        CaesarOperation(),
        CaesarBoxOperation(),
        AtbashOperation(),
        RailFenceOperation(),
        AffineOperation(),
        BaconOperation(),
        VigenereOperation(),
        Rc4Operation(),
        AesOperation(),
        DesOperation(),
      ];
}
