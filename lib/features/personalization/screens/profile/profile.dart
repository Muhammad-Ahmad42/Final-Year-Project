import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildscan/common/widgets/appbar/appbar.dart';
import 'package:wildscan/features/personalization/controllers/user_controller.dart';
import 'package:wildscan/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:wildscan/utils/constraints/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());

    return Scaffold(
      appBar: const WildScanAppBar(showBackArrow: true, title: Text('Profile')),
      body: Obx(() {
        final user = userController.user.value;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(WildScanSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Image
              Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: user.profilePictureBytes != null
                        ? MemoryImage(user.profilePictureBytes!)
                        : const AssetImage("assets/images/content/user.png")
                              as ImageProvider,
                  ),
                  TextButton(
                    onPressed: () => userController.updateProfilePicture(),
                    child: const Text("Change Profile Picture"),
                  ),
                ],
              ),

              const Divider(),
              const SizedBox(height: WildScanSizes.spaceBtwItems),

              /// Profile Info
              WildScanProfileMenu(
                title: 'Name',
                value: user.username.isNotEmpty ? user.username : 'Anonymous',
                onPressed: () {},
                showIcon: false,
              ),
              WildScanProfileMenu(
                title: 'Email',
                value: user.email.isNotEmpty ? user.email : 'Unknown',
                onPressed: () {},
                showIcon: false,
              ),
              WildScanProfileMenu(
                title: 'Location',
                value: (user.location?.city.isNotEmpty ?? false)
                    ? user.location!.city
                    : 'Unknown',
                onPressed: () {},
                showIcon: false,
              ),
              WildScanProfileMenu(
                title: 'Joined Date',
                value: user.joinedDate.toString().split(' ').first,
                onPressed: () {},
                showIcon: false,
              ),

              const Divider(),
              TextButton(
                onPressed: () => Get.back(),
                child: const Text(
                  "Close Account",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
