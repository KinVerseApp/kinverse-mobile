import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Color tokens copied 1:1 from the HTML prototype's CSS variables so the
/// Flutter build matches it exactly rather than reinterpreting the palette.
class AppColors {
  AppColors._();

  static const parchment = Color(0xFFF3ECDC);
  static const parchmentDeep = Color(0xFFE9DEC3);
  static const paper = Color(0xFFFBF7ED);
  static const ink = Color(0xFF2A241D);
  static const inkSoft = Color(0xFF6B6154);
  static const inkFaint = Color(0xFF9C9282);
  static const forest = Color(0xFF243B31);
  static const forestLight = Color(0xFF33513F);
  static const clay = Color(0xFFB85C38);
  static const clayDark = Color(0xFF9A4A2C);
  static const gold = Color(0xFFC79A4B);
  static const sage = Color(0xFF7C9473);
  static const line = Color(0xFFDCCFAE);
  static const lineSoft = Color(0xFFEADFC5);
}

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.clay,
        primary: AppColors.clay,
        onPrimary: Colors.white,
        secondary: AppColors.forest,
        surface: AppColors.paper,
        onSurface: AppColors.ink,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: AppColors.paper,
      fontFamily: GoogleFonts.inter().fontFamily,
    );

    final displayFont = GoogleFonts.frauncesTextTheme(base.textTheme);
    final bodyFont = GoogleFonts.interTextTheme(base.textTheme);

    return base.copyWith(
      textTheme: bodyFont.copyWith(
        headlineLarge: displayFont.headlineLarge
            ?.copyWith(fontWeight: FontWeight.w600, color: AppColors.ink),
        headlineMedium: displayFont.headlineMedium
            ?.copyWith(fontWeight: FontWeight.w600, color: AppColors.ink),
        titleLarge: displayFont.titleLarge
            ?.copyWith(fontWeight: FontWeight.w600, color: AppColors.ink),
        titleMedium: displayFont.titleMedium
            ?.copyWith(fontWeight: FontWeight.w600, color: AppColors.ink),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.paper,
        foregroundColor: AppColors.ink,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.clay,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.forest,
          minimumSize: const Size.fromHeight(52),
          side: const BorderSide(color: AppColors.line, width: 1.4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.inkSoft),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.paper,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: const BorderSide(color: AppColors.line, width: 1.4),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: const BorderSide(color: AppColors.line, width: 1.4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: const BorderSide(color: AppColors.clay, width: 1.6),
        ),
        labelStyle: const TextStyle(
          color: AppColors.inkSoft, fontSize: 12, fontWeight: FontWeight.w600,
        ),
      ),
      dividerTheme: const DividerThemeData(color: AppColors.lineSoft, thickness: 1),
      cardTheme: CardThemeData(
        color: AppColors.paper,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.line, width: 1.4),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.paper,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
        ),
      ),
    );
  }
}
