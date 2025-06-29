import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wildscan/common/widgets/appbar/appbar.dart';
import 'package:wildscan/features/personalization/screens/address/add_new_address.dart';
import 'package:wildscan/features/personalization/screens/address/widgets/single_address.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/sizes.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: WildScanColors.leafGreen,
        child: const Icon(
          Iconsax.add,
          color: WildScanColors.white,
        ),
      ),
      appBar: WildScanAppBar(
        showBackArrow: true,
        title:
            Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(WildScanSizes.defaultSpace),
          child: Column(
            children: [
              WildScanSingleAddress(selectedAddress: true),
              WildScanSingleAddress(selectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}
