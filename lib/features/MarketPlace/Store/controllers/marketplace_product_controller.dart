import 'package:get/get.dart';
import 'package:wildscan/data/repositries/MarketPlace/market_place_repository.dart';
import 'package:wildscan/data/repositries/MarketPlace/product_model.dart';

class MarketPlaceProductController extends GetxController {
  static MarketPlaceProductController get instance => Get.find();

  final RxList<ProductModel> products = <ProductModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllProducts();
  }

  void fetchAllProducts() async {
    isLoading.value = true;
    final fetched = await MarketPlaceRepository.instance.fetchAllProducts();
    products.assignAll(fetched);
    isLoading.value = false;
  }

  List<ProductModel> getProductsByCategory(String category) {
    return products
        .where((p) => p.category.toLowerCase() == category.toLowerCase())
        .toList();
  }
}
