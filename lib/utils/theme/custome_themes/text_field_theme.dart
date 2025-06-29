import 'package:flutter/material.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/sizes.dart';

class WildScanTextFormFieldTheme {
  WildScanTextFormFieldTheme._();

  static OutlineInputBorder _border(Color color, [double width = 1]) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(WildScanSizes.inputFieldRadius),
        borderSide: BorderSide(width: width, color: color),
      );

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    isDense: true,
    filled: true,
    fillColor: WildScanColors.lightGrey.withOpacity(0.1),
    errorMaxLines: 3,
    prefixIconColor: WildScanColors.darkGrey,
    suffixIconColor: WildScanColors.darkGrey,
    contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
    labelStyle: TextStyle(
      fontFamily: 'Roboto',
      fontSize: WildScanSizes.fontSizeMd,
      color: WildScanColors.black,
    ),
    hintStyle: TextStyle(
      fontSize: WildScanSizes.fontSizeSm,
      color: WildScanColors.black.withOpacity(0.6),
    ),
    floatingLabelStyle: TextStyle(
      color: WildScanColors.black.withOpacity(0.8),
    ),
    border: _border(WildScanColors.grey),
    enabledBorder: _border(WildScanColors.grey),
    focusedBorder: _border(WildScanColors.primary, 1.5),
    errorBorder: _border(WildScanColors.warning),
    focusedErrorBorder: _border(WildScanColors.warning, 2),
    errorStyle: TextStyle(
      fontSize: WildScanSizes.fontSizeSm,
      color: WildScanColors.warning,
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    isDense: true,
    filled: true,
    fillColor: WildScanColors.black.withOpacity(0.15),
    errorMaxLines: 2,
    prefixIconColor: WildScanColors.white.withOpacity(0.7),
    suffixIconColor: WildScanColors.white.withOpacity(0.7),
    contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
    labelStyle: TextStyle(
      fontFamily: 'Roboto',
      fontSize: WildScanSizes.fontSizeMd,
      color: WildScanColors.white.withOpacity(0.8),
    ),
    hintStyle: TextStyle(
      fontSize: WildScanSizes.fontSizeSm,
      color: WildScanColors.white.withOpacity(0.7),
    ),
    floatingLabelStyle: TextStyle(
      fontWeight: FontWeight.w600,
      color: WildScanColors.primary.withOpacity(0.9),
    ),
    border: _border(WildScanColors.darkGrey),
    enabledBorder: _border(WildScanColors.darkGrey),
    focusedBorder: _border(WildScanColors.primary, 1.8),
    errorBorder: _border(WildScanColors.warning),
    focusedErrorBorder: _border(WildScanColors.warning, 2),
    errorStyle: TextStyle(
      fontSize: WildScanSizes.fontSizeSm,
      color: WildScanColors.warning,
    ),
  );
}
