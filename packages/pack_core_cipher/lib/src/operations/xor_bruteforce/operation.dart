import 'dart:typed_data';

import 'package:execution_protocol/execution_protocol.dart';

import '../shared/byte_format_codec.dart';
import 'manifest.dart';

class XorBruteForceOperation implements Operation {
  const XorBruteForceOperation();

  @override
  OperationManifest get manifest => xorBruteForceManifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    context.cancellationToken.throwIfCancelled();
    final String inputFormat = (params['inputFormat'] as String?) ?? 'hex';
    final int candidateCount = (params['candidateCount'] as int?) ?? 5;
    final int keyStart = (params['keyStart'] as int?) ?? 0;
    final int keyEnd = (params['keyEnd'] as int?) ?? 255;
    if (keyStart < 0 || keyEnd > 255 || keyStart > keyEnd) {
      throw StateError('invalidParams:XOR brute force key range must stay within 0-255.');
    }

    final Uint8List inputBytes = decodeByteFormat(
      input.asText(),
      inputFormat,
      fieldLabel: 'Input',
    );
    final List<_Candidate> candidates = <_Candidate>[];
    for (int key = keyStart; key <= keyEnd; key++) {
      final Uint8List output = Uint8List(inputBytes.length);
      for (int index = 0; index < inputBytes.length; index++) {
        output[index] = inputBytes[index] ^ key;
      }
      final String text = String.fromCharCodes(output);
      candidates.add(_Candidate(key: key, text: text, score: _score(text)));
    }
    candidates.sort((_Candidate left, _Candidate right) => right.score.compareTo(left.score));
    final List<_Candidate> selected = candidates.take(candidateCount).toList(growable: false);
    final String rendered = selected
        .map(
          (_Candidate candidate) =>
              '0x${candidate.key.toRadixString(16).padLeft(2, '0').toUpperCase()}'
              ' | score=${candidate.score.toStringAsFixed(2)}'
              ' | ${candidate.text.replaceAll('\n', r'\n')}',
        )
        .join('\n');

    return StepExecutionResult(
      output: PayloadEnvelope(
        kind: PayloadKind.text,
        sizeBytes: rendered.length,
        data: rendered,
        mediaType: 'text/plain',
        characterEncoding: 'utf-8',
      ),
      metrics: StepMetrics(
        elapsedMs: 0,
        inputBytes: input.sizeBytes,
        outputBytes: rendered.length,
      ),
    );
  }

  double _score(String input) {
    const String veryCommon = ' etaoinshrdluETAOINSHRDLU';
    double score = 0;
    for (final int rune in input.runes) {
      if (rune == 9 || rune == 10 || rune == 13) {
        score += 0.5;
      } else if (rune >= 32 && rune <= 126) {
        score += 2;
        if (veryCommon.contains(String.fromCharCode(rune))) {
          score += 1.5;
        }
      } else {
        score -= 4;
      }
    }
    return score;
  }
}

class _Candidate {
  const _Candidate({
    required this.key,
    required this.text,
    required this.score,
  });

  final int key;
  final String text;
  final double score;
}
