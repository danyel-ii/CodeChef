import 'package:execution_protocol/execution_protocol.dart';

import 'operations/base64_decode/manifest.dart';
import 'operations/base64_decode/operation.dart';
import 'operations/base64_encode/manifest.dart';
import 'operations/base64_encode/operation.dart';
import 'operations/hex_decode/manifest.dart';
import 'operations/hex_decode/operation.dart';
import 'operations/hex_encode/manifest.dart';
import 'operations/hex_encode/operation.dart';
import 'operations/url_decode/manifest.dart';
import 'operations/url_decode/operation.dart';
import 'operations/url_encode/manifest.dart';
import 'operations/url_encode/operation.dart';

class CoreTextPack implements OperationPack {
  const CoreTextPack();

  @override
  PackManifest get manifest => PackManifest(
        packId: 'core.text',
        version: '1.0.0',
        title: 'Core Text Pack',
        description: 'Common text and encoding transforms.',
        stability: Stability.stable,
        minProtocolVersion: kProtocolVersion,
        dependencies: const <PackDependency>[],
        operations: const <OperationManifest>[
          base64EncodeManifest,
          base64DecodeManifest,
          hexEncodeManifest,
          hexDecodeManifest,
          urlEncodeManifest,
          urlDecodeManifest,
        ],
        learningBundleRef: 'assets/learning/core_text.bundle.json',
        licenseNotices: const <LicenseRef>[],
        deprecations: const <PackDeprecation>[],
        searchKeywords: const <String>[
          'encoding',
          'text',
          'base64',
          'hex',
          'url',
        ],
        maintainer: 'internal',
        signed: false,
      );

  @override
  List<Operation> get operations => const <Operation>[
        Base64EncodeOperation(),
        Base64DecodeOperation(),
        HexEncodeOperation(),
        HexDecodeOperation(),
        UrlEncodeOperation(),
        UrlDecodeOperation(),
      ];
}
