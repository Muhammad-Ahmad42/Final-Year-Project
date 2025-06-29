import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wildscan/common/widgets/images/wildscan_circular_image.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/image_strings.dart';

class WildScanUserProfileTile extends StatelessWidget {
  const WildScanUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double avatarSize = size.width * 0.13;
    final double titleFontSize = size.width * 0.050;
    final double subtitleFontSize = size.width * 0.035;

    return ListTile(
      leading: WildScanCircularImage(
        image: WildScanImages.user,
        padding: 0,
      ),
      title: Text(
        'Ahmad',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: WildScanColors.white,
              fontSize: titleFontSize,
            ),
      ),
      subtitle: Text(
        'AhmadKhan@gmail.com',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: WildScanColors.white,
              fontSize: subtitleFontSize,
            ),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Iconsax.edit,
          color: WildScanColors.white,
          size: avatarSize * 0.6, // Responsive icon
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05, // Responsive horizontal padding
        vertical: size.height * 0.008, // Responsive vertical padding
      ),
    );
  }
}
