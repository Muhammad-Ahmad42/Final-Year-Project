import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildscan/features/MarketPlace/all_products/all_products.dart';

class WildScanSectionHeading extends StatelessWidget {
  const WildScanSectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = 'View all',
    this.onPressed,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(
            onPressed: () {
              Get.to(() => const AllProducts());
            },
            child: Text(buttonTitle),
          ),
      ],
    );
  }
}
