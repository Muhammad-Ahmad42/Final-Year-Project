import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildscan/common/widgets/appbar/appbar.dart';
import 'package:wildscan/features/MarketPlace/cart/widgets/cart_items.dart';
import 'package:wildscan/features/MarketPlace/checkout/checkout.dart';
import 'package:wildscan/utils/constraints/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WildScanAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const Padding(
          padding: EdgeInsets.all(WildScanSizes.defaultSpace),

          /// Items in Cart
          child: WildScanCartItems()),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(WildScanSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child: const Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
