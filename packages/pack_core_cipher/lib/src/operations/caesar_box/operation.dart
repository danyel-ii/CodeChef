import 'package:execution_protocol/execution_protocol.dart';

import 'manifest.dart';

class CaesarBoxOperation implements Operation {
  const CaesarBoxOperation();

  @override
  OperationManifest get manifest => caesarBoxManifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    context.cancellationToken.throwIfCancelled();
    final int columns = (params['columns'] as int?) ?? 5;
    if (columns < 2) {
      throw StateError('invalidParams:Caesar Box requires at least 2 columns.');
    }
    final String mode = (params['mode'] as String?) ?? 'encode';
    final String output = mode == 'decode'
        ? _decode(input.asText(), columns)
        : _encode(input.asText(), columns);
    return StepExecutionResult(
      output: PayloadEnvelope(
        kind: PayloadKind.text,
        sizeBytes: output.length,
        data: output,
        mediaType: 'text/plain',
        characterEncoding: 'utf-8',
      ),
      metrics: StepMetrics(
        elapsedMs: 0,
        inputBytes: input.sizeBytes,
        outputBytes: output.length,
      ),
    );
  }

  String _encode(String input, int columns) {
    if (input.isEmpty || columns >= input.length) {
      return input;
    }
    final int rows = (input.length + columns - 1) ~/ columns;
    final StringBuffer buffer = StringBuffer();
    for (int column = 0; column < columns; column++) {
      for (int row = 0; row < rows; row++) {
        final int index = row * columns + column;
        if (index < input.length) {
          buffer.write(input[index]);
        }
      }
    }
    return buffer.toString();
  }

  String _decode(String input, int columns) {
    if (input.isEmpty || columns >= input.length) {
      return input;
    }
    final int rows = (input.length + columns - 1) ~/ columns;
    final int shortColumns = (rows * columns) - input.length;
    final List<StringBuffer> columnBuffers =
        List<StringBuffer>.generate(columns, (_) => StringBuffer());
    int offset = 0;
    for (int column = 0; column < columns; column++) {
      final int columnLength = column >= columns - shortColumns ? rows - 1 : rows;
      columnBuffers[column].write(input.substring(offset, offset + columnLength));
      offset += columnLength;
    }

    final List<int> positions = List<int>.filled(columns, 0);
    final StringBuffer buffer = StringBuffer();
    for (int row = 0; row < rows; row++) {
      for (int column = 0; column < columns; column++) {
        if (positions[column] < columnBuffers[column].length) {
          buffer.write(columnBuffers[column].toString()[positions[column]]);
          positions[column]++;
        }
      }
    }
    return buffer.toString();
  }
}
