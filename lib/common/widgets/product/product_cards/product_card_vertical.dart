import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wildscan/common/styles/shadows.dart';
import 'package:wildscan/common/widgets/texts/product_price_text.dart';
import 'package:wildscan/common/widgets/texts/product_title_text.dart';
import 'package:wildscan/common/widgets/customShapes/containers/rounded_container.dart';
import 'package:wildscan/common/widgets/icons/wildscan_circular_icon.dart';
import 'package:wildscan/common/widgets/images/wildscan_rounded_image.dart';
import 'package:wildscan/data/repositries/MarketPlace/product_model.dart';
import 'package:wildscan/features/MarketPlace/product_details/product_detail.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class WildScanProductCardVertical extends StatelessWidget {
  final ProductModel? product;
  const WildScanProductCardVertical({this.product, super.key});

  @override
  Widget build(BuildContext context) {
    final dark = WildScanHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [WildScanShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(WildScanSizes.productImageRadius),
          color: dark ? WildScanColors.darkGrey : WildScanColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WildScanRoundedContainer(
              height: 140,
              width: double.infinity,
              padding: const EdgeInsets.all(WildScanSizes.sm),
              backgroundColor: dark
                  ? WildScanColors.dark
                  : WildScanColors.light,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        WildScanSizes.productImageRadius,
                      ),
                      child: WildScanRoundedImage(
                        imageUrl: product?.imageUrl ?? '',
                        fit: BoxFit.cover,
                        applyImageRadius: false,
                      ),
                    ),
                  ),
                  //          _DiscountBadge(discount: product?.discount ?? '0%'),
                  const Positioned(top: 0, right: 0, child: HeartIcon()),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: WildScanSizes.sm,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WildScanProductTitleText(title: product?.name ?? 'Unknown'),
                    const SizedBox(height: 2),
                    Text(
                      product?.description ?? 'No description available.',
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: WildScanSizes.sm),
              child: WildScanProductPriceText(
                price: (product?.price ?? '0').toString(),
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}

class _DiscountBadge extends StatelessWidget {
  final String discount;
  const _DiscountBadge({required this.discount});

  @override
  Widget build(BuildContext context) {
    if (discount == '0%' || discount.isEmpty) return const SizedBox.shrink();

    return Positioned(
      top: 10,
      left: 10,
      child: WildScanRoundedContainer(
        radius: WildScanSizes.sm,
        backgroundColor: WildScanColors.secondary.withOpacity(0.8),
        padding: const EdgeInsets.symmetric(
          horizontal: WildScanSizes.sm,
          vertical: WildScanSizes.xs,
        ),
        child: Text(
          discount,
          style: Theme.of(
            context,
          ).textTheme.labelLarge!.apply(color: WildScanColors.black),
        ),
      ),
    );
  }
}

class HeartIcon extends StatelessWidget {
  const HeartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const WildScanCircularIcon(
        icon: Iconsax.heart5,
        color: Colors.red,
      ),
    );
  }
}
