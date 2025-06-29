import 'package:flutter/material.dart';
import 'package:wildscan/utils/constraints/colors.dart';
// import 'package:wildscan/utils/device/device_utility.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class WildScanTabBar extends StatelessWidget implements PreferredSizeWidget {
  const WildScanTabBar({
    super.key,
    required this.tabs,
    this.indicatorGradient = WildScanColors.primaryGradientDark,
    this.labelColor,
    this.unselectedLabelColor,
  });

  final List<Widget> tabs;
  final Gradient? indicatorGradient;
  final Color? labelColor;
  final Color? unselectedLabelColor;

  @override
  Widget build(BuildContext context) {
    final dark = WildScanHelperFunctions.isDarkMode(context);

    return Material(
      color: dark ? WildScanColors.black : WildScanColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicator: BoxDecoration(
          gradient: indicatorGradient,
          borderRadius: BorderRadius.circular(20),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor:
            labelColor ?? (dark ? WildScanColors.white : WildScanColors.white),
        unselectedLabelColor: unselectedLabelColor ?? WildScanColors.darkGrey,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        indicatorPadding: const EdgeInsets.all(6),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
