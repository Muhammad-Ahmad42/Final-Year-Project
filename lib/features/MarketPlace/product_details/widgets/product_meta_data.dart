import 'package:flutter/material.dart';
import 'package:wildscan/common/widgets/customShapes/containers/rounded_container.dart';
import 'package:wildscan/common/widgets/images/wildscan_circular_image.dart';
import 'package:wildscan/common/widgets/texts/product_price_text.dart';
import 'package:wildscan/common/widgets/texts/product_title_text.dart';
import 'package:wildscan/common/widgets/texts/wildscan_brand_title_text_with_verified_icon.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/enums.dart';
import 'package:wildscan/utils/constraints/image_strings.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class WildScanProductMetaData extends StatelessWidget {
  final String saleTag;
  final String oldPrice;
  final String newPrice;
  final String title;
  final String status;
  final String sellerName;
  final String productImage;

  const WildScanProductMetaData({
    super.key,
    this.saleTag = '25%',
    this.oldPrice = '\$250',
    this.newPrice = '175',
    this.title = 'Green Home Decoration Plant',
    this.status = 'In Stock',
    this.sellerName = 'Seller Name',
    this.productImage = WildScanImages.productImage11,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = WildScanHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// -- Sale Tag
            WildScanRoundedContainer(
              radius: WildScanSizes.sm,
              backgroundColor: WildScanColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: WildScanSizes.sm, vertical: WildScanSizes.xs),
              child: Text(
                saleTag,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: WildScanColors.black),
              ),
            ),
            const SizedBox(width: WildScanSizes.spaceBtwItems),

            /// -- Price
            Text(
              oldPrice,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: WildScanSizes.spaceBtwItems),
            WildScanProductPriceText(price: newPrice, isLarge: true),
          ],
        ),
        const SizedBox(height: WildScanSizes.spaceBtwItems / 1.5),

        /// Title
        WildScanProductTitleText(title: title),
        const SizedBox(height: WildScanSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const WildScanProductTitleText(title: 'Status'),
            const SizedBox(width: WildScanSizes.spaceBtwItems),
            Text(status, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: WildScanSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            WildScanCircularImage(
              image: productImage,
              width: 32,
              height: 32,
              overlayColor:
                  darkMode ? WildScanColors.white : WildScanColors.black,
            ),
            WildScanBrandTitleWithVerifiedIcon(
              title: sellerName,
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
