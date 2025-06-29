import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wildscan/common/widgets/appbar/appbar.dart';
import 'package:wildscan/common/widgets/icons/wildscan_circular_icon.dart';
import 'package:wildscan/common/widgets/layouts/grid_layout.dart';
import 'package:wildscan/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:wildscan/data/repositries/MarketPlace/product_model.dart'; // Import your ProductModel

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example: fetch your favorites list from a controller or provider
    // Replace with your actual source!
    final RxList<ProductModel> favoriteProducts = <ProductModel>[].obs;

    return Scaffold(
      appBar: WildScanAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
        actions: [WildScanCircularIcon(icon: Iconsax.add, onPressed: () {})],
      ),
      body: Obx(() {
        if (favoriteProducts.isEmpty) {
          return const Center(child: Text("No favorite products yet."));
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: WildScanGridLayout(
              itemCount: favoriteProducts.length,
              itemBuilder: (_, index) =>
                  WildScanProductCardVertical(product: favoriteProducts[index]),
            ),
          ),
        );
      }),
    );
  }
}
