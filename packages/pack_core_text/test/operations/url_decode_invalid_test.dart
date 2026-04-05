import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_text/pack_core_text.dart';
import 'package:test/test.dart';

void main() {
  test('url decode rejects malformed percent escapes', () async {
    final UrlDecodeOperation operation = const UrlDecodeOperation();

    expect(
      () => operation.run(
        OperationContext(
          requestId: 'url-invalid',
          previewMode: false,
          cancellationToken: CancellationController().token,
        ),
        const PayloadEnvelope(
          kind: PayloadKind.text,
          sizeBytes: 3,
          data: '%ZZ',
        ),
        const <String, Object?>{'plusAsSpace': true},
      ),
      throwsA(isA<ArgumentError>()),
    );
  });
}
