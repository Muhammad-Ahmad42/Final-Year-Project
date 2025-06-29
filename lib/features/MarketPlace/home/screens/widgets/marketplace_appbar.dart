import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wildscan/common/widgets/appbar/appbar.dart';
import 'package:wildscan/common/widgets/product/cart/cart_menu_icon.dart';
import 'package:wildscan/features/MarketPlace/cart/cart.dart';
import 'package:wildscan/features/MarketPlace/wishlist/screens/wishlist.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/text_strings.dart';

// all the classes related appbar in marketPlace
class WildscanHomeAppbar extends StatelessWidget {
  const WildscanHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return WildScanAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            WildScanTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: WildScanColors.grey),
          ),
          Text(
            WildScanTexts.homeAppbarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: WildScanColors.white),
          ),
        ],
      ),
      actions: [
        WildScanCartCounterIcon(
          onPressed: () {},
          iconColor: WildScanColors.white,
          counterBgColor: WildScanColors.black, counter: 3,
          // counterTextColor: WildScanColors.white,
        ),
      ],
    );
  }
}

class AppBarMarketPlace extends StatelessWidget {
  const AppBarMarketPlace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WildScanAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            WildScanTexts.homeAppbarTitle,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
          Text(
            WildScanTexts.homeAppbarSubTitle,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: WildScanColors.textWhite,
                ),
          ),
        ],
      ),
      actions: [
        WildScanCartCounterIcon(
          onPressed: () => Get.to(() => const CartScreen()),
          iconColor: Colors.white,
          counterBgColor: Colors.black,
          counterTextColor: Colors.white,
          counter: 3,
        ),
        SizedBox(
          width: 5,
        ),
        IconButton(
          onPressed: () {
            Get.to(() => FavouriteScreen());
          },
          icon: const Icon(
            Iconsax.heart5, // Or Iconsax.favorite_chart if you prefer
            color: Colors.white,
            size: 26,
          ),
          tooltip: "Wishlist",
          splashRadius: 24,
        ),
      ],
    );
  }
}
