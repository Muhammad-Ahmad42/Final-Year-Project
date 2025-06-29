import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:wildscan/common/widgets/appbar/appbar.dart';
import 'package:wildscan/common/widgets/icons/wildscan_circular_icon.dart';
import 'package:wildscan/common/widgets/texts/section_heading.dart';
import 'package:wildscan/data/repositries/MarketPlace/product_model.dart';
import 'package:wildscan/features/MarketPlace/checkout/checkout.dart';
import 'package:wildscan/features/MarketPlace/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:wildscan/features/MarketPlace/product_details/widgets/product_detail_image_slider.dart';
import 'package:wildscan/features/MarketPlace/product_details/widgets/product_meta_data.dart';
import 'package:wildscan/features/MarketPlace/product_details/widgets/rating_share_widget.dart';
import 'package:wildscan/features/MarketPlace/product_reviews/product_review.dart';
import 'package:wildscan/utils/constraints/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  final String description;
  final int reviewCount;
  final ProductModel? product;

  const ProductDetailScreen({
    super.key,
    this.description =
        'This is product description for product here in the screen. This is a demo description. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque mattis nulla ante, sed bibendum justo laoreet sed. Etiam nulla enim, consectetur id nulla in, lacinia tempor ipsum.',
    this.reviewCount = 199,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const WildScanBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WildScanAppBar(
              showBackArrow: true,
              actions: [
                WildScanCircularIcon(icon: Iconsax.heart5, color: Colors.red),
              ],
              title: Text("Product Details"),
            ),

            /// - Product Image Slider
            const WildScanProductImageslider(),

            /// - Product Details
            Padding(
              padding: const EdgeInsets.only(
                right: WildScanSizes.defaultSpace,
                left: WildScanSizes.defaultSpace,
                bottom: WildScanSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// -- Rating & Share Button
                  const WildScanRatingAndShare(),

                  /// -- Price, Title, Stock, & Brand
                  const WildScanProductMetaData(),

                  /// -- Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const CheckoutScreen());
                      },
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(height: WildScanSizes.spaceBtwSections),

                  /// -- Description
                  const WildScanSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(height: WildScanSizes.spaceBtwSections),
                  ReadMoreText(
                    description,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  /// -- Reviews
                  const Divider(),
                  const SizedBox(height: WildScanSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WildScanSectionHeading(
                        title: 'Reviews($reviewCount)',
                        showActionButton: false,
                      ),
                      IconButton(
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                        onPressed: () =>
                            Get.to(() => const ProductReviewScreen()),
                      ),
                    ],
                  ),
                  const SizedBox(height: WildScanSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
