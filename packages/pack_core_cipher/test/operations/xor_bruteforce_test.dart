import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_cipher/pack_core_cipher.dart';
import 'package:test/test.dart';

void main() {
  test('xor brute force surfaces the most readable single-byte candidate', () async {
    final XorBruteForceOperation operation = const XorBruteForceOperation();

    final StepExecutionResult result = await operation.run(
      OperationContext(
        requestId: 'xor-bruteforce',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(kind: PayloadKind.text, sizeBytes: 10, data: '2a272e2e2d'),
      const <String, Object?>{
        'inputFormat': 'hex',
        'candidateCount': 1,
        'keyStart': 0,
        'keyEnd': 255,
      },
    );

    expect(result.output.data, contains('0x42'));
    expect(result.output.data, contains('hello'));
  });
}
