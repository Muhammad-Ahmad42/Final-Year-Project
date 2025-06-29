import 'package:flutter/material.dart';
import 'package:wildscan/common/widgets/customShapes/containers/rounded_container.dart';
import 'package:wildscan/common/widgets/texts/section_heading.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/image_strings.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class WildScanBillingPaymentSection extends StatelessWidget {
  const WildScanBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = WildScanHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        WildScanSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        const SizedBox(height: WildScanSizes.spaceBtwItems / 2),
        Row(
          children: [
            WildScanRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor:
                  dark ? WildScanColors.light : WildScanColors.white,
              padding: const EdgeInsets.all(WildScanSizes.sm),
              child: const Image(
                image: AssetImage(WildScanImages.paypal),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: WildScanSizes.spaceBtwItems / 2),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge),
          ],
        )
      ],
    );
  }
}
