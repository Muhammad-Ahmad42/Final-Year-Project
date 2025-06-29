import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:wildscan/common/widgets/success_screen/success_screen.dart';
import 'package:wildscan/data/repositries/authentication/authentication_repository.dart';
import 'package:wildscan/utils/constraints/image_strings.dart';
import 'package:wildscan/utils/constraints/text_strings.dart';
import 'package:wildscan/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  late final Timer _emailCheckTimer;

  /// Called when the controller is initialized
  @override
  void onInit() {
    super.onInit();
    sendEmailVerification();
    setTimerForAutoRedirect();
  }

  /// Cancel timer when controller is disposed to avoid memory leaks
  @override
  void onClose() {
    _emailCheckTimer.cancel();
    super.onClose();
  }

  /// Send verification email using Firebase
  Future<void> sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      WildScanLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Please check your inbox & verify your email.',
      );
    } catch (e) {
      WildScanLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Re-send verification email manually (e.g., from a button)
  Future<void> resendVerificationEmail() async {
    await sendEmailVerification();
  }

  /// Set a periodic timer to auto-check for email verification
  void setTimerForAutoRedirect() {
    _emailCheckTimer = Timer.periodic(const Duration(seconds: 3), (
      timer,
    ) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;

      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            image: WildScanImages.staticSuccessIllustration,
            title: WildScanTexts.yourAccountCreatedTitle,
            subtitle: WildScanTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
            isLottie: false, // or omit, as default is false
          ),
        );
      }
    });
  }

  /// Optional manual check (e.g., pull to refresh)
  Future<void> checkEmailVerificationStatus() async {
    await FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;

    if (user != null && user.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: WildScanImages.staticSuccessIllustration,
          title: WildScanTexts.yourAccountCreatedTitle,
          subtitle: WildScanTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    } else {
      WildScanLoaders.errorSnackBar(
        title: 'Still not verified',
        message: 'Please check your inbox and verify your email.',
      );
    }
  }
}
