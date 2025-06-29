import 'package:flutter/material.dart';
import 'package:wildscan/utils/constraints/colors.dart';

class WildScanHorizentalImageText extends StatelessWidget {
  const WildScanHorizentalImageText({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(
            8.0), // You can replace with WildScanSizes.spaceBtwItems
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: WildScanColors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  color: WildScanColors.dark,
                ),
              ),
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: 60, // Ensures no overflow and allows ellipsis
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: WildScanColors.white,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
