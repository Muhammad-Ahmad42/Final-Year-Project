import 'package:flutter/material.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/sizes.dart';

class WildScanAppBarTheme {
  WildScanAppBarTheme._();

  static const lighWildScanAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme:
        IconThemeData(color: WildScanColors.black, size: WildScanSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: WildScanColors.black, size: WildScanSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: WildScanColors.black),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme:
        IconThemeData(color: WildScanColors.black, size: WildScanSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: WildScanColors.white, size: WildScanSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: WildScanColors.white),
  );
}
