import 'package:flutter/material.dart';
import 'package:wildscan/common/widgets/appbar/appbar.dart';
import 'package:wildscan/common/widgets/product/ratings/rating_indicator.dart';
import 'package:wildscan/features/MarketPlace/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:wildscan/features/MarketPlace/product_reviews/widgets/user_review_card.dart';
import 'package:wildscan/utils/constraints/sizes.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- Appbar
      appBar: const WildScanAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(WildScanSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings & reviews are verified and are from people who use the same type of device that you use'),
              const SizedBox(height: WildScanSizes.spaceBtwItems),

              /// Overall Product Ratings
              const WildScanOverallProductRating(),
              const WildScanRatingBarIndicator(rating: 3.5),
              Text('12,612', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: WildScanSizes.spaceBtwSections),

              /// User Reviews List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
