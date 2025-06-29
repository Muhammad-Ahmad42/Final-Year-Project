import 'package:flutter/material.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class WildScanCircularIcon extends StatelessWidget {
  /// A custom icon widget with a background color
  ///
  /// Properties are:
  /// Container [width]. [height], & [backgroundColor]
  ///
  /// Icon's [size], [color], & [onPressed]
  const WildScanCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = WildScanSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : WildScanHelperFunctions.isDarkMode(context)
                ? WildScanColors.black.withOpacity(0.9)
                : WildScanColors.white.withOpacity(0.9),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
