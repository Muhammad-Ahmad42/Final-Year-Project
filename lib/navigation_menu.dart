import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wildscan/features/MarketPlace/home/screens/marketplace_home/marketplace_home.dart';
import 'package:wildscan/features/Research/screen/research_collaboration.dart';
import 'package:wildscan/features/Scan/screens/image_classification_screen.dart';
import 'package:wildscan/features/home/screen/home_screen.dart';
import 'package:wildscan/features/personalization/screens/settings/setting_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  static const Color selectedBg = Color(0xFFE6F9E6);
  static const Color selectedColor = Color(0xFF77AB59);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final media = MediaQuery.of(context);
    final isLandscape = media.orientation == Orientation.landscape;
    final double navBarHeight = media.size.height * 0.075;
    final double navRailWidth = isLandscape ? 60 : media.size.width * 0.15;
    final double fabSize = navBarHeight + 12;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: isLandscape
          ? Row(
              children: [
                Expanded(
                  child: Obx(
                    () =>
                        controller.screens[controller.selectedController.value],
                  ),
                ),
                _NavigationRail(
                  controller: controller,
                  fabSize: fabSize,
                  navRailWidth: navRailWidth,
                ),
              ],
            )
          : Obx(() => controller.screens[controller.selectedController.value]),
      bottomNavigationBar: isLandscape
          ? null
          : Obx(
              () => BottomAppBar(
                color: getNavBackgroundColor(context),
                shape: const CircularNotchedRectangle(),
                notchMargin: 8.0,
                child: SizedBox(
                  height: navBarHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildNavItem(
                        context,
                        Iconsax.home,
                        "Home",
                        0,
                        controller,
                      ),
                      _buildNavItem(
                        context,
                        Icons.store,
                        "Market",
                        1,
                        controller,
                      ),
                      SizedBox(width: fabSize),
                      _buildNavItem(
                        context,
                        Iconsax.repeat,
                        "Publish",
                        3,
                        controller,
                      ),
                      _buildNavItem(
                        context,
                        Iconsax.user,
                        "User",
                        4,
                        controller,
                      ),
                    ],
                  ),
                ),
              ),
            ),
      floatingActionButton: isLandscape
          ? null
          : Obx(() {
              final isSelected = controller.selectedController.value == 2;
              return Container(
                width: fabSize,
                height: fabSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: isSelected
                          ? selectedColor.withOpacity(0.25)
                          : Colors.black12,
                      blurRadius: 16,
                      spreadRadius: 2,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Material(
                    color: getFabBackgroundColor(context, isSelected),
                    child: InkWell(
                      onTap: () => controller.selectedController.value = 2,
                      splashColor: selectedColor.withOpacity(0.18),
                      child: Icon(
                        Iconsax.scanner,
                        size: 28,
                        color: isSelected
                            ? Colors.white
                            : getUnselectedIconColor(context),
                      ),
                    ),
                  ),
                ),
              );
            }),
      floatingActionButtonLocation: isLandscape
          ? null
          : FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    String label,
    int index,
    NavigationController controller,
  ) {
    final isSelected = controller.selectedController.value == index;
    final Color unselectedColor = getUnselectedIconColor(context);

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => controller.selectedController.value = index,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: isSelected
            ? BoxDecoration(
                color: NavigationMenu.selectedBg,
                borderRadius: BorderRadius.circular(12),
              )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? NavigationMenu.selectedColor
                  : unselectedColor,
              size: 22,
            ),
            const SizedBox(height: 2),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: isSelected ? 1.0 : 0.7,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected
                      ? NavigationMenu.selectedColor
                      : unselectedColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---- Compact & Animated NavigationRail for landscape ----

class _NavigationRail extends StatelessWidget {
  final NavigationController controller;
  final double fabSize;
  final double navRailWidth;

  const _NavigationRail({
    required this.controller,
    required this.fabSize,
    required this.navRailWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: navRailWidth,
      color: getNavBackgroundColor(context),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _railReactiveItem(context, Iconsax.home, 0, controller),
          _railReactiveItem(context, Icons.store, 1, controller),
          const SizedBox(height: 18),
          // Scan (FAB)
          Obx(() {
            final isSelected = controller.selectedController.value == 2;
            return InkWell(
              onTap: () => controller.selectedController.value = 2,
              borderRadius: BorderRadius.circular(navRailWidth / 2),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: getFabBackgroundColor(context, isSelected),
                  boxShadow: [
                    BoxShadow(
                      color: isSelected
                          ? NavigationMenu.selectedColor.withOpacity(0.25)
                          : Colors.black12,
                      blurRadius: 12,
                      spreadRadius: 1,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  Iconsax.scanner,
                  size: 22,
                  color: isSelected
                      ? Colors.white
                      : getUnselectedIconColor(context),
                ),
              ),
            );
          }),
          const SizedBox(height: 18),
          _railReactiveItem(context, Iconsax.repeat, 3, controller),
          _railReactiveItem(context, Iconsax.user, 4, controller),
        ],
      ),
    );
  }

  // --- Each rail item is now reactive ---
  Widget _railReactiveItem(
    BuildContext context,
    IconData icon,
    int index,
    NavigationController controller,
  ) {
    return Obx(() {
      final isSelected = controller.selectedController.value == index;
      final Color unselectedColor = getUnselectedIconColor(context);

      return InkWell(
        onTap: () => controller.selectedController.value = index,
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: isSelected ? NavigationMenu.selectedBg : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: isSelected
                    ? NavigationMenu.selectedColor
                    : unselectedColor,
                size: 20,
              ),
              const SizedBox(height: 2),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: isSelected ? 1.0 : 0.6,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 50),
                  child: Text(
                    controller.getLabel(index),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.normal,
                      color: isSelected
                          ? NavigationMenu.selectedColor
                          : unselectedColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

// ---- Controller ----

class NavigationController extends GetxController {
  final Rx<int> selectedController = 0.obs;

  final screens = [
    const HomeScreen(),
    const MarketPlaceHome(),
    ImageClassificationScreen(),
    ResearchCollaborationScreen(),
    const SettingScreen(),
  ];

  String getLabel(int index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "Market";
      case 2:
        return "Scan";
      case 3:
        return "Publish";
      case 4:
        return "User";
      default:
        return "";
    }
  }
}

Color getUnselectedIconColor(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light
      ? Colors.black
      : Colors.white;
}

Color getNavBackgroundColor(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light
      ? const Color(0xFFE5E0E0)
      : const Color(0xFF252424);
}

Color getFabBackgroundColor(BuildContext context, bool isSelected) {
  return isSelected
      ? NavigationMenu.selectedColor
      : getNavBackgroundColor(context);
}
