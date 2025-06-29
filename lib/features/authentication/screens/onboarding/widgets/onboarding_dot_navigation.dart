import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wildscan/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/device/device_utility.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = WildScanHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: WildScanDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: WildScanSizes.defaultSpace,
      child: SmoothPageIndicator(
        count: 3,
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? WildScanColors.light : WildScanColors.dark,
          dotHeight: 6,
        ),
      ),
    );
  }
}
