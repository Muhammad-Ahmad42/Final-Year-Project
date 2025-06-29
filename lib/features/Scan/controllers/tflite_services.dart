import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class TFLiteService {
  Interpreter? _interpreter;
  List<String>? _classNames;
  bool _isLoaded = false;

  Future<void> loadModelAndClassNames() async {
    try {
      // Load the model
      _interpreter = await Interpreter.fromAsset(
        'assets/models/animal_classifier.tflite',
      );
      print('Model loaded successfully');

      // Load class names
      final jsonStr = await rootBundle.loadString(
        'assets/models/class_names.json',
      );
      _classNames = List<String>.from(jsonDecode(jsonStr));
      print('Class names loaded successfully (${_classNames!.length})');

      _isLoaded = true;
    } catch (e) {
      print('Failed to load model or class names: $e');
    }
  }

  Future<String> predictImage(File imageFile) async {
    if (!_isLoaded || _interpreter == null || _classNames == null) {
      return 'Model not loaded yet.';
    }

    try {
      // Decode image
      img.Image? image = img.decodeImage(imageFile.readAsBytesSync());
      if (image == null) return 'Failed to decode image.';

      // Resize to model input size
      img.Image resized = img.copyResize(image, width: 224, height: 224);

      // Preprocess: ResNet50 mean subtraction (float32)
      var input = _preprocessImage(resized); // shape: [1, 224, 224, 3]

      // Output buffer
      var output = List.filled(
        _classNames!.length,
        0.0,
      ).reshape([1, _classNames!.length]);

      _interpreter!.run(input, output);

      // Find max confidence prediction
      double maxConfidence = output[0][0];
      int predictedIndex = 0;
      for (int i = 1; i < _classNames!.length; i++) {
        if (output[0][i] > maxConfidence) {
          maxConfidence = output[0][i];
          predictedIndex = i;
        }
      }

      return '${_classNames![predictedIndex]} (Confidence: ${maxConfidence.toStringAsFixed(2)})';
    } catch (e) {
      print('Error during prediction: $e');
      return 'Error during prediction.';
    }
  }

  /// ResNet50 mean subtraction
  List<List<List<List<double>>>> _preprocessImage(img.Image image) {
    const mean = [123.68, 116.779, 103.939];
    return [
      List.generate(
        224,
        (y) => List.generate(224, (x) {
          final pixel = image.getPixel(x, y);
          final r = pixel.r;
          final g = pixel.g;
          final b = pixel.b;
          return [r - mean[0], g - mean[1], b - mean[2]];
        }),
      ),
    ];
  }

  void dispose() {
    _interpreter?.close();
  }
}
