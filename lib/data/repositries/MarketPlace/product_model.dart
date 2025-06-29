class ProductModel {
  final String id;
  final String name;
  final String description;
  final String price;
  final String imageUrl;
  final String category;
  final String discount;
  final String quantity;
  final String location;

  ProductModel({
    this.id = '',
    this.name = 'Unknown',
    this.description = 'No description available.',
    this.price = '0',
    this.imageUrl = '',
    this.category = '',
    this.discount = '0%',
    this.quantity = '0',
    this.location = '',
    required int discountPercent,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Unknown',
      description: json['description'] ?? 'No description available.',
      price: json['price'] ?? '0',
      imageUrl: json['imageUrl'] ?? '',
      category: json['category'] ?? '',
      discount: json['discount'] ?? '0%',
      quantity: json['quantity'] ?? '0',
      location: json['location'] ?? '',
      discountPercent: json['discountPercent'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'category': category,
      'discount': discount,
      'quantity': quantity,
      'location': location,
    };
  }
}
