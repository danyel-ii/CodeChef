import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_format/pack_core_format.dart';
import 'package:test/test.dart';

void main() {
  Future<String> run(
    Operation operation, {
    required String input,
    Map<String, Object?> params = const <String, Object?>{},
  }) async {
    final result = await operation.run(
      OperationContext(
        requestId: 'format',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      PayloadEnvelope(kind: PayloadKind.text, sizeBytes: input.length, data: input),
      params,
    );
    return result.output.data as String;
  }

  test('json pretty formats json', () async {
    expect(
      await run(
        const JsonPrettyOperation(),
        input: '{"b":2,"a":1}',
        params: const <String, Object?>{'indent': 2, 'sortKeys': true},
      ),
      '{\n  "a": 1,\n  "b": 2\n}',
    );
  });

  test('json minify minifies json', () async {
    expect(
      await run(const JsonMinifyOperation(), input: '{\n "a": 1 \n}'),
      '{"a":1}',
    );
  });

  test('json validate passes through valid json', () async {
    expect(
      await run(const JsonValidateOperation(), input: '{"ok":true}'),
      '{"ok":true}',
    );
  });

  test('trim lines trims per-line whitespace', () async {
    expect(await run(const LinesTrimOperation(), input: '  a  \n  b  '), 'a\nb');
  });

  test('filter empty lines removes blank lines', () async {
    expect(await run(const LinesFilterEmptyOperation(), input: 'a\n\n \n b'), 'a\n b');
  });

  test('join lines joins with separator', () async {
    expect(
      await run(
        const LinesJoinOperation(),
        input: 'a\nb\nc',
        params: const <String, Object?>{'separator': ', '},
      ),
      'a, b, c',
    );
  });
}
