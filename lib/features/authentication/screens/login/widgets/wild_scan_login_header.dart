import 'package:flutter/material.dart';
import 'package:wildscan/utils/constraints/image_strings.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class WildScanLoginHeader extends StatelessWidget {
  final String title;
  const WildScanLoginHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final bool dark = WildScanHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image(
            height: 150,
            image: AssetImage(
              dark ? WildScanImages.lightAppLogo : WildScanImages.darkAppLogo,
            ),
          ),
        ),
        const SizedBox(height: WildScanSizes.spaceBtwSections),

        // Login Title
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
      ],
    );
  }
}
