import 'package:flutter/material.dart';
import 'package:wildscan/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: WildScanDeviceUtils.getAppBarHeight(),
      right: WildScanSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: const Text('Move to Last'),
      ),
    );
  }
}
