import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildscan/features/MarketPlace/home/controllers/merket_place_home_controller.dart';
import 'package:wildscan/features/MarketPlace/home/screens/widgets/marketplace_banner.dart';
import 'package:wildscan/utils/constraints/colors.dart';

class WildScanPromoSlider extends StatelessWidget {
  final List<String> bannerImages;

  const WildScanPromoSlider({super.key, required this.bannerImages});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MarketPlaceHomeController());
    final screenHeight = MediaQuery.of(context).size.height;

    final double bannerHeight = screenHeight * 0.30;

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: bannerImages.length,
          itemBuilder: (context, index, realIdx) {
            final isActive = controller.courousaCurrentIndex.value == index;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 450),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              height: bannerHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(isActive ? 0.18 : 0.08),
                    blurRadius: isActive ? 18 : 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Stack(
                  children: [
                    BannerImageDesign(
                      imageUrl: bannerImages[index],
                      fit: BoxFit.cover,
                    ),
                    Positioned.fill(
                      child: AnimatedOpacity(
                        opacity: isActive ? 1.0 : 0.4,
                        duration: const Duration(milliseconds: 450),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.16),
                                WildScanColors.leafGreen.withOpacity(0.08),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: bannerHeight,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1,
            autoPlayAnimationDuration: const Duration(milliseconds: 700),
            onPageChanged: (index, _) {
              controller.updatePageIndicator(index);
            },
          ),
        ),
        const SizedBox(height: 12),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(bannerImages.length, (index) {
              final isActive = controller.courousaCurrentIndex.value == index;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                width: isActive ? 28 : 12,
                height: isActive ? 9 : 6,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  gradient: isActive
                      ? LinearGradient(
                          colors: [
                            WildScanColors.leafGreen,
                            WildScanColors.leafGreen.withOpacity(0.65),
                          ],
                        )
                      : null,
                  color: !isActive
                      ? WildScanColors.leafGreen.withOpacity(0.22)
                      : null,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: isActive
                      ? [
                          BoxShadow(
                            color: WildScanColors.leafGreen.withOpacity(0.20),
                            blurRadius: 8,
                          ),
                        ]
                      : [],
                  border: Border.all(
                    color: isActive
                        ? WildScanColors.leafGreen
                        : Colors.transparent,
                    width: 1.4,
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
