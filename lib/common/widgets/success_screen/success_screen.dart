import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wildscan/common/styles/spacing_styles.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/constraints/text_strings.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    this.isLottie = false,
  });

  final String image, title, subtitle;
  final VoidCallback onPressed;
  final bool isLottie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: WildScanSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              /// Image or Lottie Animation
              isLottie
                  ? SizedBox(
                      width: WildScanHelperFunctions.screenWidth() * 0.6,
                      child: Lottie.asset(image),
                    )
                  : Image(
                      image: AssetImage(image),
                      width: WildScanHelperFunctions.screenWidth() * 0.6,
                    ),

              const SizedBox(height: WildScanSizes.spaceBtwSections),

              /// Title & Subtitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: WildScanSizes.spaceBtwItems),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: WildScanSizes.spaceBtwSections),

              /// Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(WildScanTexts.tContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
