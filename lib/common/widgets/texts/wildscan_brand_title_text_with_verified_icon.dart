import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wildscan/common/widgets/texts/wildscan_brand_title_text.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/enums.dart';
import 'package:wildscan/utils/constraints/sizes.dart';

class WildScanBrandTitleWithVerifiedIcon extends StatelessWidget {
  const WildScanBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = WildScanColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: WildScanBrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: WildScanSizes.xs),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: WildScanSizes.iconXs,
        ),
      ],
    );
  }
}
