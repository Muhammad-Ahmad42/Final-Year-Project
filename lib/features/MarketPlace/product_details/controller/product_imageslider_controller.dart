import 'package:get/get.dart';

class ProductImageSliderController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  void selectImage(int index) => selectedIndex.value = index;
}
