import 'package:get/get.dart';

class MarketPlaceHomeController extends GetxController {
  static MarketPlaceHomeController get instance => Get.find();

  final courousaCurrentIndex = 0.obs;

  void updatePageIndicator(int index) {
    courousaCurrentIndex.value = index;
  }
}
