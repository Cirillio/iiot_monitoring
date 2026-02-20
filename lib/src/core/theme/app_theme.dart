import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const _darkGraphite = Color(0xFF121212);
  static const _neonBlue = Color(0xFF00E5FF);
  static const _surfaceColor = Color(0xFF1E1E1E);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        surface: _darkGraphite,
        primary: _neonBlue,
        secondary: _neonBlue,
        onPrimary: Colors.black,
        onSurface: Colors.white,
        error: Colors.redAccent,
      ),
      scaffoldBackgroundColor: _darkGraphite,
      appBarTheme: const AppBarTheme(
        backgroundColor: _darkGraphite,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        color: _surfaceColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      textTheme: GoogleFonts.geistTextTheme(
        ThemeData.dark().textTheme,
      ).apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
    );
  }
}
