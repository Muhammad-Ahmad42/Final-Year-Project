import 'package:get/get.dart';
import 'package:wildscan/data/repositries/MarketPlace/market_place_repository.dart';
import 'package:wildscan/data/repositries/MarketPlace/product_model.dart';

class MarketPlaceController extends GetxController {
  final RxList<ProductModel> products = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      final result = await MarketPlaceRepository.instance.fetchAllProducts();
      print('Loaded products: ${result.map((e) => e.toJson())}');
      products.assignAll(result);
    } catch (e) {
      print('Error loading products: $e');
      products.clear();
    }
  }
}
