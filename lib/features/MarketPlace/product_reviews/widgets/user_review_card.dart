import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:wildscan/common/widgets/customShapes/containers/rounded_container.dart';
import 'package:wildscan/common/widgets/product/ratings/rating_indicator.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/image_strings.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = WildScanHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    backgroundImage:
                        AssetImage(WildScanImages.userProfileImage1)),
                const SizedBox(width: WildScanSizes.spaceBtwItems),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: WildScanSizes.spaceBtwItems),

        /// Review
        Row(
          children: [
            const WildScanRatingBarIndicator(rating: 4),
            const SizedBox(width: WildScanSizes.spaceBtwItems),
            Text('01 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: WildScanSizes.spaceBtwItems),
        const ReadMoreText(
          'The user interface of the app is quite intuitive. I was able to navigate & make purchases seamlessly. great job!!',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
          lessStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        const SizedBox(height: WildScanSizes.spaceBtwItems),

        /// Company Review
        WildScanRoundedContainer(
            backgroundColor:
                dark ? WildScanColors.darkerGrey : WildScanColors.grey,
            child: Padding(
              padding: const EdgeInsets.all(WildScanSizes.md),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("T's Store",
                          style: Theme.of(context).textTheme.titleMedium),
                      Text("02 Nov, 2023",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: WildScanSizes.spaceBtwItems),
                  const ReadMoreText(
                    'The user interface of the app is quite intuitive. I was able to navigate & make purchases seamlessly. great job!!',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimExpandedText: ' show less',
                    trimCollapsedText: ' show more',
                    moreStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: WildScanColors.leafGreen),
                    lessStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: WildScanColors.leafGreen),
                  ),
                ],
              ),
            )),
        const SizedBox(height: WildScanSizes.spaceBtwSections),
      ],
    );
  }
}
