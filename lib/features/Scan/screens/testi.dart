import 'package:flutter_gemini/flutter_gemini.dart';

Future<void> testGeminiText() async {
  try {
    final gemini = Gemini.instance;
    final response = await gemini.text('Say hello!');
    print("Gemini says: ${response?.output}");
  } catch (e) {
    print("Gemini test failed: $e");
  }
}
