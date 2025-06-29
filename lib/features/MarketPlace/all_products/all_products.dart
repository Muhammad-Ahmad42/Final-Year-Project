import 'package:flutter/material.dart';
import 'package:wildscan/common/widgets/appbar/appbar.dart';
import 'package:wildscan/common/widgets/product/sortable/sortable_products.dart';
import 'package:wildscan/utils/constraints/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:
          WildScanAppBar(title: Text('Popular Products'), showBackArrow: true),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(WildScanSizes.defaultSpace),
            child: WildScanSortableProducts(),
          ),
        ),
      ),
    );
  }
}


