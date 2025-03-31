import 'package:flutter/material.dart';

class AprovacaoTheme {
  static ThemeData theme = ThemeData(
    colorScheme: const ColorScheme.light(
      background: Colors.white,
      error: Colors.red,
      primary: Colors.green,
      onPrimary: Colors.white,
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.all(8.0),
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
        color: Color(0xFF8F8F8F),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      ),
    ),

    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
