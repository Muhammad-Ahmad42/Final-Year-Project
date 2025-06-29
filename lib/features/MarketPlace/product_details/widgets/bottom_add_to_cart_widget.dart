import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wildscan/common/widgets/icons/wildscan_circular_icon.dart';
import 'package:wildscan/features/MarketPlace/cart/cart.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class WildScanBottomAddToCart extends StatelessWidget {
  const WildScanBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = WildScanHelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: WildScanSizes.defaultSpace,
          vertical: WildScanSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? WildScanColors.darkerGrey : WildScanColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(WildScanSizes.cardRadiusLg),
          topRight: Radius.circular(WildScanSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const WildScanCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: WildScanColors.darkGrey,
                width: 40,
                height: 40,
                color: WildScanColors.white,
              ),
              const SizedBox(width: WildScanSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: WildScanSizes.spaceBtwItems),
              const WildScanCircularIcon(
                icon: Iconsax.add,
                backgroundColor: WildScanColors.black,
                width: 40,
                height: 40,
                color: WildScanColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const CartScreen());
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(WildScanSizes.md),
              backgroundColor: WildScanColors.black,
              side: const BorderSide(color: WildScanColors.black),
            ),
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
