import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildscan/common/widgets/appbar/appbar.dart';
import 'package:wildscan/common/widgets/buttons/primary_button.dart';
import 'package:wildscan/common/widgets/decorations/input_decoration.dart';
import 'package:wildscan/features/home/controller/feedback_controller.dart';
import 'package:wildscan/features/personalization/controllers/user_controller.dart';
import 'package:wildscan/utils/constraints/sizes.dart';

class FeedbackScreen extends StatelessWidget {
  FeedbackScreen({super.key});

  final feedbackController = Get.put(FeedbackController());
  final userController = UserController.instance;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    final double paddingH = media.size.width * 0.055;
    final double paddingV = media.size.height * 0.02;

    return Scaffold(
      appBar: WildScanAppBar(
        title: const Text('Feedback'),
        showBackArrow: true,
      ),
      body: Obx(() {
        final userEmail = userController.user.value.email;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: paddingH,
            vertical: paddingV,
          ),
          child: Form(
            key: feedbackController.formKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(height: WildScanSizes.sm),
                TextFormField(
                  initialValue: userEmail,
                  readOnly: true,
                  decoration: WildScanInputDecoration.inputDecoration(
                    context,
                    'Your Email',
                    Icons.email,
                  ),
                ),
                SizedBox(height: WildScanSizes.spaceBtwInputFields),

                /// 🟢 Feedback Text Field
                TextFormField(
                  controller: feedbackController.feedbackController,
                  maxLines: 5,
                  validator: (value) => (value == null || value.trim().isEmpty)
                      ? 'Please enter your feedback'
                      : null,
                  decoration: WildScanInputDecoration.inputDecoration(
                    context,
                    'Your Feedback',
                    Icons.feedback,
                  ),
                ),
                SizedBox(height: paddingV * 1.5),

                /// 🟢 Submit Feedback Button
                WildScanPrimaryButton(
                  text: 'Submit Feedback',
                  onPressed: feedbackController.submitFeedback,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
