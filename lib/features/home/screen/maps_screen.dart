import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildscan/common/widgets/appbar/appbar.dart';
import 'package:wildscan/features/home/controller/maps_controller.dart';
import 'package:wildscan/utils/constraints/colors.dart';

class MapsScreen extends StatelessWidget {
  MapsScreen({super.key});
  final controller = Get.put(SpeciesController());

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: isDark
          ? WildScanColors.dark
          : WildScanColors.primaryBackground,
      appBar: WildScanAppBar(
        title: Text(
          'Wildlife Locations',
          style: TextStyle(
            fontSize: 24 * textScaleFactor,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.5,
          ),
        ),
        showBackArrow: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Hero Header Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
                vertical: size.height * 0.02,
              ),
              decoration: BoxDecoration(
                gradient: isDark
                    ? WildScanColors.primaryGradientDark
                    : WildScanColors.primaryGradientLight,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
                boxShadow: [
                  BoxShadow(
                    color: isDark
                        ? WildScanColors.black.withOpacity(0.3)
                        : WildScanColors.appBarLightGreen.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              WildScanColors.skyBlue.withOpacity(0.3),
                              WildScanColors.leafGreen.withOpacity(0.2),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          Icons.eco,
                          color: WildScanColors.appBarLightGreen,
                          size: 28 * textScaleFactor,
                        ),
                      ),
                      SizedBox(width: size.width * 0.04),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Discover Wildlife',
                              style: TextStyle(
                                fontSize: 20 * textScaleFactor,
                                fontWeight: FontWeight.w700,
                                color: WildScanColors.textPrimary,
                                letterSpacing: 0.3,
                              ),
                            ),
                            Text(
                              'Explore species and their habitats',
                              style: TextStyle(
                                fontSize: 14 * textScaleFactor,
                                fontWeight: FontWeight.w400,
                                color: WildScanColors.textSecondary,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.025),

                  // Enhanced Search Bar
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: isDark
                              ? WildScanColors.black.withOpacity(0.3)
                              : WildScanColors.leafGreen.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: controller.searchController,
                      onChanged: (val) => controller.filterSpecies(),
                      style: TextStyle(
                        fontSize: 16 * textScaleFactor,
                        fontWeight: FontWeight.w500,
                        color: WildScanColors.textPrimary,
                        letterSpacing: 0.3,
                      ),
                      cursorColor: WildScanColors.appBarLightGreen,
                      cursorHeight: 22,
                      decoration: InputDecoration(
                        hintText: 'Search for amazing species...',
                        hintStyle: TextStyle(
                          fontSize: 16 * textScaleFactor,
                          fontWeight: FontWeight.w400,
                          color: WildScanColors.textSecondary.withOpacity(0.7),
                          letterSpacing: 0.2,
                        ),
                        prefixIcon: Container(
                          margin: const EdgeInsets.all(12),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                WildScanColors.skyBlue.withOpacity(0.3),
                                WildScanColors.leafGreen.withOpacity(0.2),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.search,
                            size: 20 * textScaleFactor,
                            color: WildScanColors.appBarLightGreen,
                          ),
                        ),
                        suffixIcon: Container(
                          margin: const EdgeInsets.all(8),
                          child: IconButton(
                            onPressed: () {
                              // Add filter functionality
                            },
                            icon: Icon(
                              Icons.tune,
                              size: 20 * textScaleFactor,
                              color: WildScanColors.textSecondary,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: isDark
                            ? WildScanColors.darkContainer.withOpacity(0.8)
                            : WildScanColors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: WildScanColors.appBarLightGreen,
                            width: 2.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: isDark
                                ? WildScanColors.darkGrey.withOpacity(0.3)
                                : WildScanColors.skyBlue.withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: size.height * 0.02),

            // Species Count Badge
            Obx(() {
              final species = controller.filteredSpecies;
              return Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      WildScanColors.skyBlue.withOpacity(0.2),
                      WildScanColors.leafGreen.withOpacity(0.15),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: WildScanColors.appBarLightGreen.withOpacity(0.4),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.pets,
                      size: 16 * textScaleFactor,
                      color: WildScanColors.appBarLightGreen,
                    ),
                    SizedBox(width: 6),
                    Text(
                      '${species.length} Species Found',
                      style: TextStyle(
                        fontSize: 14 * textScaleFactor,
                        fontWeight: FontWeight.w600,
                        color: WildScanColors.appBarLightGreen,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
              );
            }),

            SizedBox(height: size.height * 0.02),

            // Enhanced Species List
            Expanded(
              child: Obx(() {
                final species = controller.filteredSpecies;
                if (species.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                WildScanColors.skyBlue.withOpacity(0.2),
                                WildScanColors.softGrey.withOpacity(0.3),
                              ],
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.search_off,
                            size: 48 * textScaleFactor,
                            color: WildScanColors.textSecondary,
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Text(
                          "No species found",
                          style: TextStyle(
                            fontSize: 20 * textScaleFactor,
                            fontWeight: FontWeight.w600,
                            color: WildScanColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Try adjusting your search terms",
                          style: TextStyle(
                            fontSize: 14 * textScaleFactor,
                            fontWeight: FontWeight.w400,
                            color: WildScanColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.01,
                  ),
                  itemCount: species.length,
                  itemBuilder: (_, index) {
                    final item = species[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: size.height * 0.015),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: isDark
                                ? WildScanColors.black.withOpacity(0.3)
                                : WildScanColors.appBarLightGreen.withOpacity(
                                    0.12,
                                  ),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Card(
                        margin: EdgeInsets.zero,
                        elevation: 0,
                        color: isDark
                            ? WildScanColors.darkContainer
                            : WildScanColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: isDark
                                ? WildScanColors.darkGrey.withOpacity(0.2)
                                : WildScanColors.skyBlue.withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Theme(
                          data: Theme.of(
                            context,
                          ).copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            tilePadding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                            leading: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    WildScanColors.skyBlue.withOpacity(0.3),
                                    WildScanColors.leafGreen.withOpacity(0.2),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Icon(
                                Icons
                                    .pets, // Using pets as fallback since wildlife_icon might not exist
                                color: WildScanColors.appBarLightGreen,
                                size: 24 * textScaleFactor,
                              ),
                            ),
                            title: Text(
                              item.name,
                              style: TextStyle(
                                fontSize: 18 * textScaleFactor,
                                fontWeight: FontWeight.w700,
                                color: WildScanColors.textPrimary,
                                letterSpacing: 0.3,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 14 * textScaleFactor,
                                    color: WildScanColors.appBarLightGreen,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '${item.locations.length} location${item.locations.length > 1 ? 's' : ''}',
                                    style: TextStyle(
                                      fontSize: 13 * textScaleFactor,
                                      fontWeight: FontWeight.w500,
                                      color: WildScanColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            iconColor: WildScanColors.appBarLightGreen,
                            collapsedIconColor: WildScanColors.textSecondary,
                            backgroundColor: isDark
                                ? WildScanColors.dark.withOpacity(0.2)
                                : WildScanColors.primaryBackground.withOpacity(
                                    0.5,
                                  ),
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      isDark
                                          ? WildScanColors.dark.withOpacity(0.3)
                                          : WildScanColors.primaryBackground
                                                .withOpacity(0.8),
                                      isDark
                                          ? WildScanColors.darkGrey.withOpacity(
                                              0.1,
                                            )
                                          : WildScanColors.skyBlue.withOpacity(
                                              0.1,
                                            ),
                                    ],
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  children: item.locations.map((loc) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 4,
                                      ),
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            isDark
                                                ? WildScanColors.darkContainer
                                                      .withOpacity(0.7)
                                                : WildScanColors.white
                                                      .withOpacity(0.9),
                                            isDark
                                                ? WildScanColors.darkerGrey
                                                      .withOpacity(0.3)
                                                : WildScanColors.skyBlue
                                                      .withOpacity(0.1),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                          color: WildScanColors.skyBlue
                                              .withOpacity(0.3),
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  WildScanColors.skyBlue
                                                      .withOpacity(0.3),
                                                  WildScanColors.leafGreen
                                                      .withOpacity(0.2),
                                                ],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Icon(
                                              Icons.place,
                                              size: 18 * textScaleFactor,
                                              color: WildScanColors
                                                  .appBarLightGreen,
                                            ),
                                          ),
                                          SizedBox(width: 16),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  loc.city,
                                                  style: TextStyle(
                                                    fontSize:
                                                        16 * textScaleFactor,
                                                    fontWeight: FontWeight.w600,
                                                    color: WildScanColors
                                                        .textPrimary,
                                                    letterSpacing: 0.2,
                                                  ),
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  '${loc.lat}°N, ${loc.lng}°E',
                                                  style: TextStyle(
                                                    fontSize:
                                                        13 * textScaleFactor,
                                                    fontWeight: FontWeight.w400,
                                                    color: WildScanColors
                                                        .textSecondary,
                                                    letterSpacing: 0.1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  WildScanColors.skyBlue
                                                      .withOpacity(0.3),
                                                  WildScanColors.leafGreen
                                                      .withOpacity(0.2),
                                                ],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Icon(
                                              Icons.navigation,
                                              size: 16 * textScaleFactor,
                                              color: WildScanColors
                                                  .appBarLightGreen,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
