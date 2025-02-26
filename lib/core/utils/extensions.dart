import 'package:flutter/material.dart';

///Extensions on BuildContext.
extension BuildContextExtensions on BuildContext {
  bool get isXLarge => width > 1200;

  bool get isLarge => width > 600;

  bool get isMedium => width > 400 && width < 600;

  bool get isSmall => width < 400;

  bool get isXSmall => width < 800;

  bool get isPortrait => size.width < size.height;

  bool get isLandscape => size.width > size.height;

  /// Get the current app default text style.
  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);

  /// Get the actual screen information .
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Get the current app navigator.
  NavigatorState get navigator => Navigator.of(this);

  /// Get the current app focus scope.
  FocusScopeNode get focusScope => FocusScope.of(this);

  /// Get the current app scaffold.
  ScaffoldState get scaffold => Scaffold.of(this);

  /// Get the current app scaffold messenger.
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  /// Get the current screen size.
  Size get size => MediaQuery.sizeOf(this);

  /// Get the current screen width.
  double get width => size.width;

  /// Get the current screen height.
  double get height => size.height;
}

///ThemeExtensions on ThemeData
extension ThemeDataEnhancement on ThemeData {
  /// Determine if current theme is dark.
  bool get isDark => brightness == Brightness.dark;
// bool get isDark => colorScheme.brightness == Brightness.dark;
}

///ThemeExtensions on ThemeData
extension BrightnessEnhancement on Brightness {
  /// Add an iterable to the end of the iterable
  Brightness get inverse =>
      this == Brightness.dark ? Brightness.light : Brightness.dark;
}

///ThemeExtensions on BuildContext
extension ThemeOnBuildContextExtension on BuildContext {
  /// Get the current app theme on current context.
  ThemeData get theme => Theme.of(this);

  /// Get the text theme on current context.
  TextTheme get textTheme => theme.textTheme;

  /// Get the color scheme on current context.
  ColorScheme get colorScheme => theme.colorScheme;
}

///DateTimeExtension on DateTime
extension DateTimeExtension on DateTime {
  /// Get the date in a String format "DD/MM/YYYY"
  String formatDateString() {
    final dateString = "${this.day}/${this.month}/${this.year}";
    final parts = dateString.split('/');
    if (parts.length != 3) {
      throw const FormatException('Invalid date format');
    }
    final day = parts[0].padLeft(2, '0');
    final month = parts[1].padLeft(2, '0');
    final year = parts[2];
    return '$day/$month/$year';
  }

  /// Get the date and time in a String format "HH:MM DD/MM/YYYY"
  String formatDateTimeString() {
    final day = this.day.toString().padLeft(2, '0');
    final month = this.month.toString().padLeft(2, '0');
    final year = this.year.toString();
    final hour = this.hour.toString().padLeft(2, '0');
    final minute = this.minute.toString().padLeft(2, '0');
    final second = this.second.toString().padLeft(2, '0');
    return '$day/$month/$year $hour:$minute:$second';
  }

  /// Get the time in a String format "HH:MM"
  String formatTimeString() {
    final hour = this.hour.toString().padLeft(2, '0');
    final minute = this.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}

///IntExtension on Int
extension IntExtension on int {
  /// Convert an Int to the CNI Format "XXXX-XXX-XXX"
  String toCniFormat() {
    final normalValue = toString();
    if (normalValue.length != 11) {
      throw Exception("Invalid CNI number");
    }
    return """${normalValue.substring(0, 4)}-${normalValue.substring(4, 7)}-${normalValue.substring(7)}""";
  }
}

///StringExtension on String
extension StringExtension on String {
  /// Check if the current String contains an Integer
  bool containsAnInt() {
    return containsRegex(r'\d');
  }

  /// Capitalize the first letter of each word in the String
  String toCapitalize() {
    final words = split(' ');
    return words
        .map(
          (word) =>
              '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}',
        )
        .join(' ');
  }

  /// Check if the current String contains a String(for Int converted in String)
  bool containsString() {
    return containsRegex("r'[a-zA-Z]");
  }

  /// Check if a String expression match a specific Regex
  bool containsRegex(String regex) {
    return RegExp(regex).hasMatch(this);
  }

  /// Get the Integers in a specified String
  int getInt() {
    final regexResult = RegExp(r'\d').allMatches(this);
    final finalResult = regexResult.map((item) => item.group(0)).join();
    return int.parse(finalResult);
  }

  /// Get the Integers in a specified String following the CardNumber format
  String getCardNumber() {
    final regexResult = RegExp("([0-9-])+").allMatches(this);
    final matches =
        regexResult.map((item) => item[0].toString()).toSet().toList();
    final finalResult = matches.join("-");
    return finalResult;
  }
}
