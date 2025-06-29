import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wildscan/data/repositries/authentication/authentication_repository.dart';
import 'package:wildscan/utils/helpers/network_manager.dart';
import 'package:wildscan/utils/popups/full_screen_loader.dart';
import 'package:wildscan/utils/popups/loaders.dart';
import 'package:wildscan/utils/validators/validation.dart';

class LoginController extends GetxController {
  final rememberMe = false.obs;
  final isPasswordHidden = true.obs;
  final isFormFilled = false.obs;
  final localStorage = GetStorage();

  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    checkFormCompletion();
    super.onInit();
  }

  void checkFormCompletion() {
    final isEmailValid = WildScanValidator.validateEmail(email.text) == null;
    final isPasswordValid = WildScanValidator.validatePassword(password.text) == null;
    isFormFilled.value = isEmailValid && isPasswordValid;
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> emailAndPasswordSignIn() async {
    WildScanFullScreenLoader.openLoadingDialog('Logging you in...');
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        WildScanFullScreenLoader.stopLoading();
        WildScanLoaders.warningSnackBar(
          title: 'No Internet',
          message: 'Please check your internet connection.',
        );
        return;
      }

      if (!loginFormKey.currentState!.validate()) {
        WildScanFullScreenLoader.stopLoading();
        WildScanLoaders.warningSnackBar(
          title: 'Form Error',
          message: 'Please fill in all fields correctly.',
        );
        return;
      }

      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      await AuthenticationRepository.instance.loginWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      WildScanFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } on FirebaseAuthException catch (e) {
      WildScanFullScreenLoader.stopLoading();
      // Do NOT use Get.back() after stopLoading, unless you push two overlays

      String message;
      switch (e.code) {
        case 'user-not-found':
          message = 'No user found with this email.';
          break;
        case 'wrong-password':
          message = 'Incorrect password.';
          break;
        case 'invalid-email':
          message = 'Email address is invalid.';
          break;
        case 'too-many-requests':
          message = 'Too many attempts. Try again later.';
          break;
        default:
          message = 'Authentication failed. Please try again.';
      }
      WildScanLoaders.errorSnackBar(title: 'Login Error', message: message);
    } catch (e) {
      WildScanFullScreenLoader.stopLoading();
      WildScanLoaders.errorSnackBar(
        title: 'Error',
        message: e.toString().replaceAll('Exception:', '').trim(),
      );
    }
  }

  Future<void> signInWithGoogle() async {
    WildScanFullScreenLoader.openLoadingDialog('Signing in with Google...');
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        WildScanFullScreenLoader.stopLoading();
        WildScanLoaders.warningSnackBar(
          title: 'No Internet',
          message: 'Please check your internet connection.',
        );
        return;
      }

      // Start Google sign-in
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // User cancelled
        WildScanFullScreenLoader.stopLoading();
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Firebase
      await FirebaseAuth.instance.signInWithCredential(credential);

      WildScanFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } on FirebaseAuthException catch (e) {
      WildScanFullScreenLoader.stopLoading();
      String message = 'Google Sign-In failed. Please try again.';
      if (e.code == 'account-exists-with-different-credential') {
        message = 'Account exists with a different sign-in method.';
      } else if (e.code == 'invalid-credential') {
        message = 'Invalid Google credentials.';
      }
      WildScanLoaders.errorSnackBar(title: "Google Sign-In Error", message: message);
    } catch (e) {
      WildScanFullScreenLoader.stopLoading();
      WildScanLoaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }
}
