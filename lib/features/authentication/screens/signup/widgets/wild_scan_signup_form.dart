import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wildscan/common/widgets/buttons/primary_button.dart';
import 'package:wildscan/common/widgets/decorations/input_decoration.dart';
import 'package:wildscan/features/authentication/controllers/signup/signup_controller.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/constraints/text_strings.dart';
import 'package:wildscan/utils/validators/validation.dart';

class WildScanSignUpForm extends StatelessWidget {
  const WildScanSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = Get.put(SignupController());

    return SingleChildScrollView(
      child: Form(
        key: controller.signupFormKey,
        onChanged: controller.checkFormCompletion,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: WildScanSizes.spaceBtwSections,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Username
              TextFormField(
                controller: controller.username,
                validator: (value) =>
                    WildScanValidator.validateEmptyText("Username", value),
                cursorColor: WildScanColors.black,
                style: theme.textTheme.bodyMedium,
                decoration: WildScanInputDecoration.inputDecoration(
                  context,
                  WildScanTexts.userName,
                  Iconsax.user,
                ),
              ),

              const SizedBox(height: WildScanSizes.spaceBtwInputFields),

              /// Email
              TextFormField(
                controller: controller.email,
                validator: WildScanValidator.validateEmail,
                cursorColor: WildScanColors.black,
                style: theme.textTheme.bodyMedium,
                decoration: WildScanInputDecoration.inputDecoration(
                  context,
                  WildScanTexts.email,
                  Iconsax.direct_right,
                ),
              ),

              const SizedBox(height: WildScanSizes.spaceBtwInputFields),

              /// Password
              Obx(
                () => TextFormField(
                  controller: controller.password,
                  validator: WildScanValidator.validatePassword,
                  obscureText: controller.isPasswordHidden.value,
                  cursorColor: WildScanColors.black,
                  style: theme.textTheme.bodyMedium,
                  decoration:
                      WildScanInputDecoration.inputDecoration(
                        context,
                        WildScanTexts.password,
                        Iconsax.password_check,
                      ).copyWith(
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isPasswordHidden.value
                                ? Iconsax.eye_slash
                                : Iconsax.eye,
                          ),
                          onPressed: controller.togglePasswordVisibility,
                        ),
                      ),
                ),
              ),

              const SizedBox(height: WildScanSizes.spaceBtwInputFields),

              /// Confirm Password
              Obx(
                () => TextFormField(
                  controller: controller.confirmPassword,
                  validator: (value) =>
                      WildScanValidator.validateConfirmPassword(
                        controller.password.text,
                        value,
                      ),
                  obscureText: controller.isConfirmPasswordHidden.value,
                  cursorColor: WildScanColors.black,
                  style: theme.textTheme.bodyMedium,
                  decoration:
                      WildScanInputDecoration.inputDecoration(
                        context,
                        WildScanTexts.confirmPassword,
                        Iconsax.password_check,
                      ).copyWith(
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isConfirmPasswordHidden.value
                                ? Iconsax.eye_slash
                                : Iconsax.eye,
                          ),
                          onPressed: controller.toggleConfirmPasswordVisibility,
                        ),
                      ),
                ),
              ),

              const SizedBox(height: WildScanSizes.spaceBtwInputFields / 2),

              /// Privacy Policy
              Obx(
                () => Row(
                  children: [
                    Checkbox(
                      value: controller.privacyPolicy.value,
                      onChanged: (value) {
                        controller.privacyPolicy.value = value!;
                        controller.checkFormCompletion();
                      },
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: theme.textTheme.bodySmall,
                          children: [
                            const TextSpan(text: 'I agree to the '),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                color: theme.colorScheme.primary,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                            const TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Terms of Use',
                              style: TextStyle(
                                color: theme.colorScheme.primary,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              /// Sign Up Button
              Obx(
                () => WildScanPrimaryButton(
                  text: WildScanTexts.signUp,
                  onPressed: controller.isFormFilled.value
                      ? () {
                          if (controller.signupFormKey.currentState!
                              .validate()) {
                            controller.signup();
                          }
                        }
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
