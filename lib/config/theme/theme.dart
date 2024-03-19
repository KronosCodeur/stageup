import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const primary = Color(0xff0CA900);
  static const warning = Color(0xFFFCD667);
  static const secondary = Color(0xff54bdf4);
  static const white = Colors.white;
  static const black = Colors.black;
  static const gray = Color(0xff8c8c8c);
  static const subWhite = Color(0xffe8e8e8);
  static const error = Color(0xffE46761);

  static ThemeData mainTheme() => ThemeData.light().copyWith(
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: primary,
        onPrimary: primary,
        secondary: secondary,
        onSecondary: secondary,
        error: error,
        onError: error,
        background: white,
        onBackground: white,
        surface: subWhite,
        onSurface: subWhite,
      ),
      scaffoldBackgroundColor: white,
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins(color: black),
        bodyMedium: GoogleFonts.poppins(color: black),
        bodySmall: GoogleFonts.poppins(color: black),
        displayLarge: GoogleFonts.poppins(color: black),
        displayMedium: GoogleFonts.poppins(color: black),
        displaySmall: GoogleFonts.poppins(color: black),
        labelLarge: GoogleFonts.poppins(color: black),
        labelMedium: GoogleFonts.poppins(color: black),
        labelSmall: GoogleFonts.poppins(color: black),
      ));
}
