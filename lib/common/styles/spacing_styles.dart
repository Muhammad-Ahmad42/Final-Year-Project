import 'package:flutter/cupertino.dart';
import 'package:wildscan/utils/constraints/sizes.dart';

class WildScanSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: WildScanSizes.appBarHeight,
    left: WildScanSizes.defaultSpace,
    bottom: WildScanSizes.defaultSpace,
    right: WildScanSizes.defaultSpace,
  );
}
