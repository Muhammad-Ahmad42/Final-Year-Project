import 'package:flutter/material.dart';
import 'package:wildscan/common/widgets/product/cart/add_remove_button.dart';
import 'package:wildscan/common/widgets/product/cart/cart_item.dart';
import 'package:wildscan/common/widgets/texts/product_price_text.dart';
import 'package:wildscan/utils/constraints/sizes.dart';

class WildScanCartItems extends StatelessWidget {
  const WildScanCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
          const SizedBox(height: WildScanSizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          /// Cart Item
          const WildScanCartItem(),
          if (showAddRemoveButton)
            const SizedBox(height: WildScanSizes.spaceBtwItems),

          /// Add Remove Button Row with total Price
          if (showAddRemoveButton)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    /// (for the extra space)
                    SizedBox(width: 70),

                    /// Add Remove Buttons
                    WildScanProductQuantityWithAddRemoveButton(),
                  ],
                ),

                /// -- Product Total Price
                WildScanProductPriceText(price: '256'),
              ],
            ),
        ],
      ),
    );
  }
}
