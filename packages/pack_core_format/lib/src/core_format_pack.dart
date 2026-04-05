import 'package:execution_protocol/execution_protocol.dart';

import 'operations/json_minify/manifest.dart';
import 'operations/json_minify/operation.dart';
import 'operations/json_pretty/manifest.dart';
import 'operations/json_pretty/operation.dart';
import 'operations/json_validate/manifest.dart';
import 'operations/json_validate/operation.dart';
import 'operations/lines_filter_empty/manifest.dart';
import 'operations/lines_filter_empty/operation.dart';
import 'operations/lines_join/manifest.dart';
import 'operations/lines_join/operation.dart';
import 'operations/lines_trim/manifest.dart';
import 'operations/lines_trim/operation.dart';

class CoreFormatPack implements OperationPack {
  const CoreFormatPack();

  @override
  PackManifest get manifest => PackManifest(
        packId: 'core.format',
        version: '1.0.0',
        title: 'Core Format Pack',
        description: 'JSON and line-oriented formatting tools.',
        stability: Stability.stable,
        minProtocolVersion: kProtocolVersion,
        dependencies: const <PackDependency>[],
        operations: const <OperationManifest>[
          jsonPrettyManifest,
          jsonMinifyManifest,
          jsonValidateManifest,
          linesTrimManifest,
          linesFilterEmptyManifest,
          linesJoinManifest,
        ],
        learningBundleRef: 'assets/learning/core_format.bundle.json',
        licenseNotices: const <LicenseRef>[],
        deprecations: const <PackDeprecation>[],
        searchKeywords: const <String>[
          'json',
          'format',
          'pretty',
          'minify',
          'lines',
          'trim',
          'join',
        ],
        maintainer: 'internal',
        signed: false,
      );

  @override
  List<Operation> get operations => const <Operation>[
        JsonPrettyOperation(),
        JsonMinifyOperation(),
        JsonValidateOperation(),
        LinesTrimOperation(),
        LinesFilterEmptyOperation(),
        LinesJoinOperation(),
      ];
}
