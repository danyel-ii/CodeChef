import 'package:pack_learning_content/pack_learning_content.dart';

const Map<String, OperationLearningContent> coreCipherLearningContent =
    <String, OperationLearningContent>{
  'core.cipher.xor': OperationLearningContent(
    operationId: 'core.cipher.xor',
    whatItDoes: 'Applies a repeating-key XOR across the input bytes and renders the result in a chosen format.',
    whenToUse: 'Use when inspecting simple obfuscation, CTF payloads, or byte-wise reversible transforms.',
    gotchas: 'XOR is reversible only when you reuse the same key and interpret the input/output formats correctly.',
    howItWorks: <String>[
      'Decode the incoming text into bytes using the selected input format.',
      'Convert the key into bytes.',
      'Repeat the key bytes across the full length of the input.',
      'XOR each input byte with the corresponding key byte.',
      'Render the result as text, hex, or Base64 using the selected output format.',
    ],
    relatedOperations: <String>['core.text.hex.encode', 'core.text.base64.encode'],
    examples: <LearningExample>[
      LearningExample(
        title: 'XOR text into hex',
        input: 'hello',
        params: <String, Object?>{
          'key': 'key',
          'inputFormat': 'text',
          'outputFormat': 'hex',
        },
        expectedOutputText: '030015070a',
      ),
    ],
  ),
  'core.cipher.rot13': OperationLearningContent(
    operationId: 'core.cipher.rot13',
    whatItDoes: 'Rotates each alphabetic character by 13 places, leaving other characters unchanged.',
    whenToUse: 'Use for quick classical-cipher examples, spoilers, and simple reversible obfuscation.',
    gotchas: 'ROT13 only affects A-Z and a-z. Digits, spaces, and punctuation stay unchanged.',
    howItWorks: <String>[
      'Read the text one character at a time.',
      'If the character is a letter, move it 13 positions forward through the alphabet.',
      'Wrap around at the end of the alphabet.',
      'Preserve case so uppercase stays uppercase and lowercase stays lowercase.',
      'Leave non-alphabetic characters untouched.',
    ],
    relatedOperations: <String>['core.cipher.caesar'],
    examples: <LearningExample>[
      LearningExample(
        title: 'ROT13 a phrase',
        input: 'Hello World',
        params: <String, Object?>{},
        expectedOutputText: 'Uryyb Jbeyq',
      ),
    ],
  ),
  'core.cipher.caesar': OperationLearningContent(
    operationId: 'core.cipher.caesar',
    whatItDoes: 'Shifts letters through the alphabet by a configurable amount.',
    whenToUse: 'Use for classical-cipher examples and learning how substitution shifts work.',
    gotchas: 'Only alphabetic characters shift. The same shift must be used in reverse to decode.',
    howItWorks: <String>[
      'Choose the shift amount.',
      'Walk through the text character by character.',
      'For each letter, move forward by the shift for encoding or backward by the shift for decoding.',
      'Wrap around from Z to A and from z to a as needed.',
      'Leave non-letter characters unchanged.',
    ],
    relatedOperations: <String>['core.cipher.rot13', 'core.cipher.vigenere'],
    examples: <LearningExample>[
      LearningExample(
        title: 'Caesar encode',
        input: 'Attack at dawn',
        params: <String, Object?>{'shift': 3, 'mode': 'encode'},
        expectedOutputText: 'Dwwdfn dw gdzq',
      ),
    ],
  ),
  'core.cipher.vigenere': OperationLearningContent(
    operationId: 'core.cipher.vigenere',
    whatItDoes: 'Applies a repeating alphabetic key to shift each letter by a varying amount.',
    whenToUse: 'Use for classical polyalphabetic cipher examples and educational demonstrations.',
    gotchas: 'The key must be alphabetic only. Non-letter characters do not advance the key.',
    howItWorks: <String>[
      'Convert the key into a sequence of alphabetic shifts, one shift per key letter.',
      'Walk the input text from left to right.',
      'For each alphabetic character, use the next key shift to rotate that character.',
      'Advance the key only when a letter is processed, not for spaces or punctuation.',
      'Reverse the shifts instead of adding them when decoding.',
    ],
    relatedOperations: <String>['core.cipher.caesar'],
    examples: <LearningExample>[
      LearningExample(
        title: 'Vigenere encode',
        input: 'ATTACKATDAWN',
        params: <String, Object?>{'key': 'LEMON', 'mode': 'encode'},
        expectedOutputText: 'LXFOPVEFRNHR',
      ),
    ],
  ),
};
