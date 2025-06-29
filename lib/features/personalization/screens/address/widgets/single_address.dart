import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wildscan/common/widgets/customShapes/containers/rounded_container.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class WildScanSingleAddress extends StatelessWidget {
  const WildScanSingleAddress({
    super.key,
    required this.selectedAddress,
  });

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = WildScanHelperFunctions.isDarkMode(context);

    return WildScanRoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: const EdgeInsets.all(WildScanSizes.md),
      backgroundColor:
          selectedAddress ? WildScanColors.leafGreen : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? WildScanColors.darkerGrey
              : WildScanColors.grey,
      margin: const EdgeInsets.only(bottom: WildScanSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? WildScanColors.light
                      : WildScanColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ahmad Khan',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: WildScanSizes.sm / 2),
              const Text(
                '0300 456 7764',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: WildScanSizes.sm / 2),
              const Text(
                '82365 Sector, South Johar, Lahore, 87655, Pakistan',
                softWrap: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
