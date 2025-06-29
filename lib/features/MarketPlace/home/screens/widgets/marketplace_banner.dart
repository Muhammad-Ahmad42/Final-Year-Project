import 'package:flutter/material.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/sizes.dart';

class BannerImageDesign extends StatelessWidget {
  const BannerImageDesign({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.applyImageRadius = true,
    this.backgroundColor = WildScanColors.black,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = WildScanSizes.md,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final Color backgroundColor;
  final BoxFit? fit;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final imageWidget = isNetworkImage
        ? Image.network(
            imageUrl,
            fit: fit,
            width: width,
            height: height,
            errorBuilder: (context, error, stackTrace) =>
                const Center(child: Icon(Icons.broken_image)),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(child: CircularProgressIndicator());
            },
          )
        : Image.asset(
            imageUrl,
            fit: fit,
            width: width,
            height: height,
          );

    Widget result = Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius:
            applyImageRadius ? BorderRadius.circular(borderRadius) : null,
      ),
      child: ClipRRect(
        borderRadius: applyImageRadius
            ? BorderRadius.circular(borderRadius)
            : BorderRadius.zero,
        child: imageWidget,
      ),
    );

    if (onPressed != null) {
      result = GestureDetector(onTap: onPressed, child: result);
    }

    return applyImageRadius
        ? Padding(padding: const EdgeInsets.all(5), child: result)
        : result;
  }
}
