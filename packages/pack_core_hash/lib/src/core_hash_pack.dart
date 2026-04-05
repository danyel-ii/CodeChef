import 'package:execution_protocol/execution_protocol.dart';

import 'operations/crc32/manifest.dart';
import 'operations/crc32/operation.dart';
import 'operations/md5/manifest.dart';
import 'operations/md5/operation.dart';
import 'operations/sha1/manifest.dart';
import 'operations/sha1/operation.dart';
import 'operations/sha256/manifest.dart';
import 'operations/sha256/operation.dart';

class CoreHashPack implements OperationPack {
  const CoreHashPack();

  @override
  PackManifest get manifest => PackManifest(
        packId: 'core.hash',
        version: '1.0.0',
        title: 'Core Hash Pack',
        description: 'Common hashing and checksum transforms.',
        stability: Stability.stable,
        minProtocolVersion: kProtocolVersion,
        dependencies: const <PackDependency>[],
        operations: const <OperationManifest>[
          md5Manifest,
          sha1Manifest,
          sha256Manifest,
          crc32Manifest,
        ],
        learningBundleRef: 'assets/learning/core_hash.bundle.json',
        licenseNotices: const <LicenseRef>[],
        deprecations: const <PackDeprecation>[],
        searchKeywords: const <String>['hash', 'md5', 'sha1', 'sha256', 'crc32'],
        maintainer: 'internal',
        signed: false,
      );

  @override
  List<Operation> get operations => const <Operation>[
        Md5Operation(),
        Sha1Operation(),
        Sha256Operation(),
        Crc32Operation(),
      ];
}
