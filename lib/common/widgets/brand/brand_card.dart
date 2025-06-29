import 'package:flutter/material.dart';
import 'package:wildscan/common/widgets/customShapes/containers/rounded_container.dart';
import 'package:wildscan/common/widgets/images/wildscan_circular_image.dart';
import 'package:wildscan/common/widgets/texts/wildscan_brand_title_text_with_verified_icon.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/enums.dart';
import 'package:wildscan/utils/constraints/image_strings.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class WildScanBrandCard extends StatelessWidget {
  const WildScanBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = WildScanHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,

      /// Container Design
      child: WildScanRoundedContainer(
        padding: const EdgeInsets.all(WildScanSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// --- Icon
            Flexible(
              child: WildScanCircularImage(
                image: WildScanImages.productImage1,
                isNetworkImage: false,
                backgroundColor: Colors.transparent,
                overlayColor:
                    isDark ? WildScanColors.white : WildScanColors.black,
              ),
            ),
            const SizedBox(width: WildScanSizes.spaceBtwItems / 2),

            /// --- Text
            // [Expanded] & Column [MainAxisSize.min] is important to keep the elements in the vertical center & also
            // to keep text inside the boundaries
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const WildScanBrandTitleWithVerifiedIcon(
                    title: 'Seller',
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '256 Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
