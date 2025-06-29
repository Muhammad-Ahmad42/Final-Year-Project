import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildscan/common/widgets/customShapes/curved_edges/curved_edges_widget.dart';
import 'package:wildscan/common/widgets/images/wildscan_rounded_image.dart';
import 'package:wildscan/features/MarketPlace/product_details/controller/product_imageslider_controller.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/image_strings.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class WildScanProductImageslider extends StatelessWidget {
  final List<String> imageList;

  const WildScanProductImageslider({
    super.key,
    this.imageList = const [
      WildScanImages.productImage1,
      WildScanImages.productImage2,
      WildScanImages.productImage3,
      WildScanImages.productImage4,
      WildScanImages.productImage5,
      WildScanImages.productImage6,
    ],
  });

  @override
  Widget build(BuildContext context) {
    final dark = WildScanHelperFunctions.isDarkMode(context);
    final controller = Get.find<ProductImageSliderController>();

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final double curvedHeight = screenHeight * 0.34;
    final double thumbnailSize = screenWidth * 0.18;

    return WildScanCurvedEdgesWidget(
      height: curvedHeight,
      child: Container(
        color: dark ? WildScanColors.darkerGrey : WildScanColors.light,
        child: Stack(
          children: [
            // -- Main Large Image and Slider
            Obx(() {
              final selectedIdx = controller.selectedIndex.value;
              return Stack(
                children: [
                  // Main Large Image fills the entire space, not pushed down
                  Positioned.fill(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: Image(
                        key: ValueKey(imageList[selectedIdx]),
                        width: double.infinity,
                        height: curvedHeight,
                        fit: BoxFit.cover,
                        image: AssetImage(
                          imageList.isNotEmpty
                              ? imageList[selectedIdx]
                              : WildScanImages.productImage5,
                        ),
                      ),
                    ),
                  ),

                  // -- Image Slider
                  Positioned(
                    right: 0,
                    bottom: curvedHeight * 0.08,
                    left: WildScanSizes.defaultSpace,
                    child: SizedBox(
                      height: thumbnailSize,
                      child: ListView.separated(
                        itemCount: imageList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics(),
                        separatorBuilder: (_, __) =>
                            SizedBox(width: screenWidth * 0.025),
                        itemBuilder: (_, index) => GestureDetector(
                          onTap: () => controller.selectImage(index),
                          child: WildScanRoundedImage(
                            width: thumbnailSize,
                            backgroundColor: selectedIdx == index
                                ? const Color.fromARGB(255, 138, 255, 75)
                                    .withOpacity(0.20)
                                : (dark
                                    ? WildScanColors.leafGreen
                                    : WildScanColors.white),
                            padding: EdgeInsets.all(thumbnailSize * 0.12),
                            border: Border.all(
                              color: selectedIdx == index
                                  ? WildScanColors.leafGreen
                                  : WildScanColors.borderPrimary,
                              width: selectedIdx == index ? 2 : 1,
                            ),
                            imageUrl: imageList[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
