import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wildscan/common/widgets/appbar/appbar.dart';
import 'package:wildscan/common/widgets/buttons/primary_button.dart';
import 'package:wildscan/common/widgets/decorations/input_decoration.dart';
import 'package:wildscan/features/MarketPlace/sell/widgets/input_fields.dart';
import 'package:wildscan/navigation_menu.dart';
import 'package:wildscan/utils/constraints/colors.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/helpers/helper_functions.dart';

class SellProduct extends StatefulWidget {
  const SellProduct({super.key});

  @override
  State<SellProduct> createState() => _SellProductState();
}

class _SellProductState extends State<SellProduct> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String description = '';
  double? price;
  int? quantity;
  String category = '';
  String location = '';
  List<XFile>? images = [];

  final picker = ImagePicker();

  final List<String> categories = [
    'Flowers',
    'Trees',
    'Herbs',
    'Vagetables',
    'Fruits',
  ];

  Future<void> _pickImages() async {
    final picked = await picker.pickMultiImage(imageQuality: 80);
    if (picked.isNotEmpty) {
      setState(() => images = picked);
    }
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // print('--- FORM VALUES ---');
      // print('Name: $name');
      // print('Price: $price');
      // print('Description: $description');
      // print('Quantity: $quantity');
      // print('Category: $category');
      // print('Location: $location');
      // print('Images count: ${images?.length ?? 0}');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product submitted!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final media = MediaQuery.of(context);

    final dark = WildScanHelperFunctions.isDarkMode(context);
    final double paddingH = media.size.width * 0.055;
    final double paddingV = media.size.height * 0.02;
    final double imageBoxHeight = media.size.height * 0.16;
    final double imagePreview = media.size.width * 0.23;

    return Scaffold(
      appBar: WildScanAppBar(
        title: const Text('Sell Products'),
        showBackArrow: true,
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: WildScanSizes.sm,
                ),
                WildScanInputField(
                  labelText: 'Product Name',
                  prefixIcon: Icons.abc,
                  validator: (v) =>
                      (v == null || v.isEmpty) ? 'Enter product name' : null,
                  onSaved: (v) {
                    name = v ?? '';
                    // //print('Name entered: $name');
                  },
                ),
                SizedBox(height: WildScanSizes.spaceBtwInputFields),

                WildScanInputField(
                  labelText: 'Price',
                  prefixIcon: Icons.price_change,
                  keyboardType: TextInputType.number,
                  validator: (v) =>
                      (v == null || v.isEmpty) ? 'Enter price' : null,
                  onSaved: (v) {
                    price = double.tryParse(v ?? '');
                    //print('Price entered: $price');
                  },
                ),
                SizedBox(height: WildScanSizes.spaceBtwInputFields),

                WildScanInputField(
                  labelText: 'Description',
                  prefixIcon: Icons.description,
                  maxLines: 3,
                  validator: (v) =>
                      (v == null || v.isEmpty) ? 'Enter description' : null,
                  onSaved: (v) {
                    description = v ?? '';
                    //print('Description entered: $description');
                  },
                ),
                SizedBox(height: WildScanSizes.spaceBtwInputFields),

                WildScanInputField(
                  labelText: 'Quantity',
                  prefixIcon: Icons.numbers,
                  keyboardType: TextInputType.number,
                  validator: (v) =>
                      (v == null || v.isEmpty) ? 'Enter quantity' : null,
                  onSaved: (v) {
                    quantity = int.tryParse(v ?? '');
                    //print('Quantity entered: $quantity');
                  },
                ),
                SizedBox(height: WildScanSizes.spaceBtwInputFields),

                // Category Dropdown
                DropdownButtonFormField<String>(
                  value: category.isNotEmpty ? category : null,
                  decoration: WildScanInputDecoration.inputDecoration(
                      context, 'Category', Icons.category),
                  items: categories
                      .map((cat) =>
                          DropdownMenuItem(value: cat, child: Text(cat)))
                      .toList(),
                  onChanged: (v) => setState(() => category = v ?? ''),
                  validator: (v) =>
                      (v == null || v.isEmpty) ? 'Select category' : null,
                  onSaved: (v) {
                    category = v ?? '';
                    //print('Category selected: $category');
                  },
                ),
                SizedBox(height: WildScanSizes.spaceBtwInputFields),

                WildScanInputField(
                  labelText: 'Location',
                  prefixIcon: Icons.location_on,
                  validator: (v) =>
                      (v == null || v.isEmpty) ? 'Enter location' : null,
                  onSaved: (v) {
                    location = v ?? '';
                    //print('Location entered: $location');
                  },
                ),
                SizedBox(height: paddingV),

                Text(
                  'Product Images',
                  style: theme.textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: WildScanSizes.spaceBtwInputFields * 0.8),

                GestureDetector(
                  onTap: _pickImages,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                    width: double.infinity,
                    height: imageBoxHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: WildScanColors.leafGreen,
                        width: 1.5,
                      ),
                      color: theme.colorScheme.surfaceContainerHighest
                          .withOpacity(0.18),
                    ),
                    alignment: Alignment.center,
                    child: images == null || images!.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image,
                                  size: imagePreview,
                                  color: WildScanColors.leafGreen),
                              const SizedBox(height: 8),
                              Text(
                                'Tap to pick images',
                                style: TextStyle(
                                    color: dark
                                        ? WildScanColors.white
                                        : WildScanColors.black),
                              ),
                            ],
                          )
                        : ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: images!.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: 12),
                            itemBuilder: (context, idx) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: kIsWeb
                                    ? FutureBuilder<Uint8List>(
                                        future: images![idx].readAsBytes(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                                  ConnectionState.done &&
                                              snapshot.hasData) {
                                            return Image.memory(
                                              snapshot.data!,
                                              width: imagePreview,
                                              height: imagePreview,
                                              fit: BoxFit.cover,
                                            );
                                          }
                                          return SizedBox(
                                            width: imagePreview,
                                            height: imagePreview,
                                            child: const Center(
                                              child: CircularProgressIndicator(
                                                  strokeWidth: 2),
                                            ),
                                          );
                                        },
                                      )
                                    : Image.file(
                                        File(images![idx].path),
                                        width: imagePreview,
                                        height: imagePreview,
                                        fit: BoxFit.cover,
                                      ),
                              );
                            },
                          ),
                  ),
                ),
                SizedBox(height: paddingV),

                WildScanPrimaryButton(
                  text: 'Submit Product',
                  onPressed: () {
                    Get.to(() => const NavigationMenu());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
