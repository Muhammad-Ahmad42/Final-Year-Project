import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wildscan/common/widgets/customShapes/containers/rounded_container.dart';
import 'package:wildscan/common/widgets/icons/wildscan_circular_icon.dart';
import 'package:wildscan/common/widgets/images/wildscan_rounded_image.dart';
import 'package:wildscan/common/widgets/texts/product_price_text.dart';
import 'package:wildscan/common/widgets/texts/product_title_text.dart';
import 'package:wildscan/common/widgets/texts/wildscan_brand_title_text_with_verified_icon.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/image_strings.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class WildScanProductCardHorizontal extends StatelessWidget {
  const WildScanProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = WildScanHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(WildScanSizes.productImageRadius),
        color: dark ? WildScanColors.darkerGrey : WildScanColors.softGrey,
      ),
      child: Row(
        children: [
          /// Thumbnail
          WildScanRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(WildScanSizes.sm),
            backgroundColor: dark ? WildScanColors.dark : WildScanColors.light,
            child: Stack(
              children: [
                /// -- Thumbnail Image
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: WildScanRoundedImage(
                    imageUrl: WildScanImages.productImage1,
                    applyImageRadius: true,
                  ),
                ),

                Positioned(
                  top: 12,
                  child: WildScanRoundedContainer(
                    radius: WildScanSizes.sm,
                    backgroundColor: WildScanColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: WildScanSizes.sm,
                        vertical: WildScanSizes.xs),
                    child: Text(
                      '25%',
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                            color: WildScanColors.black,
                          ),
                    ),
                  ),
                ),

                /// -- Favorite Icon Button
                const Positioned(
                  top: 0,
                  right: 0,
                  child: WildScanCircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),

          /// Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: WildScanSizes.sm, left: WildScanSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WildScanProductTitleText(
                        title: 'Green Nike Half Sleeves Shirt',
                        smallSize: true,
                      ),
                      SizedBox(height: WildScanSizes.spaceBtwItems / 2),
                      WildScanBrandTitleWithVerifiedIcon(title: 'Nike'),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Pricing
                      const Flexible(
                          child: WildScanProductPriceText(price: '256.0')),

                      /// Add to Cart Button
                      Container(
                        decoration: const BoxDecoration(
                          color: WildScanColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(WildScanSizes.cardRadiusMd),
                            bottomRight: Radius.circular(
                                WildScanSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: WildScanSizes.iconLg * 1.2,
                          height: WildScanSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: WildScanColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
