import 'package:flutter/material.dart';
import 'package:wildscan/common/widgets/images/wildscan_rounded_image.dart';
import 'package:wildscan/common/widgets/texts/product_title_text.dart';
import 'package:wildscan/common/widgets/texts/wildscan_brand_title_text_with_verified_icon.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/image_strings.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class WildScanCartItem extends StatelessWidget {
  const WildScanCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        WildScanRoundedImage(
          imageUrl: WildScanImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(WildScanSizes.sm),
          backgroundColor: WildScanHelperFunctions.isDarkMode(context)
              ? WildScanColors.darkerGrey
              : WildScanColors.light,
        ),
        const SizedBox(width: WildScanSizes.spaceBtwItems),

        /// Title, Price, & Size
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WildScanBrandTitleWithVerifiedIcon(title: 'PlantSeller'),
            const Flexible(
              child: WildScanProductTitleText(
                title: 'Green Garden Plant',
                maxLines: 1,
              ),
            ),

            /// Attributes
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'Size ',
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: '08 Feet ',
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
