import 'package:firebase_database/firebase_database.dart';
import 'package:wildscan/data/repositries/MarketPlace/product_model.dart';

class MarketPlaceRepository {
  static final MarketPlaceRepository instance =
      MarketPlaceRepository._internal();
  MarketPlaceRepository._internal();

  final _dbRef = FirebaseDatabase.instance.ref(
    'market_place/market_place_products',
  );

  Future<List<ProductModel>> fetchAllProducts() async {
    try {
      final snapshot = await _dbRef.get();

      if (snapshot.exists) {
        final data = snapshot.value as Map<dynamic, dynamic>;

        return data.entries.map((entry) {
          final productJson = Map<String, dynamic>.from(entry.value);
          return ProductModel.fromJson(productJson);
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
