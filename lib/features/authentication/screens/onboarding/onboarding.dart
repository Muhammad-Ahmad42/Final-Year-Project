import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildscan/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:wildscan/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:wildscan/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:wildscan/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:wildscan/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:wildscan/utils/constraints/image_strings.dart';
import 'package:wildscan/utils/constraints/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: WildScanImages.onBoardingImage1,
                title: WildScanTexts.onBoardingTitle1,
                subTitle: WildScanTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: WildScanImages.onBoardingImage2,
                title: WildScanTexts.onBoardingTitle2,
                subTitle: WildScanTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: WildScanImages.onBoardingImage3,
                title: WildScanTexts.onBoardingTitle3,
                subTitle: WildScanTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
