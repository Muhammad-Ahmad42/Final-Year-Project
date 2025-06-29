// species_info_controller.dart
import 'package:get/get.dart';
import 'package:wildscan/features/Scan/models/species_info_service.dart%20.dart';

class SpeciesInfoController extends GetxController {
  final String scientificName;
  final SpeciesInfoService service;

  SpeciesInfoController({
    required this.scientificName,
    SpeciesInfoService? speciesInfoService,
  }) : service = speciesInfoService ?? SpeciesInfoService();

  var speciesInfo = Rxn<Map<String, dynamic>>();
  var loading = true.obs;
  var errorMsg = RxnString();

  @override
  void onInit() {
    super.onInit();
    fetchSpeciesDetails();
  }

  Future<void> fetchSpeciesDetails() async {
    loading.value = true;
    errorMsg.value = null;
    try {
      final data = await service.fetchSpeciesDetails(scientificName);
      speciesInfo.value = data;
      loading.value = false;
    } catch (e) {
      loading.value = false;
      errorMsg.value = "Failed to fetch species info.\n$e";
    }
  }
}
