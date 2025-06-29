import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildscan/common/widgets/texts/section_heading.dart';
import 'package:wildscan/features/MarketPlace/sub_category/sub_category.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/image_strings.dart';

class PopularCategories extends StatelessWidget {
  const PopularCategories({super.key});

  static const List<Map<String, String>> categories = [
    {
      'title': 'Flower',
      'image': WildScanImages.flowerIcon,
    },
    {
      'title': 'Tree',
      'image': WildScanImages.fruitIcon,
    },
    {
      'title': 'Herbs',
      'image': WildScanImages.herbIcon,
    },
    {
      'title': 'Tree',
      'image': WildScanImages.treeIcon,
    },
    {
      'title': 'Vagetables',
      'image': WildScanImages.vegetableIcon,
    },
    {
      'title': 'Mushrooms',
      'image': WildScanImages.mushroomIcon,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth * 0.13; // slightly reduced for safety
    final itemWidth = screenWidth * 0.18;
    final textSpacing = screenWidth * 0.01;

    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.045,
        bottom: screenWidth * 0.03,
        right: screenWidth * 0.02,
        top: screenWidth * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          WildScanSectionHeading(
            title: 'Popular Categories',
            showActionButton: false,
            textColor: WildScanColors.white,
          ),
          SizedBox(height: textSpacing * 4),
          SizedBox(
            height:
                iconSize + screenWidth * 0.08 + 24, // image + spacing + text
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final categori = categories[index];
                return Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.03),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(40),
                    onTap: () {
                      Get.to(
                          () => SubCategoriesScreen(title: categori['title']!),
                          arguments: {
                            'title': categori['title'],
                            'image': categori['image']
                          });
                    },
                    child: SizedBox(
                      width: itemWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipOval(
                            child: Container(
                              color: WildScanColors.white,
                              width: iconSize,
                              height: iconSize,
                              child: Image.asset(
                                categori['image']!,
                                width: iconSize,
                                height: iconSize,
                              ),
                            ),
                          ),
                          SizedBox(height: textSpacing * 5),
                          Text(
                            categori['title']!,
                            style: TextStyle(
                              color: WildScanColors.white,
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
