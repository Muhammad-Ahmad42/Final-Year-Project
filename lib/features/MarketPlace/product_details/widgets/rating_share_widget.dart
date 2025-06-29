import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wildscan/utils/constraints/sizes.dart';

class WildScanRatingAndShare extends StatelessWidget {
  final double rating;
  final int reviews;
  final VoidCallback? onShare;

  const WildScanRatingAndShare({
    super.key,
    this.rating = 5.0,
    this.reviews = 199,
    this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// --- Rating
        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amber, size: 24),
            const SizedBox(width: WildScanSizes.spaceBtwItems / 2),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: rating.toStringAsFixed(1),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(text: ' ($reviews)'),
                ],
              ),
            ),
          ],
        ),

        /// --- Share Button
        IconButton(
          onPressed: onShare ?? () {}, // Allows you to pass custom share logic.
          icon: const Icon(Icons.share, size: WildScanSizes.iconMd),
        ),
      ],
    );
  }
}
