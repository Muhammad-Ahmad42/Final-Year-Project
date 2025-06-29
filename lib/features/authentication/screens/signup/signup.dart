import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildscan/common/styles/spacing_styles.dart';
import 'package:wildscan/features/authentication/screens/signup/widgets/wild_scan_signup_header.dart';
import 'package:wildscan/features/authentication/screens/widgetsLoginSignup/secondary_button.dart';
import 'package:wildscan/features/authentication/screens/widgetsLoginSignup/social_auth.dart';
import 'package:wildscan/features/authentication/screens/login/login.dart';
import 'package:wildscan/features/authentication/screens/signup/widgets/wild_scan_signup_form.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/constraints/text_strings.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WildScanHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding: WildScanSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            /// Signup Header
            WildScanSigninHeader(title: WildScanTexts.signupTitle),

            /// Signup Form
            WildScanSignUpForm(),

            // Sign In Button
            const SizedBox(height: WildScanSizes.spaceBtwItems),
            //already has a account
            WildScanSecondaryButton(
              text: WildScanTexts.alreadyHaveAnAccount,
              onPressed: () {
                Get.to(() => const LoginScreen());
              },
            ),
            const SizedBox(height: WildScanSizes.spaceBtwSections),
            // Social Login
            WildScanSocialLogin(textLoginOrSignUp: WildScanTexts.orSignUpWith),
          ],
        ),
      ),
    );
  }
}
