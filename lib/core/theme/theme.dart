import 'package:flutter/material.dart';

class AprovacaoTheme {
  static ThemeData theme = ThemeData(
    colorScheme: const ColorScheme.light(
      background: Color(0xFF0B1C40),
      error: Colors.red,
      primary: Color(0xFF02CEFD),
      onPrimary: Colors.white,
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: Color(0xFF02CEFD),
        foregroundColor: Color(0xFF0B1C40),
        padding: const EdgeInsets.all(12.0),
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        elevation: 0,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        padding: const EdgeInsets.all(8.0),
        textStyle: const TextStyle(
          color: Colors.green,
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
        ),
        side: const BorderSide(
          color: Colors.green,
          width: 1.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        elevation: 0,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
        fontSize: 14.0,
        color: Color(0xFFC4C4C4),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(
          color: Color(0xFFC4C4C4),
          width: 1.0,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(
          color: Color(0xFFC4C4C4),
          width: 1.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(
          color: Color(0xFFC4C4C4),
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1.5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.0,
        ),
      ),
    ),

    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
