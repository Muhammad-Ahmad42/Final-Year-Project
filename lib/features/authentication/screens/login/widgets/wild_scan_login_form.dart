import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wildscan/common/widgets/buttons/primary_button.dart';
import 'package:wildscan/common/widgets/decorations/input_decoration.dart';
import 'package:wildscan/features/authentication/controllers/login/login_controller.dart';
import 'package:wildscan/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/constraints/text_strings.dart';
import 'package:wildscan/utils/validators/validation.dart';

class WildScanLoginForm extends StatelessWidget {
  const WildScanLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = Get.put(LoginController());

    return SingleChildScrollView(
      child: Form(
        key: controller.loginFormKey,
        onChanged: controller.checkFormCompletion,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: WildScanSizes.spaceBtwSections,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Email
              TextFormField(
                controller: controller.email,
                validator: WildScanValidator.validateEmail,
                keyboardType: TextInputType.emailAddress,
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

              const SizedBox(height: WildScanSizes.spaceBtwInputFields / 2),

              /// Remember Me & Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Row(
                      children: [
                        Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) =>
                              controller.rememberMe.value = value ?? false,
                        ),
                        const Text(WildScanTexts.rememberMe),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(WildScanTexts.forgetPassword),
                  ),
                ],
              ),

              /// Sign In Button
              Obx(
                () => WildScanPrimaryButton(
                  text: WildScanTexts.signIn,
                  onPressed: controller.isFormFilled.value
                      ? () {
                          if (controller.loginFormKey.currentState!
                              .validate()) {
                            controller.emailAndPasswordSignIn();
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
