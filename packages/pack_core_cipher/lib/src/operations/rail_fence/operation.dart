import 'package:execution_protocol/execution_protocol.dart';

import 'manifest.dart';

class RailFenceOperation implements Operation {
  const RailFenceOperation();

  @override
  OperationManifest get manifest => railFenceManifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    context.cancellationToken.throwIfCancelled();
    final int rails = (params['rails'] as int?) ?? 3;
    if (rails < 2) {
      throw StateError('invalidParams:Rail Fence requires at least 2 rails.');
    }
    final String mode = (params['mode'] as String?) ?? 'encode';
    final String output = mode == 'decode'
        ? _decode(input.asText(), rails)
        : _encode(input.asText(), rails);
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

  String _encode(String input, int rails) {
    if (input.length <= 2 || rails >= input.length) {
      return input;
    }
    final List<StringBuffer> fence =
        List<StringBuffer>.generate(rails, (_) => StringBuffer());
    int rail = 0;
    int direction = 1;
    for (final int rune in input.runes) {
      fence[rail].writeCharCode(rune);
      if (rail == 0) {
        direction = 1;
      } else if (rail == rails - 1) {
        direction = -1;
      }
      rail += direction;
    }
    return fence.map((StringBuffer buffer) => buffer.toString()).join();
  }

  String _decode(String input, int rails) {
    if (input.length <= 2 || rails >= input.length) {
      return input;
    }
    final List<int> runes = input.runes.toList(growable: false);
    final List<int> pattern = _railPattern(runes.length, rails);
    final List<int> counts = List<int>.filled(rails, 0);
    for (final int rail in pattern) {
      counts[rail]++;
    }

    final List<List<int>> slices = <List<int>>[];
    int offset = 0;
    for (final int count in counts) {
      slices.add(runes.sublist(offset, offset + count));
      offset += count;
    }

    final List<int> positions = List<int>.filled(rails, 0);
    final StringBuffer buffer = StringBuffer();
    for (final int rail in pattern) {
      buffer.writeCharCode(slices[rail][positions[rail]]);
      positions[rail]++;
    }
    return buffer.toString();
  }

  List<int> _railPattern(int length, int rails) {
    final List<int> pattern = <int>[];
    int rail = 0;
    int direction = 1;
    for (int index = 0; index < length; index++) {
      pattern.add(rail);
      if (rail == 0) {
        direction = 1;
      } else if (rail == rails - 1) {
        direction = -1;
      }
      rail += direction;
    }
    return pattern;
  }
}
