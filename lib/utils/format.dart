String formatText(String text) {
  // Replace all occurrences of \\r\\n with a newline and \t with spaces
  String formattedText = text
      .replaceAll(RegExp(r'\\r\\n'), '\n') // Handles \\r\\n
      .replaceAll(RegExp(r'\\t'), ' ') // Handles \\t
      .trim(); // Removes any leading or trailing whitespace

  return formattedText;
}
