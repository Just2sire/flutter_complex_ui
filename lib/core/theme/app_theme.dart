import 'package:complex_ui/core/constants/fonts.gen.dart';
import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: const Color(0xFF8F4C33),
    scaffoldBackgroundColor: const Color(0xFFFFF8F6),
    canvasColor: const Color(0xFFFFF8F6),
    cardColor: const Color(0xFFFFF8F6),
    dividerColor: const Color(0x1F231A16),
    disabledColor: const Color(0x61000000),
    focusColor: const Color(0x1F000000),
    highlightColor: const Color(0x66BCBCBC),
    hintColor: const Color(0x99000000),
    hoverColor: const Color(0x0A000000),
    shadowColor: const Color(0xFF000000),
    splashColor: const Color(0x66C8C8C8),
    visualDensity: VisualDensity.compact,
    fontFamily: FontFamily.poppins,

    colorScheme: const ColorScheme.light(
      primary: Color(0xFF8F4C33),
      primaryContainer: Color(0xFFFFDBCF),
      secondary: Color(0xFF77574C),
      secondaryContainer: Color(0xFFFFDBCF),
      tertiary: Color(0xFF695E2F),
      tertiaryContainer: Color(0xFFF2E2A8),
      error: Color(0xFFBA1A1A),
      errorContainer: Color(0xFFFFDAD6),
      onPrimaryContainer: Color(0xFF380D00),
      onSecondary: Colors.white,
      onSecondaryContainer: Color(0xFF2C160D),
      onTertiary: Colors.white,
      onTertiaryContainer: Color(0xFF211B00),
      onErrorContainer: Color(0xFF410002),
      onSurface: Color(0xFF231A16),
      onSurfaceVariant: Color(0xFF53433E),
      outline: Color(0xFF85736D),
      outlineVariant: Color(0xFFD8C2BB),
      inverseSurface: Color(0xFF392E2B),
      inversePrimary: Color(0xFFFFB59A),
    ),

    iconTheme: const IconThemeData(color: Color(0xDD000000), size: 32),

    textTheme: _textTheme,
    dialogTheme: const DialogThemeData(backgroundColor: Color(0xFFFFF8F6)),
  );

  // 🌙 Thème sombre
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: const Color(0xFFFFB59A),
    scaffoldBackgroundColor: const Color(0xFF231A16),
    canvasColor: const Color(0xFF2C211D),
    cardColor: const Color(0xFF2C211D),
    dividerColor: const Color(0x1FFFFFFF),
    fontFamily: FontFamily.poppins,

    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFFFB59A),
      primaryContainer: Color(0xFF6E2A13),
      secondary: Color(0xFFE7BEAE),
      secondaryContainer: Color(0xFF5D4037),
      tertiary: Color(0xFFD6C77B),
      tertiaryContainer: Color(0xFF4C4422),
      error: Color(0xFFFFB4AB),
      errorContainer: Color(0xFF93000A),
      onPrimary: Color(0xFF5B1F00),
      onPrimaryContainer: Color(0xFFFFDBCF),
      onSecondary: Color(0xFF422A20),
      onSecondaryContainer: Color(0xFFFFDBCF),
      onTertiary: Color(0xFF39320D),
      onTertiaryContainer: Color(0xFFF2E2A8),
      onErrorContainer: Color(0xFFFFDAD6),
      onSurface: Color(0xFFEDE0DC),
      onSurfaceVariant: Color(0xFFDBC6BF),
      outline: Color(0xFFB09A94),
      inverseSurface: Color(0xFF392E2B),
      inversePrimary: Color(0xFF8F4C33),
    ),
    iconTheme: const IconThemeData(color: Color(0xDD000000), size: 32),

    textTheme: _textTheme, // 🔥 Réutilise le même TextTheme
  );

  // 📝 Définition du TextTheme commun aux deux modes
  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 96,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    ),
    displayMedium: TextStyle(fontSize: 60, fontWeight: FontWeight.normal),
    displaySmall: TextStyle(fontSize: 48, fontWeight: FontWeight.normal),
    headlineMedium: TextStyle(fontSize: 34, fontWeight: FontWeight.normal),
    headlineSmall: TextStyle(fontSize: 28, fontWeight: FontWeight.normal),
    titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
    titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
    titleSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
  );
}
