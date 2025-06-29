import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildscan/common/widgets/appbar/appbar.dart';
import 'package:wildscan/features/Scan/controllers/image_picker_controller.dart';

class ImageClassificationScreen extends StatelessWidget {
  ImageClassificationScreen({super.key});
  final controller = Get.put(ImageClassificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WildScanAppBar(
        title: const Center(child: Text('Animal Classification')),
        showBackArrow: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                controller.pickedImage.value != null
                    ? Image.file(
                        controller.pickedImage.value!,
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width * 0.9,
                        fit: BoxFit.contain,
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.38,
                        color: Colors.grey[300],
                        child: const Center(child: Text('No Image Selected')),
                      ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: controller.loading.value
                            ? null
                            : controller.pickFromGallery,
                        child: const Text("Gallery"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: controller.loading.value
                            ? null
                            : controller.pickFromCamera,
                        child: const Text("Camera"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                if (controller.predictionResult.value.contains("Confidence:"))
                  Text(
                    "Confidence: ${controller.confidence.value.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: controller.confidence.value >= 0.5
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                const SizedBox(height: 12),
                if (controller.showGetDetailsButton.value)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.navigateToDetails,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("Get Details"),
                    ),
                  ),
                const SizedBox(height: 20),
                Text(
                  controller.predictionResult.value,
                  textAlign: TextAlign.center,
                ),
                if (controller.loading.value)
                  const Padding(
                    padding: EdgeInsets.only(top: 32.0),
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
