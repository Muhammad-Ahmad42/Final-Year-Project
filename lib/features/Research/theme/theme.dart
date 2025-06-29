import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Leaf-gradient helper used across widgets
LinearGradient brandGradient(bool isDark) => LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: isDark
          ? const [AppColors.darkPrimaryA, AppColors.darkPrimaryB]
          : const [AppColors.lightPrimaryA, AppColors.lightPrimaryB],
    );

final _lightScheme = ColorScheme(
  brightness: Brightness.light,
  primary:        AppColors.lightPrimaryB,
  onPrimary:      Colors.white,
  secondary:      AppColors.lightAccent,
  onSecondary:    Colors.white,
  error:          Colors.redAccent,
  onError:        Colors.white,
  background:     AppColors.lightBg,
  onBackground:   AppColors.lightOnBg,
  surface:        AppColors.lightSurface,
  onSurface:      AppColors.lightOnBg,
);

final _darkScheme = ColorScheme(
  brightness: Brightness.dark,
  primary:        AppColors.darkPrimaryB,
  onPrimary:      Colors.black,
  secondary:      AppColors.darkPrimaryB,
  onSecondary:    Colors.black,
  error:          Colors.redAccent,
  onError:        Colors.white,
  background:     AppColors.darkBg,
  onBackground:   AppColors.darkOnBg,
  surface:        AppColors.darkSurface,
  onSurface:      AppColors.darkOnBg,
);

ThemeData lightTheme() => ThemeData.from(
      colorScheme: _lightScheme,
      useMaterial3: true,
    ).copyWith(
      appBarTheme: const AppBarTheme(elevation: 0, centerTitle: false),
    );

ThemeData darkTheme() => ThemeData.from(
      colorScheme: _darkScheme,
      useMaterial3: true,
    ).copyWith(
      appBarTheme: const AppBarTheme(elevation: 0, centerTitle: false),
    );
