import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildscan/common/widgets/brand/brand_show_case.dart';
import 'package:wildscan/common/widgets/layouts/grid_layout.dart';
import 'package:wildscan/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:wildscan/features/MarketPlace/Store/controllers/marketplace_product_controller.dart';
import 'package:wildscan/utils/constraints/image_strings.dart';
import 'package:wildscan/utils/constraints/sizes.dart';

class WildScanCategoryTab extends StatelessWidget {
  final String category;
  const WildScanCategoryTab({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MarketPlaceProductController>();
    return Obx(() {
      final products = controller.getProductsByCategory(category);
      return SingleChildScrollView(
        padding: const EdgeInsets.all(WildScanSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WildScanBrandShowcase(
              images: [
                WildScanImages.productImage3,
                WildScanImages.productImage2,
                WildScanImages.productImage1,
              ],
            ),
            const SizedBox(height: WildScanSizes.spaceBtwItems),
            WildScanGridLayout(
              itemCount: products.length,
              itemBuilder: (_, index) =>
                  WildScanProductCardVertical(product: products[index]),
            ),
            const SizedBox(height: WildScanSizes.spaceBtwSections),
          ],
        ),
      );
    });
  }
}
