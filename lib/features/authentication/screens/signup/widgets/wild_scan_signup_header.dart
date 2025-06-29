import 'package:flutter/material.dart';
import 'package:wildscan/utils/constraints/image_strings.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class WildScanSigninHeader extends StatelessWidget {
  final String title;
  const WildScanSigninHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final bool dark = WildScanHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Centered App Logo
        Center(
          child: Image(
            height: 150,
            image: AssetImage(dark
                ? WildScanImages.lightAppLogo
                : WildScanImages.darkAppLogo),
          ),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
