import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wildscan/app.dart';
import 'package:wildscan/data/repositries/authentication/authentication_repository.dart';
import 'package:wildscan/data/repositries/user/user_repository.dart';
import 'package:wildscan/features/MarketPlace/product_details/controller/product_imageslider_controller.dart';
import 'package:wildscan/features/personalization/controllers/user_controller.dart';
import 'package:wildscan/utils/constraints/api_constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wildscan/utils/helpers/network_manager.dart';
import 'firebase_options.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  Gemini.init(apiKey: APIConstants.GOOGLE_API_KEY);
  await GetStorage.init();
  Get.put(ProductImageSliderController());
  Get.put(NetworkManager());
  Get.put(UserRepository());
  Get.put(UserController());

  runApp(const App());
}
