import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildscan/common/widgets/appbar/appbar.dart';
import 'package:wildscan/common/widgets/customShapes/containers/rounded_container.dart';
import 'package:wildscan/common/widgets/product/cart/coupon_widget.dart';
import 'package:wildscan/common/widgets/success_screen/success_screen.dart';
import 'package:wildscan/features/MarketPlace/cart/widgets/cart_items.dart';
import 'package:wildscan/features/MarketPlace/checkout/widgets/billing_address_section.dart';
import 'package:wildscan/features/MarketPlace/checkout/widgets/billing_amount_section.dart';
import 'package:wildscan/features/MarketPlace/checkout/widgets/billing_payment_section.dart';
import 'package:wildscan/navigation_menu.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/image_strings.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = WildScanHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: WildScanAppBar(
        showBackArrow: true,
        title: Text('Order Review',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(WildScanSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Items in Cart
              const WildScanCartItems(showAddRemoveButton: false),
              const SizedBox(height: WildScanSizes.spaceBtwSections),

              /// -- Coupon TextField
              const WildScanCouponCode(),
              const SizedBox(height: WildScanSizes.spaceBtwSections),

              /// -- Billing Section
              WildScanRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(WildScanSizes.md),
                backgroundColor:
                    dark ? WildScanColors.black : WildScanColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                    WildScanBillingAmountSection(),
                    SizedBox(height: WildScanSizes.spaceBtwItems),

                    /// Divider
                    Divider(),
                    SizedBox(height: WildScanSizes.spaceBtwItems),

                    /// Payment Methods
                    WildScanBillingPaymentSection(),
                    SizedBox(height: WildScanSizes.spaceBtwItems),

                    /// Address
                    WildScanBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(WildScanSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: WildScanImages.successfulPaymentIcon,
              title: 'Payment Success!',
              subtitle: 'Your item will be shipped soon!',
              onPressed: () => Get.offAll(() => const NavigationMenu()),
            ),
          ),
          child: const Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
