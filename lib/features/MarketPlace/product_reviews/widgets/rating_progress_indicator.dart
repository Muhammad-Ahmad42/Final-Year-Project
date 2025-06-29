import 'package:flutter/material.dart';
import 'package:wildscan/features/MarketPlace/product_reviews/widgets/progress_indicator_and_rating.dart';

class WildScanOverallProductRating extends StatelessWidget {
  const WildScanOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.8',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              WildScanRatingProgressIndicator(text: '5', value: 1.0),
              WildScanRatingProgressIndicator(text: '4', value: 0.8),
              WildScanRatingProgressIndicator(text: '3', value: 0.6),
              WildScanRatingProgressIndicator(text: '2', value: 0.4),
              WildScanRatingProgressIndicator(text: '1', value: 0.2),
            ],
          ),
        ),
      ],
    );
  }
}
