import 'package:flutter/material.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class WildScanOutlinedButtonTheme {
  WildScanOutlinedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lighWildScanOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: WildScanColors.dark,
      side: const BorderSide(color: WildScanColors.borderPrimary),
      textStyle: const TextStyle(
          fontSize: 16,
          color: WildScanColors.black,
          fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(
          vertical: WildScanSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(WildScanSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: WildScanColors.light,
      side: const BorderSide(color: WildScanColors.borderPrimary),
      textStyle: const TextStyle(
          fontSize: 16,
          color: WildScanColors.textWhite,
          fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(
          vertical: WildScanSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(WildScanSizes.buttonRadius)),
    ),
  );
}
