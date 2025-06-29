import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildscan/common/widgets/appbar/appbar.dart';
import 'package:wildscan/common/widgets/appbar/search_bar.dart';
import 'package:wildscan/common/widgets/appbar/tabbar.dart';
import 'package:wildscan/common/widgets/product/cart/cart_menu_icon.dart';
import 'package:wildscan/common/widgets/texts/section_heading.dart';
import 'package:wildscan/features/MarketPlace/Store/controllers/marketplace_product_controller.dart';
import 'package:wildscan/features/MarketPlace/Store/screens/widgets/category_tab.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class MarketPlaceStoreScreen extends StatelessWidget {
  const MarketPlaceStoreScreen({super.key});

  static const List<String> categories = [
    'trees',
    'herbs',
    'fruits',
    'fungi',
    'vegetables',
  ];

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<MarketPlaceProductController>()) {
      Get.put(MarketPlaceProductController());
    }

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        /// Appbar
        appBar: WildScanAppBar(
          showBackArrow: true,
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [WildScanCartCounterIcon(onPressed: () {}, counter: 3)],
        ),
        body: NestedScrollView(
          /// Header
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: WildScanHelperFunctions.isDarkMode(context)
                    ? WildScanColors.black
                    : WildScanColors.white,
                expandedHeight: MediaQuery.of(context).size.height * 0.18,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// -- Search Bar
                      const WildScanSearchBar(
                        hintText: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),

                      /// -- Featured Brands
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: WildScanSectionHeading(
                          title: 'You might like',
                          showActionButton: true,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),

                /// Tabs
                bottom: const WildScanTabBar(
                  tabs: [
                    Tab(child: Text('Trees')),
                    Tab(child: Text('Herbs')),
                    Tab(child: Text('Fruits')),
                    Tab(child: Text('Fungi')),
                    Tab(child: Text('Vegetables')),
                  ],
                ),
              ),
            ];
          },

          /// -- Body
          body: TabBarView(
            children: [
              for (final category in categories)
                WildScanCategoryTab(category: category),
            ],
          ),
        ),
      ),
    );
  }
}
