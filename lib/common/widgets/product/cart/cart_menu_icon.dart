import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wildscan/features/MarketPlace/cart/cart.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class WildScanCartCounterIcon extends StatelessWidget {
  const WildScanCartCounterIcon({
    super.key,
    required this.onPressed,
    this.iconColor,
    this.counterBgColor,
    this.counterTextColor,
    required int counter,
  });

  final VoidCallback onPressed;
  final Color? iconColor, counterBgColor, counterTextColor;

  @override
  Widget build(BuildContext context) {
    final dark = WildScanHelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: counterBgColor ??
                  (dark ? WildScanColors.white : WildScanColors.black),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: WildScanColors.white, fontSizeFactor: 0.8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
