import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wildscan/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/constraints/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(WildScanSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(
              WildScanTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: WildScanSizes.spaceBtwItems),
            Text(
              WildScanTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: WildScanSizes.spaceBtwSections * 2),

            /// Text Field
            TextFormField(
              decoration: const InputDecoration(
                labelText: WildScanTexts.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),
            const SizedBox(height: WildScanSizes.spaceBtwSections),

            /// Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const ResetPassword()),
                // if don't want go back to the forget password screen & go to the login screen
                // onPressed: () => Get.to(() => const ResetPassword()),
                child: const Text(WildScanTexts.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
