import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildscan/common/styles/spacing_styles.dart';
import 'package:wildscan/features/authentication/screens/widgetsLoginSignup/secondary_button.dart';
import 'package:wildscan/features/authentication/screens/login/widgets/wild_scan_login_header.dart';
import 'package:wildscan/features/authentication/screens/widgetsLoginSignup/social_auth.dart';
import 'package:wildscan/features/authentication/screens/login/widgets/wild_scan_login_form.dart';
import 'package:wildscan/features/authentication/screens/signup/signup.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/constraints/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: WildScanSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WildScanLoginHeader(title: WildScanTexts.loginTitle),
            WildScanLoginForm(),

            const SizedBox(height: WildScanSizes.spaceBtwItems),
            WildScanSecondaryButton(
              text: WildScanTexts.createAccount,
              onPressed: () {
                Get.to(() => const SignupScreen());
              },
            ),
            const SizedBox(height: WildScanSizes.spaceBtwSections),
            WildScanSocialLogin(textLoginOrSignUp: WildScanTexts.orSignInWith),
          ],
        ),
      ),
    );
  }
}
