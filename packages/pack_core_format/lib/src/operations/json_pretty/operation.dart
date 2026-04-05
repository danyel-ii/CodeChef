import 'dart:convert';

import 'package:execution_protocol/execution_protocol.dart';

import 'manifest.dart';

class JsonPrettyOperation implements Operation {
  const JsonPrettyOperation();

  @override
  OperationManifest get manifest => jsonPrettyManifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    context.cancellationToken.throwIfCancelled();
    final int indent = (params['indent'] as int?) ?? 2;
    final bool sortKeys = (params['sortKeys'] as bool?) ?? false;
    final dynamic decoded = jsonDecode(input.asText());
    final dynamic normalized = sortKeys ? _sortJson(decoded) : decoded;
    final String pretty = const JsonEncoder.withIndent('  ').convert(normalized);
    final String output = indent == 2 ? pretty : _replaceIndent(pretty, indent);
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

  String _replaceIndent(String pretty, int indent) {
    if (indent <= 0) {
      return pretty.replaceAll(RegExp(r'^ +', multiLine: true), '');
    }
    return pretty.replaceAllMapped(
      RegExp(r'^( +)', multiLine: true),
      (match) => ' ' * ((match.group(1)!.length ~/ 2) * indent),
    );
  }
}
