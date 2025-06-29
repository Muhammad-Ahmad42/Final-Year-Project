import 'package:flutter/material.dart';
import 'package:wildscan/common/widgets/appbar/appbar.dart';
import 'package:wildscan/features/MarketPlace/order/widgets/orders_list.dart';
import 'package:wildscan/utils/constraints/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- AppBar
      appBar: WildScanAppBar(
        title:
            Text('My Orders', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(WildScanSizes.defaultSpace),

        /// -- Orders
        child: WildScanOrderListItems(),
      ),
    );
  }
}
