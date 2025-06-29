import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildscan/features/MarketPlace/product_details/product_detail.dart';
import 'package:wildscan/features/MarketPlace/sell/sell_product.dart';
import 'package:wildscan/features/authentication/screens/login/login.dart';
import 'package:wildscan/navigation_menu.dart';
import 'package:wildscan/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WildScan",
      theme: WildScanAppTheme.lightTheme,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const NavigationMenu()),
        GetPage(
          name: '/ProductDetailScreen',
          page: () => const ProductDetailScreen(),
        ),
        GetPage(name: '/SellProduct', page: () => const SellProduct()),
      ],
      home: const LoginScreen(),
    );
  }
}
