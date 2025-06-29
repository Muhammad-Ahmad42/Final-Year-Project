import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildscan/data/repositries/feedback/feedback_repository.dart';
import 'package:wildscan/features/home/model/feedback_model.dart';
import 'package:wildscan/features/personalization/controllers/user_controller.dart';

class FeedbackController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final feedbackController = TextEditingController();

  Future<void> submitFeedback() async {
    if (!formKey.currentState!.validate()) return;

    final user = UserController.instance.user.value;

    final feedback = FeedbackModel(
      userId: user.id,
      email: user.email,
      message: feedbackController.text.trim(),
      timestamp: DateTime.now().toIso8601String(),
    );

    try {
      await FeedbackRepository.instance.submitFeedback(feedback);
      feedbackController.clear();
      Get.snackbar('Success', 'Feedback submitted successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
