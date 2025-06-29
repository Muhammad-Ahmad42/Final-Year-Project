import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildscan/common/widgets/customShapes/containers/custom_cliper.dart';
import 'package:wildscan/common/widgets/layouts/grid_layout.dart';
import 'package:wildscan/features/MarketPlace/Store/controllers/marketplace_product_controller.dart';
import 'package:wildscan/features/MarketPlace/Store/screens/store.dart';
import 'package:wildscan/features/MarketPlace/home/screens/widgets/marketplace_appbar.dart';
import 'package:wildscan/features/MarketPlace/home/screens/widgets/popular_categories.dart';
import 'package:wildscan/common/widgets/bannners/promo_slider.dart';
import 'package:wildscan/features/MarketPlace/home/screens/widgets/sale_text.dart';
import 'package:wildscan/features/MarketPlace/home/screens/widgets/search_bar_marketplce.dart';
import 'package:wildscan/utils/constraints/image_strings.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/common/widgets/product/product_cards/product_card_vertical.dart';

class MarketPlaceHome extends StatelessWidget {
  const MarketPlaceHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Register the controller once here
    final productController = Get.put(MarketPlaceProductController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomClipperWidget(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppBarMarketPlace(),
                  SearchBarMarketPlace(),
                  SellText(),
                  const SizedBox(height: WildScanSizes.spaceBtwItems),
                  PopularCategories(),
                ],
              ),
            ),

            // Promo slider
            WildScanPromoSlider(
              bannerImages: [
                WildScanImages.banner5,
                WildScanImages.banner2,
                WildScanImages.banner3,
              ],
            ),

            // See more button
            SeeMoreButton(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Padding SeeMoreButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => const MarketPlaceStoreScreen());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: const Text('See More', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
