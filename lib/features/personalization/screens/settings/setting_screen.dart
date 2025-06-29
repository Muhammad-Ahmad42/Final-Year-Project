import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wildscan/common/widgets/appbar/appbar.dart';
import 'package:wildscan/common/widgets/customShapes/containers/primary_header_container.dart';
import 'package:wildscan/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:wildscan/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:wildscan/common/widgets/texts/section_heading.dart';
import 'package:wildscan/data/repositries/authentication/authentication_repository.dart';
import 'package:wildscan/features/MarketPlace/cart/cart.dart';
import 'package:wildscan/features/MarketPlace/order/order.dart';
import 'package:wildscan/features/personalization/screens/address/address.dart';
import 'package:wildscan/features/personalization/screens/profile/profile.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/sizes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            WildScanPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WildScanAppBar(
                    title: Text(
                      "Account",
                      style: Theme.of(context).textTheme.headlineMedium!.apply(
                        color: WildScanColors.white,
                      ),
                    ),
                  ),
                  WildScanUserProfileTile(
                    onPressed: () => Get.to(() => ProfileScreen()),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(WildScanSizes.defaultSpace),
              child: Column(
                children: [
                  const WildScanSectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: WildScanSizes.spaceBtwItems),

                  WildScanSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subTitle: 'Set shopping addresses',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  WildScanSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'Add, remove products & move to checkout',
                    onTap: () => Get.to(() => const CartScreen()),
                  ),
                  WildScanSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'In-progress & completed orders',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  const WildScanSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subTitle: 'Withdraw balance to registered bank account',
                  ),
                  const WildScanSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle: 'List of all discount coupons',
                  ),
                  const WildScanSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle: 'Set any kind of notification message',
                  ),
                  const WildScanSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: 'Manage data usage & connected accounts',
                  ),

                  const SizedBox(height: WildScanSizes.spaceBtwSections),
                  const WildScanSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: WildScanSizes.spaceBtwItems),
                  const WildScanSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle: 'Upload Data to your Cloud Firestore',
                  ),
                  WildScanSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  WildScanSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  WildScanSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  /// --- Logout Button
                  const SizedBox(height: WildScanSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        Get.defaultDialog(
                          title: 'Logout',
                          middleText: 'Are you sure you want to logout?',
                          textConfirm: 'Yes',
                          textCancel: 'No',
                          confirmTextColor: WildScanColors.leafGreen,
                          onConfirm: () async {
                            Get.back();
                            await AuthenticationRepository.instance.logout();
                          },
                        );
                      },

                      child: const Text('Logout'),
                    ),
                  ),
                  const SizedBox(height: WildScanSizes.spaceBtwSections * 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
