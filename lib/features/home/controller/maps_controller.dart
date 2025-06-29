import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import '../model/species_model.dart';

class SpeciesController extends GetxController {
  final searchController = TextEditingController();
  final RxList<SpeciesModel> allSpecies = <SpeciesModel>[].obs;
  final RxList<SpeciesModel> filteredSpecies = <SpeciesModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchSpecies();
    searchController.addListener(filterSpecies);
  }

  void fetchSpecies() async {
    final dbRef = FirebaseDatabase.instance.ref('wildlife_locations');
    final snapshot = await dbRef.get();

    if (snapshot.exists) {
      List<SpeciesModel> speciesList = [];

      final data = Map<String, dynamic>.from(snapshot.value as Map);
      data.forEach((name, locations) {
        speciesList.add(
          SpeciesModel(
            name: name,
            locations: (locations as List).map((e) {
              return LocationModel.fromMap(Map<String, dynamic>.from(e));
            }).toList(),
          ),
        );
      });

      allSpecies.assignAll(speciesList);
      filteredSpecies.assignAll(speciesList);
    }
  }

  void filterSpecies() {
    final query = searchController.text.toLowerCase();

    if (query.isEmpty) {
      filteredSpecies.assignAll(allSpecies);
    } else {
      filteredSpecies.assignAll(
        allSpecies.where((s) => s.name.toLowerCase().contains(query)).toList(),
      );
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
