import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class WildScanFullScreenLoader {
  /// Show a centered loader without any asset animation
  static void openLoadingDialog(String text, [String? docerAnimation]) {
    final context = Get.overlayContext!;
    final media = MediaQuery.of(context).size;
    final isDark = WildScanHelperFunctions.isDarkMode(context);

    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.3),
      builder: (_) => PopScope(
        canPop: false,
        child: Center(
          child: Container(
            width: media.width * 0.6,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDark
                  ? WildScanColors.dark.withOpacity(0.95)
                  : Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Built-in spinning animation
                SizedBox(
                  height: media.height * 0.1,
                  width: media.height * 0.1,
                  child: CircularProgressIndicator(
                    strokeWidth: 4,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      WildScanColors.leafGreen,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: media.width * 0.045,
                    color: WildScanColors.leafGreen,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Close loader if open
  static void stopLoading() {
    if (Get.isDialogOpen ?? false) Get.back();
  }
}
