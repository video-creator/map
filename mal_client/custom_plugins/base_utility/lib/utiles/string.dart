String breakWord(String text) {
  if (text.isEmpty) {
    return text;
  }
  String breakWord = ' ';
  for (var element in text.runes) {
    breakWord += String.fromCharCode(element);
    breakWord += '\u200B';
  }
  return breakWord;
}