import 'package:pack_learning_content/pack_learning_content.dart';

const Map<String, OperationLearningContent> coreHashLearningContent =
    <String, OperationLearningContent>{
  'core.hash.md5': OperationLearningContent(
    operationId: 'core.hash.md5',
    whatItDoes: 'Computes the MD5 digest of the input and renders it as lowercase hex.',
    whenToUse: 'Use for compatibility checks, legacy digests, and education. Do not treat MD5 as secure.',
    gotchas: 'MD5 is broken for security-sensitive use. It is fine here only as a checksum or learning tool.',
    howItWorks: <String>[
      'Convert the input text into bytes.',
      'Pad the message to the block shape required by the MD5 algorithm.',
      'Process the message through the MD5 compression rounds to produce a 128-bit digest.',
      'Render the 16 digest bytes as 32 lowercase hexadecimal characters.',
      'Treat the result as a one-way fingerprint, not as reversible encoded data.',
    ],
    relatedOperations: <String>['core.hash.sha1', 'core.hash.sha256'],
    examples: <LearningExample>[
      LearningExample(
        title: 'Hash a short string',
        input: 'hello',
        params: <String, Object?>{},
        expectedOutputText: '5d41402abc4b2a76b9719d911017c592',
      ),
    ],
  ),
  'core.hash.sha1': OperationLearningContent(
    operationId: 'core.hash.sha1',
    whatItDoes: 'Computes the SHA-1 digest of the input as lowercase hex.',
    whenToUse: 'Use for compatibility and legacy workflows. Prefer SHA-256 when you control the format.',
    gotchas: 'SHA-1 is no longer appropriate for serious integrity or signature systems.',
    howItWorks: <String>[
      'Convert the input to bytes and pad it according to the SHA-1 message format.',
      'Split the padded message into fixed-size blocks.',
      'Run each block through the SHA-1 compression function to update the internal state.',
      'Combine the final state words into a 160-bit digest.',
      'Render the digest as lowercase hexadecimal for inspection or comparison.',
    ],
    relatedOperations: <String>['core.hash.md5', 'core.hash.sha256'],
    examples: <LearningExample>[
      LearningExample(
        title: 'Hash a short string',
        input: 'hello',
        params: <String, Object?>{},
        expectedOutputText: 'aaf4c61ddcc5e8a2dabede0f3b482cd9aea9434d',
      ),
    ],
  ),
  'core.hash.sha256': OperationLearningContent(
    operationId: 'core.hash.sha256',
    whatItDoes: 'Computes the SHA-256 digest of the input as lowercase hex.',
    whenToUse: 'Use for modern digest workflows and deterministic content fingerprints.',
    gotchas: 'Hashes are one-way digests, not reversible encodings.',
    howItWorks: <String>[
      'Convert the input into bytes and pad it to SHA-256 block boundaries.',
      'Expand each block into the message schedule used by the SHA-256 rounds.',
      'Apply the SHA-256 compression function to update the eight-word internal state.',
      'After all blocks are processed, combine the final state into a 256-bit digest.',
      'Render the digest as 64 lowercase hexadecimal characters.',
    ],
    relatedOperations: <String>['core.hash.sha1', 'core.hash.crc32'],
    examples: <LearningExample>[
      LearningExample(
        title: 'Hash a short string',
        input: 'hello',
        params: <String, Object?>{},
        expectedOutputText:
            '2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824',
      ),
    ],
  ),
  'core.hash.crc32': OperationLearningContent(
    operationId: 'core.hash.crc32',
    whatItDoes: 'Computes a CRC32 checksum and renders it as lowercase hex.',
    whenToUse: 'Use for quick corruption checks, protocol checksums, and file format inspection.',
    gotchas: 'CRC32 is a checksum, not cryptography.',
    howItWorks: <String>[
      'Convert the input into bytes.',
      'Initialize the CRC accumulator to the algorithm start value.',
      'Process each byte through the CRC32 polynomial update logic.',
      'Finalize the accumulator according to the CRC32 output rules.',
      'Render the 32-bit checksum as eight lowercase hexadecimal characters.',
    ],
    relatedOperations: <String>['core.hash.sha256'],
    examples: <LearningExample>[
      LearningExample(
        title: 'Checksum a short string',
        input: 'hello',
        params: <String, Object?>{},
        expectedOutputText: '3610a686',
      ),
    ],
  ),
};
