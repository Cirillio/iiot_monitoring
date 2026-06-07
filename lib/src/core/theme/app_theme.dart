import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const _neonBlue = Color.fromARGB(255, 0, 220, 130);

  // Dark Theme Colors
  static const _darkBackground = Color.fromARGB(
    255,
    18,
    18,
    18,
  ); // Глубокий темный фон
  static const _darkSurface = Color.fromARGB(
    95,
    41,
    40,
    40,
  ); // Поверхность карточек
  static const _darkMuted = Color(
    0xFF27272A,
  ); // Muted цвет для элементов на surface

  // Light Theme Colors
  static const _lightBackground = Color(0xFFF4F4F5); // Светлый серый фон
  static const _lightSurface = Color(0xFFFFFFFF); // Белая поверхность карточек
  static const _lightMuted = Color.fromARGB(
    255,
    237,
    237,
    237,
  ); // Muted цвет для элементов на surface

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        surface: _darkSurface,
        surfaceContainerHighest: _darkMuted,
        primary: _neonBlue,
        secondary: _neonBlue,
        onPrimary: Colors.black,
        onSurface: Colors.white,
        error: Colors.redAccent,
      ),
      scaffoldBackgroundColor: _darkBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: _darkBackground,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
      ),
      cardTheme: CardThemeData(
        color: _darkSurface,
        elevation: 0, // Индустриальный минимализм: без теней
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: _darkMuted, width: 1),
        ),
        margin: EdgeInsets.zero,
      ),
      textTheme: GoogleFonts.geistTextTheme(
        ThemeData.dark().textTheme,
      ).apply(bodyColor: Colors.white, displayColor: Colors.white),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        surface: _lightSurface,
        surfaceContainerHighest: _lightMuted,
        surfaceDim: _lightBackground,
        primary: _neonBlue,
        secondary: _neonBlue,
        onPrimary: Colors.white,
        onSurface: Colors.black,
        error: Colors.redAccent,
      ),
      scaffoldBackgroundColor: _lightBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: _lightBackground,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
      ),
      cardTheme: CardThemeData(
        color: _lightSurface,
        elevation: 0, // Индустриальный минимализм: без теней
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: _lightMuted, width: 1),
        ),
        margin: EdgeInsets.zero,
      ),
      textTheme: GoogleFonts.geistTextTheme(
        ThemeData.light().textTheme,
      ).apply(bodyColor: Colors.black, displayColor: Colors.black),
    );
  }
}
