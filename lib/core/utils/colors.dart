import 'package:flutter/material.dart';

/// Get hex code from Color object.
// ignore: deprecated_member_use
String getHexCode(Color color) => '#${color.value.toRadixString(16)}';

extension MaterialColorFormColor on Color {
  MaterialColor get material {
    // ignore: deprecated_member_use
    final red = this.red;

    // ignore: deprecated_member_use
    final green = this.green;

    // ignore: deprecated_member_use
    final blue = this.blue;

    final shades = <int, Color>{
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };

    // ignore: deprecated_member_use
    return MaterialColor(value, shades);
  }
}

extension ColorExtensions on Color {
  Color darker([double amount = 0.2]) {
    assert(amount >= 0.0 && amount <= 1.0, 'Amount must be between 0 and 1');

    final hsl = HSLColor.fromColor(this);

    final darkerHSL = hsl.withLightness(
      (hsl.lightness - amount).clamp(0.0, 1.0),
    );

    return darkerHSL.toColor();
  }
}
