import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:wildscan/data/repositries/authentication/authentication_repository.dart';
import 'package:wildscan/data/repositries/user/user_repository.dart';
import 'package:wildscan/features/authentication/models/user_model.dart';
import 'package:wildscan/features/authentication/screens/signup/verify_email.dart';
import 'package:wildscan/utils/helpers/network_manager.dart';
import 'package:wildscan/utils/popups/full_screen_loader.dart';
import 'package:wildscan/utils/popups/loaders.dart';
import 'package:wildscan/utils/validators/validation.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Observables
  final hidePassword = true.obs;
  final isPasswordHidden = true.obs;
  final isConfirmPasswordHidden = true.obs;
  final privacyPolicy = true.obs;
  final isFormFilled = false.obs;

  // Controllers
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void checkFormCompletion() {
    final isUsernameValid =
        WildScanValidator.validateEmptyText("Username", username.text) == null;
    final isEmailValid = WildScanValidator.validateEmail(email.text) == null;
    final isPasswordValid =
        WildScanValidator.validatePassword(password.text) == null;
    final isConfirmPasswordValid =
        WildScanValidator.validateConfirmPassword(
          password.text,
          confirmPassword.text,
        ) ==
        null;

    isFormFilled.value =
        isUsernameValid &&
        isEmailValid &&
        isPasswordValid &&
        isConfirmPasswordValid &&
        privacyPolicy.value;
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  Future<void> signup() async {
    WildScanFullScreenLoader.openLoadingDialog('Processing...');
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        throw Exception('No Internet Connection');
      }

      if (!signupFormKey.currentState!.validate()) {
        throw Exception('Please fill in all fields correctly.');
      }

      if (!privacyPolicy.value) {
        throw Exception('You must accept the Privacy Policy and Terms of Use.');
      }

      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );

      final newUser = UserModel(
        id: userCredential.user!.uid,
        username: username.text.trim(),
        email: email.text.trim(),
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      WildScanFullScreenLoader.stopLoading();

      WildScanLoaders.successSnackBar(
        title: 'Account Created',
        message: 'Your account has been created! Please verify your email.',
      );

      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e, stackTrace) {
      WildScanFullScreenLoader.stopLoading();
      Get.back(); // Close dialog if still open

      WildScanLoaders.errorSnackBar(
        title: 'Signup Failed',
        message: e.toString().replaceAll('Exception:', '').trim(),
      );

      if (kDebugMode) {
        print('Signup Error: $e');
        print('StackTrace: $stackTrace');
      }
    }
  }
}
