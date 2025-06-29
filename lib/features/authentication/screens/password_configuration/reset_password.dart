import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildscan/utils/constraints/image_strings.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/constraints/text_strings.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(WildScanSizes.defaultSpace),
          child: Column(
            children: [
              /// Image with 60% of screen width
              Image(
                image: const AssetImage(
                  WildScanImages.deliveredEmailIllustration,
                ),
                width: WildScanHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: WildScanSizes.spaceBtwSections),

              /// Title & Subtitle
              Text(
                WildScanTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: WildScanSizes.spaceBtwItems),
              Text(
                WildScanTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: WildScanSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(WildScanTexts.done),
                ),
              ),
              const SizedBox(height: WildScanSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(WildScanTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
