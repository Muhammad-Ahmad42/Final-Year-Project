import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wildscan/common/widgets/layouts/grid_layout.dart';
import 'package:wildscan/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:wildscan/data/repositries/MarketPlace/product_model.dart';
import 'package:wildscan/utils/constraints/sizes.dart';

class WildScanSortableProducts extends StatefulWidget {
  const WildScanSortableProducts({super.key});

  @override
  State<WildScanSortableProducts> createState() =>
      _WildScanSortableProductsState();
}

class _WildScanSortableProductsState extends State<WildScanSortableProducts> {
  String _selectedSort = 'Name';

  // Dummy products (replace this with data from MarketPlaceController in future)
  final List<ProductModel> _products = [
    ProductModel(
      id: '1',
      category: 'trees',
      name: 'Mango Tree',
      description: 'A sweet mango tree.',
      imageUrl:
          'https://images.pexels.com/photos/461382/pexels-photo-461382.jpeg',
      location: 'Lahore',
      price: '500',
      quantity: '5',
      discount: '0%',
      discountPercent: 0,
    ),
    ProductModel(
      id: '2',
      category: 'herbs',
      name: 'Mint',
      description: 'Fresh mint herb.',
      imageUrl:
          'https://images.pexels.com/photos/461382/pexels-photo-461382.jpeg',
      location: 'Karachi',
      price: '100',
      quantity: '20',
      discount: '20%',
      discountPercent: 20,
    ),
  ];

  List<ProductModel> get sortedProducts {
    final list = [..._products];
    switch (_selectedSort) {
      case 'Name':
        list.sort((a, b) => a.name.compareTo(b.name));
        break;
      case 'Higher Price':
        list.sort(
          (a, b) => num.tryParse(b.price)!.compareTo(num.tryParse(a.price)!),
        );
        break;
      case 'Lower price':
        list.sort(
          (a, b) => num.tryParse(a.price)!.compareTo(num.tryParse(b.price)!),
        );
        break;
      case 'Sale':
        int extractDiscount(String d) =>
            int.tryParse(d.replaceAll('%', '')) ?? 0;
        list.sort(
          (a, b) => extractDiscount(
            b.discount,
          ).compareTo(extractDiscount(a.discount)),
        );
        break;
      case 'Newest':
        // You can add date field in ProductModel for this later
        break;
      case 'Popularity':
        // Add sorting logic if rating or views are available
        break;
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          value: _selectedSort,
          items:
              [
                    'Name',
                    'Higher Price',
                    'Lower price',
                    'Sale',
                    'Newest',
                    'Popularity',
                  ]
                  .map(
                    (option) =>
                        DropdownMenuItem(value: option, child: Text(option)),
                  )
                  .toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() => _selectedSort = value);
            }
          },
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        ),
        const SizedBox(height: WildScanSizes.spaceBtwSections),
        WildScanGridLayout(
          itemCount: sortedProducts.length,
          itemBuilder: (_, index) =>
              WildScanProductCardVertical(product: sortedProducts[index]),
        ),
      ],
    );
  }
}
