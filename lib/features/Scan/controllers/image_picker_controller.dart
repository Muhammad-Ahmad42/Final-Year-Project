import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wildscan/features/Scan/controllers/tflite_services.dart';
import 'package:wildscan/features/Scan/screens/details_of_species_screen.dart';

class ImageClassificationController extends GetxController {
  final tfliteService = TFLiteService();

  Rx<File?> pickedImage = Rx<File?>(null);
  RxString predictionResult = 'Pick an image to classify'.obs;
  RxDouble confidence = 0.0.obs;
  RxBool loading = false.obs;
  RxBool showGetDetailsButton = false.obs;
  bool isFromCamera = false;

  @override
  void onInit() {
    super.onInit();
    tfliteService.loadModelAndClassNames();
  }

  Future<void> pickFromGallery() async {
    isFromCamera = false;
    await _pickImage(ImageSource.gallery);
  }

  Future<void> pickFromCamera() async {
    isFromCamera = true;
    await _pickImage(ImageSource.camera);
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
      predictionResult.value = 'Classifying...';
      loading.value = true;
      showGetDetailsButton.value = false;
      await runInference(pickedImage.value!);
    } else {
      predictionResult.value = 'No image selected.';
      loading.value = false;
      showGetDetailsButton.value = false;
    }
  }

  Future<void> runInference(File imageFile) async {
    final result = await tfliteService.predictImage(imageFile);
    double conf = 0.0;
    final regex = RegExp(r'Confidence:\s*([0-9.]+)\)');
    final match = regex.firstMatch(result);
    if (match != null) {
      conf = double.tryParse(match.group(1) ?? '') ?? 0.0;
    }
    predictionResult.value = result;
    confidence.value = conf;
    loading.value = false;

    // ✅ Only show button if confidence is 0.40 or higher
    showGetDetailsButton.value = confidence.value >= 0.40;
  }

  Future<void> navigateToDetails() async {
    final predictedName = predictionResult.value.split(' (')[0];
    if (predictedName.isEmpty) return;

    String? location;
    if (isFromCamera && _isRareOrEndangered(predictedName)) {
      final position = await Geolocator.getCurrentPosition();
      location = '${position.latitude}, ${position.longitude}';
    }

    Get.to(
      () => DetailsOfSpeciesScreen(
        scientificName: predictedName,
        imageFile: pickedImage.value!,
        location: location,
      ),
    );
  }

  bool _isRareOrEndangered(String name) {
    final lower = name.toLowerCase();
    return lower.contains('rare') || lower.contains('endangered');
  }

  @override
  void onClose() {
    tfliteService.dispose();
    super.onClose();
  }
}
