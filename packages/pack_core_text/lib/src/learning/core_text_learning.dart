import 'package:pack_learning_content/pack_learning_content.dart';

const Map<String, OperationLearningContent> coreTextLearningContent =
    <String, OperationLearningContent>{
  'core.text.base64.encode': OperationLearningContent(
    operationId: 'core.text.base64.encode',
    whatItDoes: 'Base64 Encode turns raw text or bytes into ASCII-safe Base64 text.',
    whenToUse: 'Use when a system expects Base64 in JSON, headers, or transport-friendly text fields.',
    gotchas: 'Base64 is encoding, not encryption. Line breaks only affect presentation.',
    howItWorks: <String>[
      'Convert the input text into bytes using its character encoding, usually UTF-8.',
      'Group the byte stream into 24-bit chunks, which is three bytes at a time.',
      'Split each 24-bit chunk into four 6-bit values and map each value onto the Base64 alphabet.',
      'If the input length is not divisible by three, add = padding so the output stays aligned.',
      'Optionally insert line breaks if the configured interval is greater than zero.',
    ],
    relatedOperations: <String>['core.text.base64.decode'],
    examples: <LearningExample>[
      LearningExample(
        title: 'Encode simple text',
        input: 'Hello',
        params: <String, Object?>{'lineBreakInterval': 0},
        expectedOutputText: 'SGVsbG8=',
      ),
    ],
  ),
  'core.text.base64.decode': OperationLearningContent(
    operationId: 'core.text.base64.decode',
    whatItDoes: 'Base64 Decode turns Base64 text back into bytes or readable text.',
    whenToUse: 'Use when a payload looks like Base64 and you need to inspect the original content.',
    gotchas: 'Binary output may not decode cleanly as UTF-8 text.',
    howItWorks: <String>[
      'Strip the Base64 text into 4-character groups and map each character back to its 6-bit value.',
      'Recombine each four-character group into the original 24-bit block.',
      'Remove any bytes that existed only because of = padding.',
      'Interpret the recovered bytes either as raw bytes or as text, depending on the selected output mode.',
      'If the characters are not valid Base64, stop with a structured input error instead of guessing.',
    ],
    relatedOperations: <String>['core.text.base64.encode'],
    examples: <LearningExample>[
      LearningExample(
        title: 'Decode simple text',
        input: 'SGVsbG8=',
        params: <String, Object?>{'treatOutputAs': 'text'},
        expectedOutputText: 'Hello',
      ),
    ],
  ),
  'core.text.hex.encode': OperationLearningContent(
    operationId: 'core.text.hex.encode',
    whatItDoes: 'Hex Encode renders each input byte as two hexadecimal characters.',
    whenToUse: 'Use when you want a byte-by-byte textual representation that is easy to inspect.',
    gotchas: 'Hex output is larger than the original data.',
    howItWorks: <String>[
      'Convert the input into raw bytes.',
      'Take each byte and split it into its high 4 bits and low 4 bits.',
      'Map each 4-bit value to a hexadecimal digit from 0-9 or a-f.',
      'Emit exactly two hex characters for every source byte so byte boundaries stay visible.',
      'Optionally render alphabetic digits as uppercase when that parameter is enabled.',
    ],
    relatedOperations: <String>['core.text.hex.decode'],
    examples: <LearningExample>[
      LearningExample(
        title: 'Encode text to hex',
        input: 'Hello',
        params: <String, Object?>{'uppercase': false},
        expectedOutputText: '48656c6c6f',
      ),
    ],
  ),
  'core.text.hex.decode': OperationLearningContent(
    operationId: 'core.text.hex.decode',
    whatItDoes: 'Hex Decode turns hexadecimal text back into bytes or text.',
    whenToUse: 'Use when input is a hex dump, packet field, or encoded byte string.',
    gotchas: 'Hex input must have an even number of valid digits.',
    howItWorks: <String>[
      'Read the input as pairs of hexadecimal digits.',
      'Convert each pair into a single byte by combining the high nibble and low nibble.',
      'Reject the input if any character is not a valid hexadecimal digit.',
      'Reject the input if there is an odd number of digits, because one byte needs exactly two hex characters.',
      'Interpret the recovered bytes as text or keep them as bytes based on the selected output mode.',
    ],
    relatedOperations: <String>['core.text.hex.encode'],
    examples: <LearningExample>[
      LearningExample(
        title: 'Decode text from hex',
        input: '48656c6c6f',
        params: <String, Object?>{'treatOutputAs': 'text'},
        expectedOutputText: 'Hello',
      ),
    ],
  ),
  'core.text.url.encode': OperationLearningContent(
    operationId: 'core.text.url.encode',
    whatItDoes: 'URL Encode percent-escapes characters for use inside URL components.',
    whenToUse: 'Use for query strings, fragments, and path segments that contain spaces or symbols.',
    gotchas: 'Space-as-plus is common in form-style encoding but not universal.',
    howItWorks: <String>[
      'Scan the input one character at a time.',
      'Leave unreserved URL-safe characters unchanged.',
      'Convert reserved or unsafe characters into their byte values.',
      'Render each encoded byte as % followed by two hexadecimal digits.',
      'If the form-style option is enabled, encode spaces as + instead of %20.',
    ],
    relatedOperations: <String>['core.text.url.decode'],
    examples: <LearningExample>[
      LearningExample(
        title: 'Encode a query value',
        input: 'hello world',
        params: <String, Object?>{'spaceAsPlus': false},
        expectedOutputText: 'hello%20world',
      ),
    ],
  ),
  'core.text.url.decode': OperationLearningContent(
    operationId: 'core.text.url.decode',
    whatItDoes: 'URL Decode turns percent escapes back into readable text.',
    whenToUse: 'Use when copied query strings or form data contain percent escapes or plus signs.',
    gotchas: 'Only treat plus as space if the source used form-style encoding.',
    howItWorks: <String>[
      'Walk through the input text from left to right.',
      'When a % sequence appears, parse the next two hexadecimal digits as one byte.',
      'Accumulate decoded bytes and unchanged characters in order.',
      'If configured for form-style decoding, convert + into a space character.',
      'Decode the final byte stream back into readable text and raise an error if any escape is malformed.',
    ],
    relatedOperations: <String>['core.text.url.encode'],
    examples: <LearningExample>[
      LearningExample(
        title: 'Decode a query value',
        input: 'hello%20world',
        params: <String, Object?>{'plusAsSpace': true},
        expectedOutputText: 'hello world',
      ),
    ],
  ),
};
