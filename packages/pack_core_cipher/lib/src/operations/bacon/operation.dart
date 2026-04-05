import 'package:execution_protocol/execution_protocol.dart';

import 'manifest.dart';

const List<String> _modernAlphabet = <String>[
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z',
];

const List<String> _classicalAlphabet = <String>[
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'W',
  'X',
  'Y',
  'Z',
];

class BaconOperation implements Operation {
  const BaconOperation();

  @override
  OperationManifest get manifest => baconManifest;

  @override
  Future<StepExecutionResult> run(
    OperationContext context,
    PayloadEnvelope input,
    Map<String, Object?> params,
  ) async {
    context.cancellationToken.throwIfCancelled();
    final String mode = (params['mode'] as String?) ?? 'encode';
    final String variant = (params['alphabetVariant'] as String?) ?? 'modern26';
    final bool groupOutput = (params['groupOutput'] as bool?) ?? true;
    final String output = mode == 'decode'
        ? _decode(input.asText(), variant)
        : _encode(input.asText(), variant, groupOutput);
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

  String _encode(String input, String variant, bool groupOutput) {
    final List<String> alphabet =
        variant == 'classical24' ? _classicalAlphabet : _modernAlphabet;
    final List<String> groups = <String>[];
    for (final int rune in input.toUpperCase().runes) {
      if (rune < 65 || rune > 90) {
        continue;
      }
      String letter = String.fromCharCode(rune);
      if (variant == 'classical24') {
        if (letter == 'J') {
          letter = 'I';
        } else if (letter == 'V') {
          letter = 'U';
        }
      }
      final int index = alphabet.indexOf(letter);
      if (index == -1) {
        continue;
      }
      groups.add(_toBaconGroup(index));
    }
    return groupOutput ? groups.join(' ') : groups.join();
  }

  String _decode(String input, String variant) {
    final String normalized = input.toUpperCase().replaceAll(RegExp(r'[^AB]'), '');
    if (normalized.length % 5 != 0) {
      throw StateError('invalidInput:Bacon input must contain complete five-character A/B groups.');
    }
    final List<String> alphabet =
        variant == 'classical24' ? _classicalAlphabet : _modernAlphabet;
    final StringBuffer buffer = StringBuffer();
    for (int offset = 0; offset < normalized.length; offset += 5) {
      final int value = _fromBaconGroup(normalized.substring(offset, offset + 5));
      if (value < 0 || value >= alphabet.length) {
        throw StateError('invalidInput:Bacon group is outside the selected alphabet variant.');
      }
      buffer.write(alphabet[value]);
    }
    return buffer.toString();
  }

  String _toBaconGroup(int value) {
    final String binary = value.toRadixString(2).padLeft(5, '0');
    return binary.replaceAll('0', 'A').replaceAll('1', 'B');
  }

  int _fromBaconGroup(String group) {
    return int.parse(group.replaceAll('A', '0').replaceAll('B', '1'), radix: 2);
  }
}
