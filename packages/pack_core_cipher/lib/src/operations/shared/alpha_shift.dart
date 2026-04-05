String shiftAlphabetic(
  String input, {
  required int shift,
}) {
  final int normalized = shift % 26;
  final StringBuffer buffer = StringBuffer();
  for (final int rune in input.runes) {
    buffer.writeCharCode(_shiftRune(rune, normalized));
  }
  return buffer.toString();
}

int _shiftRune(int rune, int shift) {
  if (rune >= 65 && rune <= 90) {
    return 65 + ((rune - 65 + shift) % 26);
  }
  if (rune >= 97 && rune <= 122) {
    return 97 + ((rune - 97 + shift) % 26);
  }
  return rune;
}
