import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildscan/common/widgets/bannners/promo_slider.dart';
import 'package:wildscan/common/widgets/customShapes/containers/custom_cliper.dart';
import 'package:wildscan/features/MarketPlace/home/controllers/markettplace_product_contoller.dart';
import 'package:wildscan/features/home/controller/home_controller.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/image_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.put(HomeController());

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  CustomClipperWidget(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Image.asset(
                          'assets/logos/WildScan-splash-logo-white.png',
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Welcome to WildScan',
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: WildScanColors.white,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Discover plants, protect wildlife, and trade green.',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: WildScanColors.white,
                                fontSize: 16,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        HomeSearchBar(controller, isDark),

                        const SizedBox(height: 16),
                      ],
                    ),
                  ),

                  SearchReslts(controller, isDark),

                  const SizedBox(height: 16),
                  Sliders(),

                  const SizedBox(height: 20),

                  MainGridLayout(controller, isDark),

                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Obx MainGridLayout(HomeController controller, bool isDark) {
    return Obx(() {
      final results = controller.filteredItems;
      final isSearching =
          controller.searchQuery.isNotEmpty &&
          results.length != controller.allItems.length;
      if (isSearching) return const SizedBox.shrink();

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: isDark ? Colors.grey.shade900 : Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: controller.allItems.map((item) {
                return GestureDetector(
                  onTap: () => controller.onItemTap(item),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: WildScanColors.leafGreen,
                        child: Icon(item.icon, color: Colors.white, size: 30),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item.label,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      );
    });
  }

  WildScanPromoSlider Sliders() {
    return WildScanPromoSlider(
      bannerImages: [
        WildScanImages.banner1,
        WildScanImages.banner3,
        WildScanImages.banner4,
      ],
    );
  }

  Obx SearchReslts(HomeController controller, bool isDark) {
    return Obx(() {
      final results = controller.filteredItems;
      final isSearching =
          controller.searchQuery.isNotEmpty &&
          results.length != controller.allItems.length;

      if (!isSearching) return const SizedBox.shrink();

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Card(
          color: isDark ? Colors.grey[900] : Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: results.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final item = results[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: WildScanColors.leafGreen,
                  child: Icon(item.icon, color: Colors.white),
                ),
                title: Text(item.label),
                onTap: () => controller.onItemTap(item),
              );
            },
          ),
        ),
      );
    });
  }

  Padding HomeSearchBar(HomeController controller, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(12),
        child: TextField(
          onChanged: controller.onSearchChanged,
          style: const TextStyle(fontSize: 18),
          cursorHeight: 24,
          decoration: InputDecoration(
            hintText: 'Search WildScan features...',
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: isDark ? Colors.black26 : Colors.grey.shade100,
            contentPadding: const EdgeInsets.all(18),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

class BottomProductsList extends StatelessWidget {
  const BottomProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MarketPlaceProductController>();
    return Obx(() {
      if (controller.isLoading.value) {
        return const Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(child: CircularProgressIndicator()),
        );
      }
      if (controller.products.isEmpty) {
        return const Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(child: Text('No products found in marketplace.')),
        );
      }
      // Take only first 5 products to show at bottom
      final items = controller.products.take(5).toList();
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'From Marketplace:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            ...items.map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Text(
                  "• ${e.name}",
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
