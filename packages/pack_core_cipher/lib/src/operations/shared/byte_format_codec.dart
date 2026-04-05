import 'dart:convert';
import 'dart:typed_data';

Uint8List decodeByteFormat(
  String input,
  String format, {
  String fieldLabel = 'Input',
}) {
  switch (format) {
    case 'text':
      return Uint8List.fromList(utf8.encode(input));
    case 'hex':
      return decodeHex(input, fieldLabel: fieldLabel);
    case 'base64':
      try {
        return Uint8List.fromList(base64Decode(input.trim()));
      } on FormatException {
        throw StateError('invalidInput:$fieldLabel must be valid Base64.');
      }
    default:
      throw StateError('invalidInput:Unsupported $fieldLabel format $format.');
  }
}

String encodeByteFormat(Uint8List bytes, String format) {
  switch (format) {
    case 'text':
      return utf8.decode(bytes, allowMalformed: true);
    case 'hex':
      return encodeHex(bytes);
    case 'base64':
      return base64Encode(bytes);
    default:
      throw StateError('invalidInput:Unsupported output format $format.');
  }
}

Uint8List decodeHex(
  String input, {
  String fieldLabel = 'Input',
}) {
  final String normalized = input.replaceAll(RegExp(r'\s+'), '');
  if (normalized.length.isOdd) {
    throw StateError('invalidInput:$fieldLabel hex must contain an even number of digits.');
  }
  final Uint8List output = Uint8List(normalized.length ~/ 2);
  for (int index = 0; index < normalized.length; index += 2) {
    final int? value = int.tryParse(normalized.substring(index, index + 2), radix: 16);
    if (value == null) {
      throw StateError('invalidInput:$fieldLabel hex contains non-hex characters.');
    }
    output[index ~/ 2] = value;
  }
  return output;
}

String encodeHex(List<int> bytes) =>
    bytes.map((int byte) => byte.toRadixString(16).padLeft(2, '0')).join();
