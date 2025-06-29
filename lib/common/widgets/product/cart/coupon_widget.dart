import 'package:flutter/material.dart';
import 'package:wildscan/common/widgets/customShapes/containers/rounded_container.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class WildScanCouponCode extends StatelessWidget {
  const WildScanCouponCode({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = WildScanHelperFunctions.isDarkMode(context);

    return WildScanRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? WildScanColors.dark : WildScanColors.white,
      padding: const EdgeInsets.only(
        top: WildScanSizes.sm,
        bottom: WildScanSizes.sm,
        right: WildScanSizes.sm,
        left: WildScanSizes.md,
      ),
      child: Row(
        children: [
          /// TextField
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          /// Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: dark
                    ? WildScanColors.white.withOpacity(0.5)
                    : WildScanColors.dark.withOpacity(0.5),
                backgroundColor: WildScanColors.grey.withOpacity(0.2),
                side: BorderSide(color: Colors.grey.withOpacity(0.1)),
              ),
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
