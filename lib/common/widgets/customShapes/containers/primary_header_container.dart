import 'package:flutter/material.dart';
import 'package:wildscan/common/widgets/customShapes/containers/circular_container.dart';
import 'package:wildscan/common/widgets/customShapes/curved_edges/curved_edges_widget.dart';
import 'package:wildscan/utils/constraints/colors.dart';

class WildScanPrimaryHeaderContainer extends StatelessWidget {
  const WildScanPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return WildScanCurvedEdgesWidget(
      height: MediaQuery.of(context).size.height * 0.285,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          gradient: WildScanColors.primaryGradientLight,
        ),
        child: Stack(
          children: [
            /// --- Background Custom Shapes
            Positioned(
              top: -150,
              right: -250,
              child: WildScanCircularContainer(
                  backgroundColor: WildScanColors.textWhite.withOpacity(0.1)),
            ),
            Positioned(
              top: 100,
              right: -200,
              child: WildScanCircularContainer(
                  backgroundColor: WildScanColors.textWhite.withOpacity(0.1)),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
