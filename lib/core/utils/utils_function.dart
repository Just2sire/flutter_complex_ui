class UtilsFunction {
  UtilsFunction._privateConstructor();

  // Singleton instance
  static final UtilsFunction _instance = UtilsFunction._privateConstructor();

  static UtilsFunction get instance => _instance;

  String formatDateString(String dateString) {
    final parts = dateString.split('/');
    if (parts.length != 3) {
      throw const FormatException('Invalid date format');
    }
    final day = parts[0].padLeft(2, '0');
    final month = parts[1].padLeft(2, '0');
    final year = parts[2];
    return '$day/$month/$year';
  }

  String formatCardNumber(String cardNumber) {
    if (cardNumber.length == 11) {
      final firstPart = cardNumber.substring(0, 4);
      final secondPart = cardNumber.substring(4, 7);
      final thirdPart = cardNumber.substring(7, 11);
      return '$firstPart-$secondPart-$thirdPart';
    }
    // throw const FormatException('Invalid card number format');
    return "";
  }
}
