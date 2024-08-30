import 'package:flutter/material.dart';
import 'colors.dart';

MaterialColor bodyColor = const MaterialColor(
  0xFFEC6543,
  <int, Color>{
    50: Color(0xFFFFE5E0),
    100: Color(0xFFFFCCBA),
    200: Color(0xFFFFB294),
    300: Color(0xFFFF996E),
    400: Color(0xFFFF7F48),
    500: Color(0xFFFF6532),
    600: Color(0xFFFF4C1C),
    700: Color(0xFFFF3206),
    800: Color(0xFFFF1900),
    900: Color(0xFFEC6543),
  },
);

final ThemeData appTheme = ThemeData(
  primarySwatch: bodyColor,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: bodyColor[200], // Set your desired cursor color here
    selectionHandleColor:
        bodyColor[400], // Optional: Change the selection handle color
    selectionColor: primaryColor, // Optional: Change the selection color
  ),
  // Add more theme configurations as needed
);

TextStyle defaultTextStyle = const TextStyle(
  fontFamily: 'Inter',
  fontFamilyFallback: ['Work Sans'],
);
