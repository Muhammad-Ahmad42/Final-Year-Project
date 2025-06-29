import 'package:flutter/material.dart';
import 'package:wildscan/utils/constraints/colors.dart';

class WildScanChipTheme {
  WildScanChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: WildScanColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: WildScanColors.black),
    selectedColor: WildScanColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: WildScanColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: WildScanColors.darkerGrey,
    labelStyle: TextStyle(color: WildScanColors.white),
    selectedColor: WildScanColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: WildScanColors.white,
  );
}
