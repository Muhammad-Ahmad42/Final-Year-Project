import 'package:flutter/material.dart';

/// Brand-safe palette drawn from your screenshots
class AppColors {
  AppColors._();                            // no instances!

  // ── LIGHT THEME ──────────────────────────────────────────────
  static const lightBg         = Color(0xFFFFFFFF);
  static const lightSurface    = Color(0xFFF5F5F5);
  static const lightOnBg       = Color(0xFF000000);
  static const lightPrimaryA   = Color(0xFF2E7D32); // dark leaf
  static const lightPrimaryB   = Color(0xFF66BB6A); // light leaf
  static const lightAccent     = Color(0xFF8E24AA); // soft purple

  // ── DARK THEME ───────────────────────────────────────────────
  static const darkBg          = Color(0xFF0D0D0D);
  static const darkSurface     = Color(0xFF1A1A1A);
  static const darkOnBg        = Color(0xFFFFFFFF);
  static const darkPrimaryA    = Color(0xFF1B5E20); // deep green
  static const darkPrimaryB    = Color(0xFF34C759); // neon-leaf
}
