import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildscan/features/MarketPlace/sell/sell_product.dart';
import 'package:wildscan/utils/constraints/colors.dart';

class SellText extends StatelessWidget {
  const SellText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const SellProduct());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "sell",
            style: TextStyle(fontSize: 18, color: WildScanColors.white),
          ),
          Icon(
            Icons.sell_outlined,
            color: Colors.white,
            size: 20,
          )
        ],
      ),
    );
  }
}
