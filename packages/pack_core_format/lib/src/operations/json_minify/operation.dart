import 'dart:convert';

import 'package:execution_protocol/execution_protocol.dart';

import 'manifest.dart';

class JsonMinifyOperation implements Operation {
  const JsonMinifyOperation();

  @override
  OperationManifest get manifest => jsonMinifyManifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    context.cancellationToken.throwIfCancelled();
    final bool sortKeys = (params['sortKeys'] as bool?) ?? false;
    final dynamic decoded = jsonDecode(input.asText());
    final dynamic normalized = sortKeys ? _sortJson(decoded) : decoded;
    final String output = jsonEncode(normalized);
    return StepExecutionResult(
      output: PayloadEnvelope(
        kind: PayloadKind.text,
        sizeBytes: output.length,
        data: output,
        mediaType: 'application/json',
        characterEncoding: 'utf-8',
      ),
      metrics: StepMetrics(
        elapsedMs: 0,
        inputBytes: input.sizeBytes,
        outputBytes: output.length,
      ),
    );
  }

  dynamic _sortJson(dynamic value) {
    if (value is Map<String, Object?>) {
      final entries = value.entries.toList()..sort((a, b) => a.key.compareTo(b.key));
      return <String, Object?>{
        for (final entry in entries) entry.key: _sortJson(entry.value),
      };
    }
    if (value is List<Object?>) {
      return value.map<dynamic>(_sortJson).toList(growable: false);
    }
    return value;
  }
}
