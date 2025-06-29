import 'package:flutter/material.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/sizes.dart';

class WildScanRoundedContainer extends StatelessWidget {
  const WildScanRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = WildScanSizes.cardRadiusLg,
    this.child,
    this.showBorder = false,
    this.borderColor = WildScanColors.borderPrimary,
    this.backgroundColor = WildScanColors.white,
    this.padding,
    this.margin,
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
