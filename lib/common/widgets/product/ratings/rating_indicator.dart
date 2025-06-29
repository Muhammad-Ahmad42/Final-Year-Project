import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wildscan/utils/constraints/colors.dart';

class WildScanRatingBarIndicator extends StatelessWidget {
  const WildScanRatingBarIndicator({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 20,
      unratedColor: WildScanColors.grey,
      itemBuilder: (_, __) =>
          const Icon(Iconsax.star1, color: Color.fromARGB(255, 32, 158, 74)),
    );
  }
}
