import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildscan/features/MarketPlace/all_products/all_products.dart';
import 'package:wildscan/features/MarketPlace/cart/cart.dart';
import 'package:wildscan/features/MarketPlace/order/order.dart';
import 'package:wildscan/features/Scan/screens/image_classification_screen.dart';
import 'package:wildscan/features/home/screen/Feedback.dart';
import 'package:wildscan/features/home/screen/maps_screen.dart';
import 'package:wildscan/features/personalization/screens/profile/profile.dart';
import 'package:wildscan/features/personalization/screens/settings/setting_screen.dart';

class GridItem {
  final String label;
  final IconData icon;
  final Widget screen;

  GridItem({required this.label, required this.icon, required this.screen});
}

class HomeController extends GetxController {
  final searchQuery = ''.obs;

  final List<GridItem> allItems = [
    GridItem(
      label: 'Scan',
      icon: Icons.camera_alt,
      screen: ImageClassificationScreen(),
    ),
    GridItem(label: 'Map', icon: Icons.map, screen: MapsScreen()),
    GridItem(
      label: 'Market',
      icon: Icons.shopping_bag,
      screen: const AllProducts(),
    ),
    GridItem(label: 'Orders', icon: Icons.eco, screen: const OrderScreen()),
    GridItem(
      label: 'Cart',
      icon: Icons.shopping_cart,
      screen: const CartScreen(),
    ),
    GridItem(
      label: 'Settings',
      icon: Icons.settings,
      screen: const SettingScreen(),
    ),
    GridItem(label: 'Profile', icon: Icons.person, screen: ProfileScreen()),
    GridItem(label: 'Saved', icon: Icons.bookmark, screen: const Placeholder()),
    GridItem(
      label: 'Feedback',
      icon: Icons.help_outline,
      screen: FeedbackScreen(),
    ),
  ];

  List<GridItem> get filteredItems {
    if (searchQuery.isEmpty) return allItems;
    return allItems
        .where(
          (item) => item.label.toLowerCase().contains(
            searchQuery.value.toLowerCase(),
          ),
        )
        .toList();
  }

  void onSearchChanged(String query) {
    searchQuery.value = query;
  }

  void onItemTap(GridItem item) {
    Get.to(() => item.screen);
  }
}
