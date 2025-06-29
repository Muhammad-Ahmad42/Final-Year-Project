import 'package:flutter/material.dart';

class WildScanColors {
  WildScanColors._();

  // App Theme Colors (Brand Identity)
  static const Color primary = Color(0xFF4b68ff); // Vibrant action color
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFb0c7ff);

  // 🌿 Nature-Inspired Additions
  static const Color appBarLightGreen =
      Color(0xFF1B5E20); // Earthy forest green
  static const Color appBarDarkGreen = Color(0xFF0D3B1C); // Deep jungle tone
  static const Color leafGreen = Color(0xFF81C784); // Soft leaf highlight
  static const Color soilBrown = Color(0xFF795548); // Organic brown
  static const Color skyBlue = Color(0xFF90CAF9); // Nature sky hint

  // Gradient Colors
  static const Gradient primaryGradientLight = LinearGradient(
    colors: [
      Color(0xFF2E7D32),
      Color.fromARGB(255, 139, 222, 144),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient primaryGradientDark = LinearGradient(
    colors: [
      Color(0xFF087F23),
      Color.fromARGB(255, 139, 222, 144),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Gradient Colors
  static const Gradient linearGradient = LinearGradient(
    colors: [
      Color(0xffff9a9e),
      Color(0xfffad0c4),
      Color(0xfffad0c4),
    ],
  );

  // Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  // Background Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);
  static const Color natureBackground =
      Color(0xFFE8F5E9); // Light natural green

  // Container Backgrounds
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = WildScanColors.white.withOpacity(0.1);

  // Button Colors
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Status Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutrals
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}
