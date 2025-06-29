import 'package:flutter/material.dart';

class WildScanElevatedButtonTheme {
  WildScanElevatedButtonTheme._();

  // Light Theme Button Style
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 2,
      foregroundColor: Colors.white, // Text Color
      backgroundColor: Colors.green, // Button Color
      disabledForegroundColor: Colors.white.withOpacity(0.4),
      disabledBackgroundColor: Colors.grey.shade400,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 2,
      foregroundColor: Colors.white, // Text Color
      backgroundColor: Colors.greenAccent.shade700, // Button Color in Dark Mode
      disabledForegroundColor: Colors.white.withOpacity(0.4),
      disabledBackgroundColor: Colors.grey.shade800,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
