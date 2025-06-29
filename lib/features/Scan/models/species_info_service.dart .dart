// species_info_service.dart
import 'dart:convert';
import 'package:flutter_gemini/flutter_gemini.dart';

class SpeciesInfoService {
  final Gemini gemini;
  SpeciesInfoService({Gemini? geminiInstance})
    : gemini = geminiInstance ?? Gemini.instance;

  Future<Map<String, dynamic>?> fetchSpeciesDetails(
    String scientificName,
  ) async {
    final prompt =
        '''
Respond only with a JSON object using these keys: identifiedName, ScientificName, commonName, Description, Habitat, Characteristics, conservationStatus, PrimaryImage. 
The "PrimaryImage" field MUST be a direct image URL (ending with .jpg, .jpeg, .png, .webp, or .gif). DO NOT return search links, web pages, or anything that is not a direct image file. If you cannot find a valid image, use "" (empty string).
Scientific Name:$scientificName
''';
    final response = await gemini.text(
      prompt,
      modelName: "tunedModels/wildlife-tuned-model-2339",
    );
    String? jsonString = response?.output;
    if (jsonString != null) {
      jsonString = jsonString.replaceAll(RegExp(r'```json|```'), '').trim();
      print("Gemini output: $jsonString");
    }
    final jsonData = (jsonString != null && jsonString.isNotEmpty)
        ? jsonDecode(jsonString)
        : null;

    return jsonData is Map<String, dynamic> ? jsonData : null;
  }
}
