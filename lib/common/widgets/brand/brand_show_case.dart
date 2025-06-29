import 'package:flutter/material.dart';
import 'package:wildscan/common/widgets/brand/brand_card.dart';
import 'package:wildscan/common/widgets/customShapes/containers/rounded_container.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class WildScanBrandShowcase extends StatelessWidget {
  const WildScanBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return WildScanRoundedContainer(
      showBorder: true,
      borderColor: WildScanColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(WildScanSizes.md),
      margin: const EdgeInsets.only(bottom: WildScanSizes.spaceBtwItems),
      child: Column(
        children: [
          /// Brand with Products Count
          const WildScanBrandCard(showBorder: false),
          const SizedBox(height: WildScanSizes.spaceBtwItems),

          /// Brand Top 3 Product Images
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: WildScanRoundedContainer(
        height: 100,
        backgroundColor: WildScanHelperFunctions.isDarkMode(context)
            ? WildScanColors.darkerGrey
            : WildScanColors.light,
        margin: const EdgeInsets.only(right: WildScanSizes.sm),
        padding: const EdgeInsets.all(WildScanSizes.md),
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
