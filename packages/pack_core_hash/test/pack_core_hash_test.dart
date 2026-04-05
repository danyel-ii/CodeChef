import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_hash/pack_core_hash.dart';
import 'package:test/test.dart';

void main() {
  Future<String> run(Operation operation) async {
    final result = await operation.run(
      OperationContext(
        requestId: 'hash',
        previewMode: false,
        cancellationToken: CancellationController().token,
      ),
      const PayloadEnvelope(kind: PayloadKind.text, sizeBytes: 5, data: 'hello'),
      const <String, Object?>{},
    );
    return result.output.data as String;
  }

  test('md5 hashes input', () async {
    expect(await run(const Md5Operation()), '5d41402abc4b2a76b9719d911017c592');
  });

  test('sha1 hashes input', () async {
    expect(await run(const Sha1Operation()), 'aaf4c61ddcc5e8a2dabede0f3b482cd9aea9434d');
  });

  test('sha256 hashes input', () async {
    expect(
      await run(const Sha256Operation()),
      '2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824',
    );
  });

  test('crc32 hashes input', () async {
    expect(await run(const Crc32Operation()), '3610a686');
  });
}
