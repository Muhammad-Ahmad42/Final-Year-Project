import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wildscan/common/widgets/icons/wildscan_circular_icon.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class WildScanProductQuantityWithAddRemoveButton extends StatelessWidget {
  const WildScanProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        WildScanCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: WildScanSizes.md,
          color: WildScanHelperFunctions.isDarkMode(context)
              ? WildScanColors.white
              : WildScanColors.black,
          backgroundColor: WildScanHelperFunctions.isDarkMode(context)
              ? WildScanColors.darkerGrey
              : WildScanColors.light,
        ),
        const SizedBox(width: WildScanSizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: WildScanSizes.spaceBtwItems),
        const WildScanCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: WildScanSizes.md,
          color: WildScanColors.white,
          backgroundColor: WildScanColors.primary,
        ),
      ],
    );
  }
}
