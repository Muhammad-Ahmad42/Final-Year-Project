import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/device/device_utility.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class WildScanSearchBar extends StatelessWidget {
  const WildScanSearchBar({
    super.key,
    required this.hintText,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onChanged,
    this.onSubmitted,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  });

  final String hintText;
  final IconData? icon;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final bool isDark = WildScanHelperFunctions.isDarkMode(context);

    // Choose adaptive colors
    final Color borderClr =
        isDark ? WildScanColors.darkerGrey : WildScanColors.grey;
    final Color fillClr =
        isDark ? WildScanColors.darkerGrey : WildScanColors.white;
    final Color textClr = isDark ? Colors.white : WildScanColors.darkerGrey;
    final Color hintClr = isDark ? Colors.white70 : WildScanColors.darkerGrey;

    return Padding(
      padding: padding,
      child: SizedBox(
        width: WildScanDeviceUtils.getScreenWidth(context),
        child: TextField(
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          cursorColor: textClr,
          style: TextStyle(
            color: textClr,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: fillClr,
            hintText: hintText,
            hintStyle: TextStyle(
              color: hintClr,
              fontSize: 15.0,
            ),
            isDense: true,
            prefixIcon: Icon(
              icon,
              color: hintClr,
              size: 20,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(WildScanSizes.cardRadiusLg),
              borderSide: showBorder
                  ? BorderSide(color: borderClr, width: 1)
                  : BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(WildScanSizes.cardRadiusLg),
              borderSide: showBorder
                  ? BorderSide(
                      color: isDark
                          ? WildScanColors.darkerGrey
                          : WildScanColors.white,
                      width: 2,
                    )
                  : BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
