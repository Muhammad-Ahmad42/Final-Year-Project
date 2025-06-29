import 'package:flutter/material.dart';
import 'package:wildscan/utils/constraints/colors.dart';

class WildScanShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: WildScanColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: WildScanColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
