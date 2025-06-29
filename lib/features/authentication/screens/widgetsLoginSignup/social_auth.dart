import 'package:flutter/material.dart';
import 'package:wildscan/utils/constraints/image_strings.dart';
import 'package:wildscan/utils/constraints/sizes.dart';

class WildScanSocialLogin extends StatelessWidget {
  final String textLoginOrSignUp;

  const WildScanSocialLogin({
    super.key,
    required this.textLoginOrSignUp,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Divider(
                color: theme.dividerColor,
                thickness: 0.5,
                indent: 60,
                endIndent: 5,
              ),
            ),
            Text(
              textLoginOrSignUp,
              style: theme.textTheme.bodyMedium,
            ),
            Flexible(
              child: Divider(
                color: theme.dividerColor,
                thickness: 0.5,
                indent: 5,
                endIndent: 60,
              ),
            ),
          ],
        ),
        const SizedBox(height: WildScanSizes.spaceBtwItems),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            socialIconButton(context, WildScanImages.google, () {
              print("Social login with Google");
            }),
            const SizedBox(width: WildScanSizes.spaceBtwItems),
            socialIconButton(context, WildScanImages.facebook, () {
              print("Social login with Facebook");
            }),
          ],
        ),
      ],
    );
  }

  Widget socialIconButton(
      BuildContext context, String imagePath, VoidCallback onPressed) {
    final theme = Theme.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: theme.dividerColor),
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          imagePath,
          width: WildScanSizes.iconMd,
          height: WildScanSizes.iconMd,
        ),
      ),
    );
  }
}
