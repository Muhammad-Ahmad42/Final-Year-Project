import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wildscan/common/widgets/appbar/appbar.dart';
import 'package:wildscan/common/widgets/decorations/input_decoration.dart';
import 'package:wildscan/features/personalization/controllers/user_controller.dart';
import 'package:wildscan/features/personalization/models/address_model.dart';
import 'package:wildscan/utils/constraints/sizes.dart';
import 'package:wildscan/utils/validators/validation.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    final formKey = GlobalKey<FormState>();

    final name = TextEditingController();
    final phone = TextEditingController();
    final street = TextEditingController();
    final postalCode = TextEditingController();
    final city = TextEditingController();
    final state = TextEditingController();
    final country = TextEditingController();

    return Scaffold(
      appBar: const WildScanAppBar(
        showBackArrow: true,
        title: Text('Add New Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(WildScanSizes.defaultSpace),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: name,
                  validator: (value) =>
                      WildScanValidator.validateEmptyText('Name', value),
                  decoration: WildScanInputDecoration.inputDecoration(
                    context,
                    'Name',
                    Iconsax.user,
                  ),
                ),
                const SizedBox(height: WildScanSizes.spaceBtwInputFields),

                TextFormField(
                  controller: phone,
                  validator: (value) =>
                      WildScanValidator.validatePhoneNumber(value),
                  decoration: WildScanInputDecoration.inputDecoration(
                    context,
                    'Phone Number',
                    Iconsax.mobile,
                  ),
                ),
                const SizedBox(height: WildScanSizes.spaceBtwInputFields),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: street,
                        validator: (value) =>
                            WildScanValidator.validateEmptyText(
                              'Street',
                              value,
                            ),
                        decoration: WildScanInputDecoration.inputDecoration(
                          context,
                          'Street',
                          Iconsax.building_31,
                        ),
                      ),
                    ),
                    const SizedBox(width: WildScanSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        controller: postalCode,
                        validator: (value) =>
                            WildScanValidator.validateEmptyText(
                              'Postal Code',
                              value,
                            ),
                        decoration: WildScanInputDecoration.inputDecoration(
                          context,
                          'Postal Code',
                          Iconsax.code,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: WildScanSizes.spaceBtwInputFields),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: city,
                        validator: (value) =>
                            WildScanValidator.validateEmptyText('City', value),
                        decoration: WildScanInputDecoration.inputDecoration(
                          context,
                          'City',
                          Iconsax.building,
                        ),
                      ),
                    ),
                    const SizedBox(width: WildScanSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        controller: state,
                        validator: (value) =>
                            WildScanValidator.validateEmptyText('State', value),
                        decoration: WildScanInputDecoration.inputDecoration(
                          context,
                          'State',
                          Iconsax.activity,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: WildScanSizes.spaceBtwInputFields),

                TextFormField(
                  controller: country,
                  validator: (value) =>
                      WildScanValidator.validateEmptyText('Country', value),
                  decoration: WildScanInputDecoration.inputDecoration(
                    context,
                    'Country',
                    Iconsax.global,
                  ),
                ),
                const SizedBox(height: WildScanSizes.defaultSpace),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        final address = Address(
                          name: name.text.trim(),
                          phoneNumber: phone.text.trim(),
                          street: street.text.trim(),
                          postalCode: postalCode.text.trim(),
                          city: city.text.trim(),
                          state: state.text.trim(),
                          country: country.text.trim(),
                        );

                        await userController.updateUserAddress(address);
                        Get.back(); // Return to address list screen
                      }
                    },
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
