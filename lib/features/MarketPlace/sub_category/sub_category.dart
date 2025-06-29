import 'package:flutter/material.dart';
import 'package:wildscan/common/widgets/appbar/appbar.dart';
import 'package:wildscan/common/widgets/images/wildscan_rounded_image.dart';
import 'package:wildscan/common/widgets/product/product_cards/product_card_horizontal.dart';
import 'package:wildscan/common/widgets/texts/section_heading.dart';
import 'package:wildscan/utils/constraints/image_strings.dart';
import 'package:wildscan/utils/constraints/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  final String title;
  final String image;

  const SubCategoriesScreen({
    super.key,
    this.title = 'Vagetables',
    this.image = 'WildScanImages.vegetableIcon',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WildScanAppBar(
        title: Text(title),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(WildScanSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const WildScanRoundedImage(
                imageUrl: WildScanImages.banner6,
                applyImageRadius: true,
                width: double.infinity,
              ),
              const SizedBox(height: WildScanSizes.spaceBtwSections),

              /// Sub-Categories
              Column(
                children: [
                  /// Heading
                  WildScanSectionHeading(
                      title: 'PARLOR PALM', onPressed: () {}),
                  const SizedBox(height: WildScanSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: WildScanSizes.spaceBtwItems),
                      itemBuilder: (context, index) =>
                          const WildScanProductCardHorizontal(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
